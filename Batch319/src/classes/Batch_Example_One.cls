global class Batch_Example_One implements Database.Batchable<sobject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select Id,phone from Account where createdDate=THIS_WEEK';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Account> scope){
        Database.delete(scope,false);
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job=[select id, status,JobType from AsyncApexJob where id=:bc.getJobId()];
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        msg.setToAddresses(new String[]{'salesforcebatch300@gmail.com'});
        msg.setSubject('Batch Status');
        String body='Account Deletion job :<br/>';
        body=body+'<b>JobId:</b>'+'<i>'+job.Id+'</i>';
        body=body+'<b>Type:</b>'+'<i>'+job.jobType+'</i>';
        body=body+'<b>Status:</b>'+'<i>'+job.Status+'</i>';
        msg.setHtmlBody(body);
        Messaging.Email[] emails =new Messaging.Email[]{msg};
        Messaging.sendEMail(emails);
    }
}