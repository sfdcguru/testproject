global class Batch_Example_2 implements Database.Batchable<sobject>,Database.Stateful {
	public static Integer count=0;
    public Integer size=0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select id,name,phone from Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Account> accounts){
        for(Account a:accounts){
            size=size+1;
            count=count+1;
        }
		  Schedule_Two se =new Schedule_Two();
String cron='0 30 9 13 5 ?';
System.schedule('Two',cron,se);
    }
    global void finish(Database.BatchableContext bc){
        Account acc =new Account();
        acc.Name='BatchExample';
        acc.Description='Count :'+count+' == Size:'+size;
        insert acc;
        	Batch_Example_One be =new Batch_Example_One();
        Database.executeBatch(be,4);
    }
}