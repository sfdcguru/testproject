public class SOQL_Where_Two {
    public String accName 			{set;get;}
    public String accIndustry 		{set;get;}
    public String query 			{set;get;}
    public List<Account> accounts	{set;get;}
    public void search(){
        query ='Select Name,Phone,Industry,Rating from Account';
        if(accName!='' && accIndustry!=''){
            query =query+' where name =\''+accName+'\' and industry=\''+accIndustry+'\''; 
        }else if(accName!='')
                 query =query+' where name =\''+accName+'\'';
          else if(accIndustry!='')
              	 query=query+' where industry=\''+accIndustry+'\'';
        accounts=Database.query(query);
      }

}