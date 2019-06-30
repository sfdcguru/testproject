public class Apex_Message_2 {
    public String name		{set;get;}
    public String city  	{set;get;}
    public Decimal salary 	{set;get;}
    public void callMe(){
        if(city!=''&& salary>0){
            Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.CONFIRM,'Record Submitted successfully');
            Apexpages.addMessage(msg);
        }else{
            if(city==''){
                Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.ERROR,'City is a required field');
                Apexpages.addMessage(msg);
            }
            if(salary<=0){
                Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.Error,'Salary cannot be less than 0');
            	Apexpages.addMessage(msg);
            }
        }
    }
}