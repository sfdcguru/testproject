public class Static_Example {
	public static Integer aval=0;
    public Integer bval=0;
    public void callMe(){
        aval=aval+10;
        bval=bval+10;
    }
    public static void show(){
        System.debug('This is a static Example');
        aval=aval+10;
       // bval=bval+10;
    }
}