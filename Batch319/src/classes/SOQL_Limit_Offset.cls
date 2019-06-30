public class SOQL_Limit_Offset {
    public List<Account> accounts {set;get;}
    public Integer size{set;get;}
    public SOQL_Limit_Offset(){
        size=10;
        accounts =[select Name,Phone,Industry,Rating from Account];
    }
    public void myLimit(){
        accounts =[select Name,Phone,Industry,Rating from Account limit 4];
    }
     public void myDLimit(){
        accounts =[select Name,Phone,Industry,Rating from Account limit :size];
    }
    public void myOffset(){
        accounts =[select Name,Phone,Industry,Rating from Account offset 20]; 
    }
    public void myDOffset(){
        accounts =[select Name,Phone,Industry,Rating from Account offset:size]; 
    }
     public void myLimitoffset(){
        accounts =[select Name,Phone,Industry,Rating from Account limit 5  offset 10]; 
    }
}