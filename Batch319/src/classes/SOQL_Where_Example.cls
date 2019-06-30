public class SOQL_Where_Example {
    public String searchText		{set;get;}
    public List<Account> accounts 	{set;get;}
    public void search(){
       accounts =[select Name,Phone,Industry,Rating from Account where name=:searchText or industry=:searchText];
    }
}