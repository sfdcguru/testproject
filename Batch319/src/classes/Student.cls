public class Student {
	public String name,branch;
    public Decimal fee,tax;
    public Integer age;
    public String qualification;
    public Student(String stdName,String stdBranch){
         name=stdName;
         branch=stdBranch;  
    }
    public Student(){
        
    }
    public void show(){
        if(branch=='CSE'){
            fee=5000;
            tax=2000;
        }else{
            fee=8000;
            tax=5000;
        }
    }
}