public class PageReference_Example {
    public PageReference callMe(){
        PageReference p=Page.Topics_Covered;
        return p;
    }
    public PageReference invoke(){
        PageReference p=new PageReference('/apex/Topics_Covered');
        return p;
    }
    public PageReference show(){
        // Account acc =[select id from Account where name='Genepoint'];
        // PageReference p=new PageReference('/apex/OutputField_Example?id='+acc.Id);
        PageReference p=new PageReference('/apex/OutputField_Example?id=0010o00002FrwUh');
        return p;
    }
    public PageReference getInfo(){
        PageReference p=new PageReference('/0010o00002FrwUh/p');
        
        return p;
    }
    public PageReference testMe(){
        
        return null;
    }
}