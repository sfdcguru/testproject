public class Schedule_Demo implements Schedulable{
    public void execute(SchedulableContext sc){
        List<Account> accounts =[select id from Account where createddate =TODAY];
        delete accounts;
    }
}