/* Description : When ever a new Account is Created with Industry as Banking create a new Opportunity 
 *               for The account 
 *              OpportunityName : Account-
 */
trigger Account_Opty on Account (after insert) {
    // Fetch all the new accounts which are saved successfully
    List<Account> accounts =Trigger.new;    
    List<Opportunity> optyList =new List<Opportunity>();
    for(Account a: accounts){
        if(a.industry=='Banking'){
            Opportunity op =new Opportunity();
            op.Name=a.Name;
            op.StageName='Prospecting';
            op.closeDate=System.today();
            op.AccountId=a.Id; // Id of the parent record should be passed to lookup field
            optyList.add(op);
        }
    }
    if(optyList.size()>0)
    insert optyList;

}