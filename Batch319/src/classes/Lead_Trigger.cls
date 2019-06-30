public class Lead_Trigger {
    public static void callMe(List<Lead> leads){
        List<String> toadd= new List<String>();
        for(Lead l :leads){
            toadd.add(l.email);
        }
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        msg.setToAddresses(toadd);
        msg.setSubject('Testing');
        msg.setPlainTextBody('Testing');
        Messaging.Email[] emails =new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
    }
}