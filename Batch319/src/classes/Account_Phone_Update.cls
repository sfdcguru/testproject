// When ever the account phone number is modified update corresponding contacts 
// otherphone as account old phone and mobilephone as account new Phone 
// Wipro---1234
// 	|----Con---1234
// 	|----Con---1234
public class Account_Phone_Update {
    public static void callMe(Map<Id,Account> oldMap, Map<Id,Account> newMap){
       // 1. Fetch the Id's of accounts which are updated
       Set<Id> recordIds=oldMap.keySet();
       // 2. Create a list to store Id's of account records whose phone is modifed.
       List<Id> accIds=new List<Id>();
       // 3. Take one by account and verify phone is modified or not
       for(Id key : recordIds){
          Account old =oldMap.get(key);
          Account acc =newMap.get(key);
           //4. check phone is modified or not 
           if(old.phone!=acc.phone){
               // if phone number is modified add recordId to accIds
               accIds.add(key);
           }
       }
       //5. Fetch all the contacts of those accounts whoes accountid in accIds
       List<Contact> contacts =[select id,AccountId,MobilePhone,Otherphone from Contact where AccountId in:accIds];
       //6. Take one by one contact  from the list 
        for(Contact c:contacts){
            // 7. get accountId 
            Id key =c.AccountId; 
            // 8. get old Account  and new Account
            Account old =oldMap.get(key);
            Account acc =newMap.get(key);
           // 9. Set oldPhone to otherphone and newPhone to mobilPhone
           c.otherphone=old.Phone;
           c.mobilePhone=acc.Phone;
        }
        update contacts;
    }
    // When ever opportunity stageName is Modified to closed won Create wilson as OpportunityTeamMember
    // Note : enable opportunityTeams
    // Setup-- > Build---> Customize---> Opportunity----> OpportunityTeam---> Enable Settings 
    // Add the opportunityTeam to pageLayout 
    public static void createTeam(Map<Id,Opportunity> oldMap, Map<Id,Opportunity> newMap){
        //1. Fetch the opportunityId's
        Set<Id> recordIds=oldMap.keySet();
        //2. Create List to store OpportunityteamMember 
        List<OpportunityTeamMember> teams =new List<OpportunityTeamMember>();
        //3. Write a query on user to fetch wilson id
        User u =[select id from user where firstName='wilson'];
        //4. Take one by one opportunity and check stageName is modified to closed won
        for(Id key :recordIds){
            Opportunity Old =oldMap.get(key);
            Opportunity opt =newMap.get(key);
            if(old.stageName!='Closed won' && opt.stageName=='Closed Won'){
                // 5. Create OpportunityTeammember 
                //   a. OpportunityId : Id of the record on which we want to create Teammember 
                //   b. UserId  : Id of the user whom we want to create as TeamMember
                //   c. OpportunityAccessLevel : Type of access you want to give
                //   d. TeamMemberRole : Role of the user
                OpportunityTeamMember otm =new OpportunityTeamMember();
                otm.OpportunityId=key;
                otm.userId=u.Id;
                otm.OpportunityAccessLevel='Read';
                otm.TeamMemberRole='Account Manager';
                teams.add(otm);
            }
        }
        // 6. insert teams 
        insert teams;
    }
}