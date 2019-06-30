trigger Account_Example on Account (before insert) {
    Id uid =UserInfo.getUserId();
    User u =[select id from User where firstName='Satish'];
	Testing__c tst =Testing__c.getInstance(uid);
    if(tst.Active__c==true){
        for(Account a: Trigger.new){
            a.Industry='Energy';
            a.rating='Hot';
        }
    }
}