trigger Opty_hanler on Opportunity (before insert,after insert, after update) {
    if(Trigger.isBefore && Trigger.isInsert){
        Opportunity_Handler.CreateTeam(Trigger.new);
    }else{
        if(Trigger.isAfter && Trigger.isinsert){
           Opportunity_Handler.shareOpty(Trigger.new); 
        }else{
            Opportunity_Handler.afterUpdate(Trigger.oldMap, Trigger.newMap);
        }
    }
}