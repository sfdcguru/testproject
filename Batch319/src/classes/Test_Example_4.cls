@isTest
public class Test_Example_4 {
	@isTest
    static void testMe(){
        Apex_Example_4 ae =new Apex_Example_4();
        ae.Industry='Education';
        ae.callMe();
        System.assertEquals('Warm',ae.rating);
        System.assertEquals('Private',ae.Ownership);
        ae.Industry='Energy';
        ae.callMe();
        System.assertEquals('Hot',ae.rating);
        System.assertEquals('Public',ae.Ownership);
    }
    testmethod static void invoke(){
        Apex_Example_5 ae =new Apex_Example_5();
        ae.age=60;
        ae.callMe();

        System.assertEquals(50000,ae.salary);
        System.assertEquals(4000,ae.bonus);
        ae.age=25;
        ae.callMe();
        System.assertEquals(30000,ae.salary);
        System.assertEquals(2000,ae.bonus);
    }
}