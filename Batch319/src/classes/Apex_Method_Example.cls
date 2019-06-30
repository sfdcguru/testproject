public class Apex_Method_Example {
    public String name 		{set;get;}
    public String city 		{set;get;}
    public Decimal salary 	{set;get;}
    
    public void callMe(){
        name='Satish';
        city='SRNagar';
        salary=10000;
    }
    public void invoke(){
        name=null;
        city=null;
        salary=null;
        
    }
}