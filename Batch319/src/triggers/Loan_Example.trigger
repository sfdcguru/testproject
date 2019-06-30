trigger Loan_Example on Loan__c (before insert) {
    List<Loan__c> loans =Trigger.new;
    for(Loan__c c: loans){
        if(c.Customer__c ==null){
            c.addError('Customer Should be choosen before saving');
        }
    }
}