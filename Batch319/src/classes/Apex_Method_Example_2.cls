public class Apex_Method_Example_2 {
    public String name 		{set;get;}
    public String industry  {set;get;}
    public string rating 	{set;get;}
    public String ownership {set;get;}
    public void setData(){
        name='Reddy Labs';
        industry='Pharma';
        rating='Cold';
        ownership='Public';
    }
    public void invoke(){
        name='Wipro';
        industry='IT';
        rating='Hot';
        ownership='Private';
    }
}