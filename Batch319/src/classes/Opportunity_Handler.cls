public class Opportunity_Handler {
    public static void shareOpty(List<Opportunity> opty){
      	  //1. fetch the Id of the wilson
      	  User u=[select id from user where firstName='wilson'];
          List<OpportunityShare> share =new List<OpportunityShare>();
          // fetch those opportunities whose stageName is closed won
        	for(Opportunity op:opty){
                if(op.stageName=='Closed Won'){
                    OpportunityShare os =new OpportunityShare();
                    os.OpportunityId=op.Id;
                    os.OpportunityAccessLevel='Read';
                    os.UserOrGroupId=u.Id;
                    os.RowCause='Manual';
                    share.add(os);
                }
        	}
        	insert share;
    }
    public static void CreateTeam(List<Opportunity> optyList){
        User u=[select id from user where firstName='wilson'];
        List<AccountTeamMember> teams =new List<AccountTeamMember>();
        for(Opportunity op:optyList){
            if(op.Type=='New Customer'){
                AccountTeamMember atm =new AccountTeamMember();
                atm.AccountId=op.AccountId;
                atm.UserID=u.Id;
                atm.AccountAccessLevel='Read';
                atm.TeamMemberRole='Account Manager';
                teams.add(atm);
            }
        }
        insert teams;
    }
    public static void afterUpdate(Map<Id,Opportunity> oldMap,Map<Id,Opportunity> newMap){
        List<OpportunityShare> share =new List<OpportunityShare>();
        // 1.Get the opportunityId
        Set<Id> optyIds =oldMap.keySet();
        /* 
         * 2. Fetch the detail of Opportunity's Accountid and Account OwnerId
         	Child to Parent SOQL
         	List<Child> childs=[select ChildField1,ChildField2,RField.ParentField from Child];
        	In the Opportunity and Account : connected by LookupField: Account
			*/
        List<Opportunity> optyList=[select id,AccountId,Account.OwnerId from Opportunity where Id in:optyIds];
        /* 
         * 3. Create map with opportunity accountId as key and 
         *    opportunity Account owner of the account as value 
         */
        Map<Id,Id> accMap =new Map<Id,Id>();
        for(Opportunity op:optyList){
            accMap.put(op.AccountId,op.Account.OwnerId);
        }
        /* 
         * Check stageName is modified to closed won or not 
         * If modified then Share the record with opportuntiy Account owner  with read access
         */
        for(Id key :optyIds){
            Opportunity old =oldMap.get(Key);
            Opportunity opty=newMap.get(key);
            if(old.StageName!=opty.stageName && opty.StageName=='Closed Won'){
                OpportunityShare os =new OpportunityShare();
                os.OpportunityId=key;
                os.OpportunityAccessLevel='Read';
                os.UserOrGroupId=accMap.get(opty.AccountId); // this will return Account ownerId
                os.RowCause='Manual';
                share.add(os);
            }
        }
        insert share;
    }
}