public class Contacts_Alert {
    public Account acc {set;get;}
    public List<Contact> contacts {set;get;}
    public Contacts_Alert(Apexpages.StandardController controller){
        // controller.getRecord() : This will give only recordId of the record from where we clicked button
        List<String> fields =new List<String>{'Name','Phone'};
        controller.addFields(fields);
        acc =(Account)controller.getRecord();
        contacts =[select Id,Email,Phone,LastName,FirstName from Contact where AccountId=:acc.Id];
    }
    public PageReference callMe(){
      
        List<Messaging.SingleEmailMessage> emails =new List<Messaging.SingleEmailMessage>();
        for(Contact c:contacts){
            Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
            String[] toadd=new String[]{c.email};
            msg.setToAddresses(toadd);
            msg.setSubject('Update Contact Details ');
            String body='Dear '+c.firstName+',<br/> your Currernt Details are <br/>';
            body=body+'<b>Email :</b><i>'+c.email+'</i><br/>';
            body=body+'<b>Phone :</b><i>'+c.phone+'</i><br/>';
            body=body+'Update the detail in case of any modifications <br/> Thank <br/> Sales Team';
            msg.setHtmlBody(body);
            emails.add(msg);
        }
        Messaging.sendEmail(emails);
       PageReference p=new PageReference('/'+acc.Id);
        return p;
    }
}