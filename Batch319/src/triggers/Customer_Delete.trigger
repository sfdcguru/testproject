trigger Customer_Delete on Customer__c (before delete) {
    // get all the records which we are trying to delete 
    List<Customer__c> customers =Trigger.old;
    List<Id> inActiveId=new List<Id>();
    // fetch all the inactive customeris 
    for(Customer__c c: customers){
        if(c.Active__c==false){
            inActiveId.add(c.Id);
        }
    }
    // fetch all the payments of those inactive customers 
    List<Loan__c> loans =[select id from Loan__C where Customer__c in :inActiveId];
    delete loans;
    

}