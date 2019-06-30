public class Invoke_Example_2 {
	@InvocableMethod(label='Example')
    public static void callMe(List<Id> ids){
        List<Account> accounts =[select id from Account where ownerId in:ids and createddate=THIS_Month];
        delete accounts;
    }
}