public class List_Example_3 {
    public String name 				{set;get;}
    public String phone				{set;get;}
    public String rating			{set;get;}
    public String lastName			{set;get;}
    public String firstName			{set;get;}
    public String email				{set;get;}
    public List<Contact> contacts 	{set;get;}
    public List<Account> accounts 	{set;get;}
    public List_Example_3(){
        accounts =new List<Account>();
    }
    public void addEle(){
        Account acc =new Account();
        acc.Name=name;
        acc.Phone=phone;
        acc.Rating=rating;
        accounts.add(acc);
    }
    public void reset(){
        name=null;
        phone=null;
        rating=null;
    }
}