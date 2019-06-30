public class First_Page {
    public String name {set;get;}
    public String city {set;get;}
    public First_Page(){
        name='Praveen';
        city='Banglore';
    }
    public PageReference next(){
        PageReference p=new PageReference('/apex/SecondPage');
        p.setRedirect(true);
        return p;
    }
    public PageReference prev(){
        PageReference p=new PageReference('/apex/First_One');
        p.setRedirect(false);
        return p;
    }
}