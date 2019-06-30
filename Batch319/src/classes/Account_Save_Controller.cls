public class Account_Save_Controller {
    public Account acc {set;get;}
    public Contact con {set;get;}
    public Account_Save_Controller(Apexpages.StandardController controller){
        // when ever we click on the button from the detail page of the record only recordId will be 
        // come 
        // ==> if you want any other fields other than recordId ,we have to add them tocontroller 
        List<String> fields =new List<String>{'Name','Phone','Industry','Rating','OwnerShip','Type'};
        controller.addFields(fields);
        // fetch the record
        acc =(Account)controller.getRecord();
        con=new Contact();
    }
    public PageReference saveMe(){
        update acc;
        con.accountId=acc.Id;
        insert con;
        return new PageReference('/'+acc.Id);
    }
}