public class Render_Example {
    public String selected	{set;get;}
    public Integer count 	{set;get;}
    public void invoke(){
        if(selected =='Account')
            count=1;
        else if(selected=='Contact')
            count =2;
        else if(selected=='Opportunity')
            count=3;
        else 
            count=0;
    }
}