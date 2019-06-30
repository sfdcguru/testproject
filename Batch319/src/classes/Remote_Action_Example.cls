public class Remote_Action_Example {
    @RemoteAction
    public static String callMe(String name){
       String result='Your Name:'+name;
        return result;
    }
}