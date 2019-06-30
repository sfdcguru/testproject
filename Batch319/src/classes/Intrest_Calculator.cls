public class Intrest_Calculator {
    public Decimal amount 	{set;get;}
    public Integer years  	{set;get;}
    public Integer rate	  	{set;get;}
    public Decimal intrest	{set;get;}
    public void callMe(){
        intrest =(amount*rate*years)/100;
        System.debug('Intrest:'+intrest);
        System.debug('Amount:'+amount);
        System.debug('Rate:'+rate);
        System.debug('Years:'+years);
    }
    public void cancel(){
        amount=null;
        years=null;
        rate=null;
        intrest=null;
        System.debug('Intrest:'+intrest);
        System.debug('Amount:'+amount);
        System.debug('Rate:'+rate);
        System.debug('Years:'+years);
    }
}