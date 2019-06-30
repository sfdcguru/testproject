public class DML_Example_3 {
    public void callMe(){
        SavePoint sp =Database.setSavepoint();
        try{
            Account acc =new Account();
            acc.Name='SavePoint_Example';
            acc.Phone='040-1234';
            acc.Industry='Banking';
            insert acc;
            Contact c =new Contact();
           
            c.FirstName='Satish';
            c.AccountId=acc.Id;
            insert c; 
		}catch(Exception e){
    		Database.rollback(sp);	
		}
        
    }
}