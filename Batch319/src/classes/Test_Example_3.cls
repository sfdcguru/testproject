@isTest
public class Test_Example_3 {
	@isTest
    static void testMe(){
        Apex_Example_3 ae =new Apex_Example_3();
        ae.callMe('Satish',50);
        System.assertEquals('Satish',ae.name);
        System.assertEquals(50,ae.age);
        ae.calculate();
        System.assertEquals(50000,ae.salary);
        System.assertEquals(3000,ae.bonus);
    }
}