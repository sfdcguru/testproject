trigger Account_Update on Account (before update ) {
    if(Trigger.isBefore && Trigger.isUpdate){
        Account_Phone_Update.callMe(Trigger.oldMap,Trigger.newMap);
    }
}