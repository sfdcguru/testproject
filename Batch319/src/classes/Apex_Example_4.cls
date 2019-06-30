public class Apex_Example_4 {
	public String industry;
    public String rating;
    public String ownership;
    
    public void callMe(){
        if(industry=='Energy'){
            rating='Hot';
            ownership='Public';
        } else{
            rating='Warm';
            ownership='Private';
        }
    }
}