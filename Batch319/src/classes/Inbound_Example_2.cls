public class Inbound_Example_2 implements Messaging.InboundEmailHandler{
   public  Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result =new Messaging.InboundEmailResult();
        try{
            // fetch fromAddress 
            String emailAdd=email.fromAddress;
            Contact con=[select id from Contact where email =:emailAdd limit 1];
            Case c=new Case();
            c.contactId=con.Id;
            c.subject=email.subject;	// subject in the email is subject of case 
            c.description=email.plainTextBody;	// body of the email what we received is the description of case
            c.origin='Email';
            c.Priority='Noraml';
            c.Status='New';
            insert c;
           
            // fetch the files we recevied in the email
            Messaging.InboundEmail.binaryAttachment[] files =email.binaryAttachments;
            List<Attachment> attachments =new List<Attachment>();
            for(Messaging.InboundEmail.binaryAttachment f: files){
                Attachment a =new Attachment();
                a.name=f.fileName;
                a.body=f.body;
                a.ParentId=c.Id;
                attachments.add(a);
            }
            insert attachments;
            result.success=true;
        }catch(Exception e){
            result.success=false;  
        }
        
        return result;
    }
}