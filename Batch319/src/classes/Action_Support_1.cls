public class Action_Support_1 {
    public List<SelectOption> options {set;get;}
    public List<Account> accounts     {set;get;}
    public String selected            {set;get;}
    public Action_Support_1(){
        options =new List<SelectOption>();
        SelectOption n=new SelectOption('none','-None-');
        options.add(n);
        // Get the description of the industry field
        Schema.DescribeFieldResult result =Account.Industry.getDescribe();
        // Get the options in the industry picklist field
        List<Schema.PicklistEntry> values =result.getPickListValues();
        // every option will have itemLabel ,itemValue
        // Create a new Option with those values and add them to options
        for(Schema.PickListEntry p:values){
            SelectOption op =new SelectOption(p.getValue(),p.getLabel());
            options.add(op);
        }
        accounts =[select Name,Industry,Phone,Rating from Account];
    }
    public void search(){
        accounts =[select Name,Industry,Phone,Rating from Account where industry=:selected];
    }
}