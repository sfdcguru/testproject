public class SOQL_Example_1 {
    public List<Account> accounts {set;get;}
    public SOQL_Example_1(){
        accounts =[select Name,Phone,Industry ,Rating from Account];
    }
    public void show(){
         accounts =[select Name,Phone,Industry ,Rating from Account];
    }
}