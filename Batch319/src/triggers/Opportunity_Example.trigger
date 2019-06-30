/* 1. When a new Opportunity is Created with StageName as closed won then 
 *    share the record with the Manager on Opportunity
 * 
 * a. OWD on the Opportunity should be Private or Public Read
 * b. User with whom we are sharing that user profile should not permission of ViewAll or modify all 
 *     on opportunity 
 */
trigger Opportunity_Example on Opportunity (after insert) {
    
    //fetch opportunities which we have saved newly
    List<Opportunity> optyList =Trigger.New;
    
    List<OpportunityShare> share =new List<OpportunityShare>();
    for(Opportunity op:optyList){
        if(op.StageName=='Closed Won'){
            OpportunityShare os =new OpportunityShare();
            os.OpportunityId=op.Id; //Id of the opportunity which we want to share
            os.OpportunityAccessLevel='Read'; // Type of Access (Read/Edit)
            os.UserOrGroupId=op.Manager__c;  // User with whom we are sharing
            os.RowCause='Manual';           // Reason for sharing   
            share.add(os);
        }
    }
    if(share.size()>0){
        insert share;
    } 
}