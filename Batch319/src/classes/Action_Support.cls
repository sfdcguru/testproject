public class Action_Support {
    public Map<String,List<String>> accMap      {set;get;}
    public List<SelectOption> accNames          {set;get;}
    public List<SelectOption> conNames          {set;get;}
    public String selected                      {set;get;}
    public Action_Support(){
        accNames =new List<SelectOption>();
        conNames =new List<SelectOption>();
        accMap =new Map<String,List<String>>();
        List<Account> accounts =[select Name,(select FirstName from Contacts) from Account];
        for(Account a: accounts){
            // a is an account 
            List<String> conList =new List<String>();
            // a.contacts is a list of contacts associated with given account a
            for(Contact c:a.contacts){
                conList.add(c.firstName);
            }
            // account name is a key and list of contacts firstname is the value
            if(conList.size()>0)
            accMap.put(a.name,conList);
            else{
                conList.add('none');
                accMap.put(a.name,conlist);
            }
        }
        SelectOption n =new SelectOption('none','-None-');
        accNames.add(n);
        conNames.add(n);
        //fetch account accounts 
        Set<String> keys =accMap.keySet();
        for(String s:keys){
            SelectOption op =new SelectOption(s,s);
            accNames.add(op);
        }
    }
    public void getData(){
        // first clear all the existing contactNames 
        conNames.clear();
        SelectOption n =new SelectOption('none','-None-');
        conNames.add(n);
        // check the account name ,if account name is not equals to 'none' then get corresponding contacts
        if(selected!='none'){
            List<String> conList =accMap.get(selected);
            for(String s:conList){
                SelectOption op =new SelectOption(s,s);
                conNames.add(op);
            }
        }  
    }
}