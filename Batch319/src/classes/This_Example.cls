public class This_Example {
	public Integer age;
    public String name;
    public Decimal exp;
    public This_Example(String empName,Integer age,Decimal exp){
      	name=empName;
        this.age=age;
        exp=exp;
        System.debug('=====Local Variables ====');
        System.debug('EmpName :'+Name);
        System.debug('EmpAge :'+Age);
        System.debug('EmpExp:'+Exp);
    }
}