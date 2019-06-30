public class Render_Example_2 {
    public String selected	{set;get;}
    public Integer flag		{set;get;}
    public void invoke(){
        if(selected=='Education')
            flag=2;
        else if(selected=='Housing')
            flag=1;
        else
            flag=0;
        
    }
}