public class Apex_Set_Example {
    public String name 		{set;get;}
    public Decimal amount 	{set;get;}
    public Decimal salary	{set;get;}
    public void setData(){
        if(name=='TCS'){
            amount=50000;
            salary=12345;
        }else{
            amount=90000;
            salary=99999;
        }
    }
}