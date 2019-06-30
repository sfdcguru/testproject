public class Action_Pooler_Example {
    public String result    {set;get;}
    public Integer count    {set;get;}
    public Action_Pooler_Example(){
        count=0;
        result='Time :'+System.now()+ ': Count :'+count;
    }
    public void callMe(){
        count=count+1;
        result='Time :'+System.now()+ ': Count :'+count; 
    }
    public void invoke(){
        List<Account> accounts =new List<Account>();
        for(Integer i=1;i<=2000;i++){
            Account a=new Account();
            a.Name='Account'+i;
            a.Phone='040-1111';
            accounts.add(a);
        }
        insert accounts;
        delete accounts;
        List<Account> myList =[select id from Account where isDeleted=true  ALL ROWS];
        Database.emptyRecyclebin(myList);
    }
}