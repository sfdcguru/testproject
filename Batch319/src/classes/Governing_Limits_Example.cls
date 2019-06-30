public class Governing_Limits_Example {
	// no of soql queries in a transaciton should be maximum : 100
    public void one(){
        List<Account> accounts =[select id from Account];
        List<Contact> contacts =[select id from Contact];
        for(Integer i=1;i<=50;i++){
            List<Case> cases =[select id from Case];
        }
        two();
    }
    public void two(){
        for(Integer i=1;i<=50;i++){
            List<Account> accounts =[select id from Account];
        }
    }
    // in the a transaction we can at max define 150 dml statements 
    public void three(){
        List<Account> accounts =new List<Account>();
        for(Integer i=1;i<=5000;i++){
            Account acc =new Account(name='I',industry='Banking');
          	accounts.add(acc);
        }
        insert accounts;
        delete accounts;
        undelete accounts;
       
        
    }
    public void four(){
        for(Integer i=1;i<100;i++){
            Account acc =new Account(name='I',industry='Banking');
            insert acc; 
        } 
    }
}