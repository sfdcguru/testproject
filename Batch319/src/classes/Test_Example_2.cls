@isTest
public class Test_Example_2 {
	@isTest
    static void testMe(){
        Apex_Example_2 ae =new Apex_Example_2();
        ae.callMe();
        System.assertEquals('Myla',ae.lastName);
        System.assertEquals('Satish',ae.firstName);
        System.assertEquals('040-1234',ae.phone);
    }
}