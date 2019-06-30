@isTest
public class Account_Dummy {
    public static void create(){
        Account a1 =new Account(Name='Testing1',Phone='040-1111');
        Account a2 =new Account(Name='Warm',Phone='20-12333');
        List<Account> accounts =new List<Account>{a1,a2};
        insert accounts;
    }
}