public class DML_Insert_One {
    public Account acc 				{set;get;}
    public List<Contact> contacts   {set;get;}
    public DML_Insert_One(){
        acc=new Account();
        contacts =new List<Contact>();
        addContact();
    }
    /* This method add one new contact to the Contacts list */
    public void addContact(){
        Contact c =new Contact();
        contacts.add(c);
    }
    public PageReference create(){
        PageReference p;
        /* Verify duplicate records based on acc.Name */
        Integer count =[select count() from Account where name=:acc.Name];
        /* if count is greater than zero then duplicate record exist then throw error message */
        if(count>0){
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,'Duplicate Account exists');
            Apexpages.addMessage(msg);
            
        }else{
            /* if count is zero ,no duplicate record found insert account and create the 
             * contacts fro account */
            insert acc;
            //insert the contacts for the account
            for(Contact c:contacts){
                c.AccountId=acc.Id;
            }
            insert contacts;
            p=new PageReference('/'+acc.Id); 
        }
        return p;
    }
}