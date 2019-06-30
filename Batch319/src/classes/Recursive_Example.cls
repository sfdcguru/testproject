public class Recursive_Example {
    public static Boolean flag=true;
    public static void beforeInsert(){
        if(flag==true){
            flag=false;
        	Account acc =new Account();
        	acc.Name='Testing';
        	insert acc;
        }
    }
}