trigger Opty_Teams on Opportunity (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        Account_Phone_Update.createTeam(Trigger.oldMap,Trigger.newMap);
    }
}