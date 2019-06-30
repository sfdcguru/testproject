public class Apex_Example_6 {
    public String name 			{set;get;}
    public String industry 		{set;get;}
    public String rating		{set;get;}
    public void create(){
        Account acc =new Account();
        acc.Name=name;
        acc.Industry=industry;
        acc.Rating=rating;
        insert acc;
    }
    public void callMe(){
        List<Account> accounts =[select Id,Name,Rating from Account ];
        for(Account a:accounts){
            a.rating='Warm';
        }
        update accounts;
    }
    public void invoke(){
        List<Account> accounts =[select id from Account];
        delete accounts;
    }
}