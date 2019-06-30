public class SOQL_Example_2 {
    public List<Account> accounts {set;get;}
    public SOQL_Example_2(){
        List<String> fieldNames =new List<String>{'Name','Rating','Industry','Phone'};
        String queryString='select Id';
        for(String s:fieldNames){
            queryString=queryString+','+s;			
        }
        queryString=queryString+' from Account';
        accounts=Database.query(queryString);
    }
}