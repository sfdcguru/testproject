public class DML_Example_2 {
    public List<LeadWrapper> leads  		{set;get;}
    public List<SelectOption> options 		{set;get;}
    public String selected			 		{set;get;}
    public DML_Example_2(){
        leads =new List<LeadWrapper>();
        options =new List<SelectOption>();
        List<String> ratings =new List<String>{'None','Hot','Cold','Warm'};
        for(String s:ratings){
        	SelectOption op1 =new SelectOption(s,s);
          	options.add(op1);
    	}
        List<Lead> myList =[select id,LastName,FirstName,Rating,LeadSource,Industry from Lead limit 10];
        // Create wrapper record for every lead record
        for(Lead l:myList){
            LeadWrapper lw =new LeadWrapper();
            lw.newLead=l;
            lw.flag=false;
            leads.add(lw);
        }
        
    }
    public void updateRating(){
        List<Lead> myList =new List<Lead>();
        for(LeadWrapper lw:leads){
            if(lw.flag==true){
                lw.newLead.rating=selected;
                myList.add(lw.newLead);
            }
        }
        update myList;
    }
    
    public class LeadWrapper{
        public Lead newLead {set;get;}
        public Boolean flag {set;get;}
       
       
    }
}