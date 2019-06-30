public class Apex_Example_5 {
	public Integer age;
    public Decimal salary;
    public Decimal bonus;
    public void callMe(){
        if(age> 30){
            salary=50000;
            bonus=4000;
        }else{
            salary=30000;
            bonus=2000;
        }
    }
}