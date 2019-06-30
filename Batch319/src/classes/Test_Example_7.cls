@isTest
public class Test_Example_7 {
	@isTest
    static void testMe(){
        Account_Dummy.create();
        Apex_Example_7 ae =new Apex_Example_7();
        ae.todayData();
        List<Account> accounts =[select id,name,rating,industry from Account where createdDate=TODAY];
        for(Account a:accounts){
            System.assertEquals('Hot',a.rating);
            System.assertEquals('Public',a.ownership);
        }
        ae.deleteToday();
        Integer count =[select count() from Account where CreatedDate=TODAY];
        System.assertEquals(0,count);
    }
}