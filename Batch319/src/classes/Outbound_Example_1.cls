/* Fetch all the  leads created today and send a email to those leads */
public class Outbound_Example_1 {
    public void callMe(){
        // Fetch all the leads which are created this week
        List<Lead> leads =[select id,Email from Lead where createdDate=THIS_WEEK];
        // Put all the email address in a new List :emails
        List<String> emails=new List<String>();
        for(Lead l:leads){
            emails.add(l.email);
        }
        // Create a singleEmailMessage 
        Messaging.SingleEmailMessage msg1 =new Messaging.SingleEmailMessage();
        // pass the list of emails fetched in line :9 as toAddress
        msg1.setToAddresses(emails);
        String[] cc=new String[]{'force2crm@gmail.com'};
        msg1.setCcAddresses(cc);
        String[] bcc=new String[]{'salesforcebatch300@gmail.com'};
        msg1.setBccAddresses(bcc);
        msg1.setSubject('Test Mail ');
        msg1.setPlainTextBody('This is a test mail from salesforce apex ');
        msg1.setSenderDisplayName('Development319');
        
        Messaging.SingleEmailMessage msg2 =new Messaging.SingleEmailMessage();
        msg2.setToAddresses(emails);
        msg2.setSubject('Test Message for HTML');
        String body='<h2> Dear Customer,<br/> Your request is received ,our agent';
        body=body+'will callback in<i> 24 working hours </i><br/> Thanks <br/> Sales Team';
        msg2.setHtmlBody(body);
        // put all the email messages created in a list
        List<Messaging.Email>  messages =new List<Messaging.Email>{msg1,msg2};
        Messaging.sendEmail(messages);
	        
    }
}