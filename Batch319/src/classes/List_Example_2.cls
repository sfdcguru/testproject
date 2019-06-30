public class List_Example_2 {
    public List<Account> accounts {set;get;}
    public Account acc 			  {set;get;}
    public List_Example_2(){
        accounts =new List<Account>();
        acc =new Account();
    }
    public void addEle(){
        accounts.add(acc);
        acc =new Account();
    }
    public void clear(){
        accounts.clear();
    }
    public void reset(){
        acc =new Account();
    }
}