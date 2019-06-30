public class StandardController_Example {
    public Apexpages.StandardController controller {set;get;}
    public Account acc {set;get;}
    public StandardController_Example(){
        acc=[select id ,name,Phone,rating,Industry from Account limit 1];
        controller =new Apexpages.StandardController(acc);  
    }
    public PageReference view(){
        return controller.view();
    }
    public PageReference resetData(){
       
         	controller.reset();
        return null;
    }
	
    public PageReference save(){
        return controller.save();
    }
    public PageReference edit(){
        return Controller.edit();
    }
    public PageReference deleteData(){
        return controller.delete();
    }
}