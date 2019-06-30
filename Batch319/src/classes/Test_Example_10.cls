@isTest
public class Test_Example_10 {
	@isTest
    static void testMe(){
        Account acc =new Account();
        acc.Name='Testing';
        acc.Industry='Energy';
        insert acc;
        Account a =[select id,Rating,Ownership from Account where id=:acc.Id];
        System.assertEquals('Hot',a.rating);
        System.assertEquals('Public',a.ownership);
    }
}