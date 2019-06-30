public class Mass_Email_Example {
    public List<Lead> leads {set;get;}
    public Mass_Email_Example(Apexpages.StandardSetController controller){
        List<String> fields =new List<String>{'FirstName','LastName','Phone','Email'};
        controller.addFields(fields);
        leads =(List<Lead>)controller.getSelected();
    }
    public PageReference callMe(){
        List<Messaging.Email> emails =new List<Messaging.Email>();
        for(Lead l:leads){
            Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
            String[] toadd =new String[]{l.email};
            msg.setToAddresses(toadd);
            msg.setSubject('Lead Alert');
            String body='Dear '+l.firstName;
            body=body+'<br/> Your Details are <br/> Phone :'+l.phone +'<br/> Thanks <br/>Sales Team';
            msg.setHtmlBody(body);
            emails.add(msg);
        }
        Messaging.sendEmail(emails);
        PageReference p=new PageReference('/00Q?fcf=00B0o00000EBQil');
        return p;
    }
}