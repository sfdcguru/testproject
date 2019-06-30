public class Dynamic_Example {     
    public string selectedform { get; set;}
    public string userId { get; set;}
     
    public Dynamic_Example(){
        selectedform = 'client';
    }
    public List<SelectOption> getFormList(){
        List<SelectOption> formlist = new List<SelectOption>();
        formlist.add(new selectoption('client','Customer'));
        formlist.add(new selectoption('employee','Employees'));
        return formlist;
    }
     
    public Component.Apex.OutputPanel getFormPanel(){
        Component.Apex.OutputPanel op = new Component.Apex.OutputPanel();
        Component.Apex.OutputLabel OpLabel = new Component.Apex.OutputLabel();
        Component.Apex.inputText iptext = new Component.Apex.InputText();
        Component.Apex.CommandButton cmb = new Component.Apex.CommandButton();
        if (selectedform=='client') {
            OpLabel.value = 'Enter Client Id: ';
        } else if (selectedform=='employee'){
            OpLabel.value = 'Enter Employee Id: ';
        }
        OpLabel.for='idField';
         
        iptext.expressions.value='{!userId}';
         
        if (selectedform=='client') {
            cmb.expressions.action = '{!saveClient}';
        } else if (selectedform=='employee'){
            cmb.expressions.action = '{!saveEmployee}';
        }
        cmb.value='Submit';
        op.childComponents.add(OpLabel);
        op.childComponents.add(iptext);
        op.childComponents.add(cmb);
        return op;
    }
     
    public void saveClient(){
        System.debug('Client Save Action');
    }
     
    public void saveEmployee(){
        System.debug('Employee Save Action');
    }
     
    public void changeForm(){
        system.debug(selectedform);
    }

}