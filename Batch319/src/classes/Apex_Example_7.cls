public class Apex_Example_7 {
    public void todayData(){
        List<Account> accounts =[select Id,name,Rating,ownership from Account where createdDate=TODAY];
        for(Account a:accounts){
            a.rating='Hot';
            a.Ownership='Public';
        }
        update accounts;
    }
    public void deleteToday(){
        List<Account> accounts =[select Id,name,Rating,ownership from Account where createdDate=TODAY];
        delete accounts;
    }
}