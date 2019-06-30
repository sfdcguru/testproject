public class SOQL_Parent_Child {	
    public List<Account> accounts {set;get;}
    public SOQL_Parent_Child(){			
        accounts =[select Name,Phone,Industry,(select LastName,FirstName from Contacts),(select Name,StageName from Opportunities),(select Mode__c,Amount__c from Payments__r) from Account where industry='Energy'];
    }
    public void child_Parent(){
        List<Payment__c> payments =[select Mode__C,Amount__c,Company__r.Name,Company__r.Phone ,Contact__r.LastName,Contact__r.FirstName from Payment__c];
    }
}