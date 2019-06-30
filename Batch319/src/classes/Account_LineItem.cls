public class Account_LineItem {
    public List<Account_Wrapper> accounts {set;get;}
    public Account_LineItem(){
        accounts=new List<Account_Wrapper>();
        add();
    }
    public void add(){
        Account_Wrapper aw =new Account_Wrapper();
        aw.acc =new Account();
        aw.con=new Contact();
        accounts.add(aw);
    }
}