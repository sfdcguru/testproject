global class Batch_Demo implements Database.Batchable<sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select Name,rating,Phone from Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Account>  accounts){
        for(Account a:accounts){
            a.rating='Warm';
        }
        update accounts;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}