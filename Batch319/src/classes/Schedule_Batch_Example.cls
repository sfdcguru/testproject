global class Schedule_Batch_Example implements Database.Batchable<sobject>,Schedulable{
    public String query;
    public String fieldName;
    public String value;
    public Schedule_Batch_Example(String query,String fieldName,String value){
        this.query=query;
        this.fieldName=fieldName;
        this.value=value;
    }
    global Database.QueryLocator start(Database.BatchableContext bc){
         return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Sobject> scope){
        for(Sobject s:scope){
            s.put(fieldName,value);
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
        
    }
   global void execute(SchedulableContext sc){
       String query='Select Name,Rating from Account';
      	Schedule_Batch_Example se =new Schedule_Batch_Example(query,'Rating','Warm');
		Id jobId=Database.executeBatch(se);  
    }
}