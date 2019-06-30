@isTest
public class Test_Example_1 {
	@isTest
    static void testMe(){
        Apex_Example ae =new Apex_Example();
        ae.callMe();
        System.assertEquals('Satish', ae.name);
        System.assertEquals('Energy',ae.Industry);
        System.assertEquals('Hot',ae.rating);
    }
}