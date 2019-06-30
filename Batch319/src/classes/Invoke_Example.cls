public class Invoke_Example {
	@InvocableMethod(label='Get Account Names')
    public static void callMe(List<Id> ids){
       List<Contact> contacts =[select id from Contact where AccountId in:ids];
        delete contacts;
    }
    public void show(){
        
    }
   
    public void cancel(){
        
    }
    
}