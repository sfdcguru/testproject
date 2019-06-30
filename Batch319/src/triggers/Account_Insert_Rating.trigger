trigger Account_Insert_Rating on Account (before insert) {
    // Trigger.new : This will contain list of new records which we are inserting 
    List<Account> accounts =Trigger.new;
    for(Account a: accounts){
        a.rating='Warm';
        a.Active__c='Yes';
    }
    

}