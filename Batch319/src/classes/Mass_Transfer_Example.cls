public class Mass_Transfer_Example {
    public List<Account> accounts {set;get;}
    public Mass_Transfer_Example(Apexpages.StandardSetController controller){
        List<String> fields= new List<String>{'Name','Phone','Industry','Rating'};
        controller.addFields(fields);
        accounts =(List<Account>)controller.getSelected();
    }
    public PageReference  transferData(){
        User u =[select id from User where firstName='Wilson'];
        for(Account a: accounts){
            a.ownerId=u.Id;
        }
        update accounts;
        PageReference p=new PageReference('/001?fcf=00B0o00000EBQk0');
        return p;
    }
}