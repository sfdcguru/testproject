public class Mixed_DML_Example {
    public  void callMe(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Test'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
        // Create new user with a non-null user role ID 
        User u = new User(alias ='wil', email='salesforcebatch300@gmail.com', 
            emailencodingkey='UTF-8', lastname='wilson', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='wilson@dev319test.com');
        insert u;
       invoke();
    }
    @future
    public static void invoke(){
         Account acc =new Account();
        acc.Name='Testing';
        acc.Phone='020-1234';
        acc.Rating='Hot';
        insert acc;
    }
}