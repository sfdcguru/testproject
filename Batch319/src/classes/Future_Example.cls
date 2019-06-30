public class Future_Example {
    @future
    public static void callMe(){
        System.debug('Call Me one ');
        System.debug('Call Me Two');
        System.debug('Call Me Three ');
    }
    @future 
    public static void show(){
        System.debug('Show Me one ');
        System.debug('Show Me two ');
        System.debug('Show Me three ');
    }
    public void invoke(){
        System.debug('Invoke Me one ');
        System.debug('Invoke Me two ');
        callMe();
        System.debug('Invoke Me three ');
        System.debug('Invoke Me four ');
        show();
        System.debug('Invoke Me five ');
        System.debug('Invoke Me six ');
       
       
        
    }
}