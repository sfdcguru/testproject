public class Action_Region_Example {
    public List<SelectOption > accounts {set;get;}
    public List<SelectOption> contacts  {set;get;}
    public String selected              {set;get;}
    public String name                  {set;get;}
    public String phone                 {set;get;}
    public Map<String,List<String>> accMap{set;get;}
    public Action_Region_Example(){
        accMap =new Map<String,List<String>>();
        List<Account> myList =[select Name,Phone,(select FirstName from Contacts ) from Account limit 5];
        accounts =new List<SelectOption>();
        contacts =new List<SelectOption>();
        SelectOption n=new SelectOption('none','-None-');
        accounts.add(n);
        contacts.add(n);
        for(Account a:myList){
            List<Contact> myCon=a.contacts;
            List<String> myNames =new List<String>();
            if(myCon.size()>0){
                for(Contact c:a.contacts){
                    myNames.add(c.firstName);
                }
            }
            accMap.put(a.name,mynames);
        }
        Set<String> keys =accMap.keySet();
        for(String s:keys){
            SelectOption op=new SelectOption(s,s);
            accounts.add(op);
        }
    }
    public void callMe(){
        contacts.clear();
         SelectOption n=new SelectOption('none','-None-');
         contacts.add(n);
         List<String> myNames =accMap.get(selected);
        for(String s:myNames){
            SelectOption p=new SelectOption(s,s);
            contacts.add(p);
        }
         System.debug(name);
        System.debug(phone);
        System.debug(selected);
    }
    
}