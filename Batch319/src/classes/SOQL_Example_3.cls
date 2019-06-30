public class SOQL_Example_3 {
    public Map<Id,Account> accMap {set;get;}
    public SOQL_Example_3(){
        accMap =new Map<Id,Account>([select Name,Phone,Industry,Rating from Account]);
    }
}