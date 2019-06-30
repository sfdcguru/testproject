public class SOQL_Order_By_Example {
    public List<Account> accounts {set;get;}
    public SOQL_Order_By_Example(){
        accounts =[select id,Name,Industry,Rating,Phone from Account];
    }
    public void sortByName(){
        //order by FieldName ASC/DESC
        accounts =[select id,Name,Industry,Rating,Phone from Account order by Name];
    }
    public void sortByNamePhone(){
        //order by FieldName ASC/DESC ,FieldName ASC/DESC
        accounts =[select id,Name,Industry,Rating,Phone from Account order by Name ASC, Phone Desc];
    }
}