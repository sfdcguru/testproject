public class Schedule_Example implements Schedulable {
    public void execute(SchedulableContext sc){
        List<Account> accounts =[select id from Account where createddate =THIS_WEEK];
        delete accounts;
    }
}