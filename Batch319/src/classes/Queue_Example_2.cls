public class Queue_Example_2 implements Queueable{
    public void execute(QueueableContext qc){
        
        Queue_Example_1 ae =new Queue_Example_1();
        Id jobId=System.enqueueJob(ae);
    }
   
}