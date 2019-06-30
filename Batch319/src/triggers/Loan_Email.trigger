trigger Loan_Email on Loan__c (after insert) {
    // fetch all the loans which we have inserted
    List<Loan__c> loans =Trigger.new;
    // Create a map with CustomerId as key and List of corresponding loans as value 
    Map<Id,List<Loan__c> > custMap =new Map<Id,List<Loan__c>>();
    // Take one by one loan and perform the logic
    for(Loan__c ln :loans){
        Id custId=ln.customer__c;
        Boolean flag =custMap.containskey(custId);
        List<Loan__c> newList ;
        if(flag ==true){
            // if customerId is found in the map, get the list of loans for this customerId from the map
           newList =custMap.get(custId);
           newList.add(ln);  
        }else{
            // if the customerId is not found in the map then create new list
            newList =new List<Loan__c>();
            newList.add(ln);
        }
        custMap.put(custId,newList);
    }
}