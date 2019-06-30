public class Apex_Message_Example {
    public Apex_Message_Example(){
        Apexpages.Message msg1 =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Success message');
        Apexpages.Message msg2 =new Apexpages.Message(Apexpages.Severity.ERROR,'Error Message');
        Apexpages.Message msg3 =new Apexpages.Message(Apexpages.Severity.WARNING,'Warning Message');
        Apexpages.Message msg4 =new Apexpages.Message(Apexpages.Severity.INFO,'Information Message');
        // add the message to the page 
        Apexpages.addMessage(msg1);
        Apexpages.addMessage(msg2);
        Apexpages.addMessage(msg3);
        Apexpages.addMessage(msg4);
    }
}