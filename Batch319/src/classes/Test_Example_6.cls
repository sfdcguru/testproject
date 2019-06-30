@isTest
public class Test_Example_6 {
	@isTest
    static void testMe(){
        Apex_Example_6 ae =new Apex_Example_6();
        ae.Name='Testing';
        ae.Industry='Energy';
        ae.rating='Hot';
        ae.create();
        Integer count =[select count() from Account where name=:ae.name and industry=:ae.industry and rating=:ae.rating];
        System.assertEquals(1,count);
    }
    @isTest
    static void show(){

        Account_Dummy.create();
        Apex_Example_6 ae =new Apex_Example_6();
        ae.callMe();
        List<Account> accounts =[select Id,Rating from Account];
        for(Account a: accounts){
            System.assertEquals('Warm',a.rating);
        }
    }
    @isTest
    static void deleteData(){
         Account_Dummy.create();
         Apex_Example_6 ae =new Apex_Example_6();
         ae.invoke();
         Integer count =[select count() from Account ];
         System.assertEquals(0,count);
    }
}