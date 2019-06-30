public class Queue_Example_1 implements Queueable{
    public void execute(QueueableContext ac){
        List<Account> accounts =[select id from Account where createdDate=LAST_WEEK];
        Database.delete(accounts,false);
     
    }
}