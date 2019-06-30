public class Apex_Example_3 {
	public String name;
    public Integer age;
    public Decimal salary;
    public Decimal bonus;
    public void callMe(String ename,Integer eage){
        name=ename;
        age=eage;
    }
    public void calculate(){
        salary=50000;
        bonus=3000;
    }
}