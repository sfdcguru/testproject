public class Outbound_Email_4 {
    public void callMe(){
        // Fetch Id of the email template which you want to send
        EmailTemplate et =[select id from EmailTemplate where name='Account Details'];
        
        // Fetch the contact to whom you want to send the email template 
        // TargetObjectId : id of a user or contact or lead 
        Contact con =[select id,AccountId from Contact where phone='9876'];
        // Messaging.MassEmailMessage
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        //set the template to message 
        msg.setTemplateId(et.id);
        msg.setTargetObjectId(con.Id);	// Id of the contact to whom you want to send
        //msg.setTargetObjectIds(list<Id>)
        msg.setWhatId(con.accountId); 	// Id of the account whose data you want to send in the email template
        Messaging.Email[] emails =new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
        									
        
    }
    public void invoke(){
        
         // Fetch Id of the email template which you want to send
        EmailTemplate et =[select id from EmailTemplate where name='Account Details'];
        
        // Fetch the contact to whom you want to send the email template 
        // TargetObjectId : id of a user or contact or lead 
        List<Contact> contacts =[select id,AccountId from Contact where phone='9876'];
        List<Id> conIds =new List<Id>();
        for(Contact c:contacts){
            conIds.add(c.Id);
        }
        Account acc=[select id from Account limit 1];
        // Messaging.MassEmailMessage
        Messaging.MassEmailMessage msg =new Messaging.MassEmailMessage();
        //set the template to message 
        msg.setTemplateId(et.id);
        msg.setTargetObjectIds(conIds);
              //msg.setTargetObjectIds(list<Id>)
        msg.setWhatIds(new List<Id>{acc.Id});
        Messaging.Email[] emails =new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
    }
    
}