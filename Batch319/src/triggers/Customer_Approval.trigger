trigger Customer_Approval on Customer__c (after insert) {
	List<Customer__c > customers =Trigger.new;
    for(Customer__c c: customers){
        Approval.ProcessSubmitRequest request =new Approval.ProcessSubmitRequest();
        request.setObjectId(c.Id);	// Id of the record to which we are submiting
        request.setProcessDefinitionNameOrId('NewCustomer');
        User u =[select id from user where firstName='wilson'];
        request.setSubmitterId(u.Id);
        Id[] approverids =new Id[]{c.AgentManager__c};
        request.setNextApproverIds(approverids);
         Approval.ProcessResult result =Approval.process(request);
        System.debug(result.isSuccess());
    }
}