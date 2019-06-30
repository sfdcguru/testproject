public class Schedule_Two implements Schedulable {
    public void execute(SchedulableContext sc){
        Schedule_Example se =new Schedule_Example();
        String cron ='0 30 10 14 5 ?';
        System.schedule('One',cron,se);
    }
}