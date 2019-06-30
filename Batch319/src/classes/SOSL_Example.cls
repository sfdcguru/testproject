// SOSL : Salesforce Object Search Language
// 	    : This is used to search for particular keyword in the database 
// 	    : Field Groupd : 
// 	    	All Fields 
// 	    	Name Fields
// 	    	Phone Fields
// 	    	Email Fields 
// 	    	
// 	    	Syntax :
// 	    	FIND keyword IN FIELD GROUP Returning Sobject(Fields) ,Sobject(Fields)....
// 	    	SOSL will return List<List<Sobject>>
public class SOSL_Example {
    public List<Account> accounts {set;get;}
    public List<Contact> contacts {set;get;}
    public List<Opportunity> opty {set;get;}
    public List<String> accFields {set;get;}
    public List<String> conFields {set;get;}
    public List<String> optyFields{set;get;}
    public SOSL_Example(){
        List<List<Sobject>> result =[FIND 'United' IN ALL FIELDS Returning Account(Name,Phone,Industry where industry='Energy'),Contact(LastName,FirstName,Phone),Opportunity(Name,StageName,CloseDate limit 3)];
    	accounts =(List<Account>)result[0];
        contacts =(List<Contact>)result[1];
        opty=(List<Opportunity>)result[2];
        accFields =new List<String>{'Name','Phone','Industry'};
        conFields =new List<String>{'LastName','FirstName','Phone'};
        optyFields =new List<String>{'Name','StageName','CloseDate'};
    }
}