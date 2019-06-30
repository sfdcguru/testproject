@isTest
public class Test_Example_9 {
	@isTest
    static void callMe(){
        Account_Dummy.create();
        Schedule_Demo sd =new Schedule_Demo();
        String str ='0 30 10  15 6 ?';
        Test.startTest();
        	Id jobId=System.schedule('MyJob',str,sd);
        Test.stopTest();
        // Test the expression
        CronTrigger ct =[select Id,CronExpression from CronTrigger where Id=:jobId];
        System.assertEquals(str,ct.CronExpression);
        Integer count =[select count() from Account where createddate =TODAY];
        System.assertEquals(0,count);
    }
}