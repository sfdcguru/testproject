// Any apex class that want to handle the inbound email has to implement 
// interface : Messaging.InboundEmailHandler
// handleInboundEmail(): Any class which is implementing above interface has to define 	this method 
// a. Messaging.InboundEmailResult : 
// 	  a. This class will contain one variable : success 
// 	  b. If the email is handled successfully then sucess is set as true 
// 	  c. If the email is not-handled successfully then success is set as false.
// 	  
//  b.Messaging.InboundEmail : 
//    a.This class will contain the email what we have received from the external syste,
//    b . toAddress ,fromAddress ,.....
//    
//  c.Messaging.InboundEnvelope :
//    a. This class will contain the to and from address from which we have received the email
//    
// 	  
public class Inbound_Example_1 implements Messaging.InboundEmailHandler {
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email ,Messaging.InboundEnvelope env){
       	Messaging.InboundEmailResult result =new Messaging.InboundEmailResult();
        try{
            String name =email.fromName;
             String fromAddress=email.fromAddress;
            // find the contact based on fromAddress
             Contact c=[select id from Contact where email=:fromAddress limit 1];
            // Create a case 
            Case cs =new Case();
            cs.contactId=c.Id;
            cs.Subject=email.subject;
            cs.Priority='Normal';
            cs.origin='Email';
            cs.Status='New';
            cs.Description=email.plainTextBody;
            insert cs;
            result.success=true;
        }catch(Exception e){
            result.success=false;
        }
        return result;
    }
}