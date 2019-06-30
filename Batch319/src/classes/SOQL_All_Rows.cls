public class SOQL_All_Rows {
    public List<Account> accounts {set;get;}
    public SOQL_All_Rows(){
        accounts =[select id,Name,Phone,Industry,Rating from Account];
    }
    public void getAll(){
        // All Rows : This will return all the records including the records which are deleted
        accounts =[select id,Name,Phone,Industry,Rating from Account ALL ROWS];
    }
}