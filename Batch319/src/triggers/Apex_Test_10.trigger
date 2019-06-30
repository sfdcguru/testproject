trigger Apex_Test_10 on Account (before insert) {
    List<Account> accounts =Trigger.new;
    for(Account a:accounts){
        a.ownership='Public';
        a.Rating='Hot';
    }
}