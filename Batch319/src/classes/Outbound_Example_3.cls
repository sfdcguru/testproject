public class Outbound_Example_3 {
    public void callMe(){
        // Fetch the data from document object  and create email file attachment
        Document d=[select Name,body from Document where name='Test'];
        Messaging.EmailFileAttachment at1 =new Messaging.EmailFileAttachment();
        at1.setFileName(d.name+'.txt');
        at1.setBody(d.body);
        // Convert the VF page into EmailFile attachment
        PageReference  p=Page.Invoice_Page;
        Blob body=p.getContentAsPDF();
        Messaging.EmailFileAttachment at2 =new Messaging.EmailFileAttachment();
        at2.setFileName('invoice.pdf');
        at2.setBody(body);
        
        // Put all the files in the list 
        Messaging.EmailFileAttachment[] files =new Messaging.EmailFileAttachment[]{at1,at2};
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        String[] toadd=new String[]{'salesforcebatch300@gmail.com'};
        msg.setToAddresses(toadd);
        msg.setSubject('File Attachment');
        msg.setPlainTextBody('This is a test message');
        msg.setFileAttachments(files);
        Messaging.Email[] emails =new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
        
    }
}