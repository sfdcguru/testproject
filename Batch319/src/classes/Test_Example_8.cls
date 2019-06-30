@isTest
public class Test_Example_8 {
	@isTest
    static void testMe(){
        Account_Dummy.create();
        Batch_Demo b=new Batch_Demo();
        Test.startTest();
        	Id jobId =Database.executeBatch(b,5);
        Test.stopTest();
        List<Account> accounts =[select id,rating from Account];
        for(Account a:accounts){
            System.assertEquals('Warm',a.rating);
        }
    }
}