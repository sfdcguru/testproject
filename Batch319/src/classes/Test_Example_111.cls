@isTest
public class Test_Example_111 {
    public static void create(){
        Lead l=new Lead();
        l.email='abc@xyz.com';
        l.lastName='Myla';
        l.company='Testing';
        insert l;
    }
    @isTest
    static void testMe(){
        create();
        Lead l=[select id ,firstName from Lead limit 1];
        l.firstName='Satish';
        update l;
        Integer count =Limits.getEmailInvocations();
        System.debug(count);
        System.assertEquals(1,count);
    }
}