public class Mass_Update_Data {
    public List<Account> accounts {set;get;}
    public Mass_Update_Data(Apexpages.StandardSetController controller){
        List<String> fields =new List<String>{'Name','Phone','Industry','Rating'};
        controller.addFields(fields);
        accounts =(List<Account>) controller.getSelected();
    }
    public PageReference updateData(){
        for(Account a: accounts){
            a.rating='Hot';
            a.ownership='Public';
        }
        update accounts;
        PageReference p =new PageReference('/001/o');
        return p;
    }
}