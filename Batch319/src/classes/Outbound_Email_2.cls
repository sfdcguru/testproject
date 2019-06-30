/* Fetch all the opportunities which are closed today
 * Send the email to corresponding owner with corresponding data
 * 	 Name 	: 
 *   CloseDate :
 * 	 Amount  :
 * 
 * 
 * 1. Fetch list of opportunites  whose closeDate is today
List<Opportunity> optyList =[select id ,Name,StageName,Closedate ,Amount from Opportunity where closeDate=TODAY];

2. Create a Set which will fetch all the ownerIds of the above fetched opportunities
	
Set<Id> ownerIds =new Set<Id>();
for(Opportunity p:optyList){
	ownerIds.add(p.ownerId);
}
                                                            
3. Fetch the details (email ,firstname,lastname ,id ) of those users whose Id in Ownerids

List<User> users =[select id,email,firstName,lastName from user where id in :ownerIds];

4. Create a Map with userid as key and user as value and insert the data from above list of user.

	Map<Id,user> userMap =new Map<Id,User>();
	for(User u:users){
		userMap.put(u.Id,u);
	}

5. Take one by one opportunity and create a SingleEmailMessage
	
	for(Opportunity op:optyList){
		// fet the detail of the owner 
		user u :userMap.get(op.ownerId);
		String[] toadd=new String[]{u.email};
		Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
		msg.setToAddresses(toadd);
		String body='Dear '+u.firstName+' '+u.lastName+',<br/>';
		body=body+'<b>Name :</b><i>'+op.Name+'</i><br/>';
		body=body+'<b>Amount :</b><i>'+op.Amount+'</i><br/>';		
		msg.setHtmlBody(body);
		
	}

 */
public class Outbound_Email_2 {
    public void callMe(){
        // fetch all the opportunities which are closed today
        List<Opportunity> optyList =[select id,OwnerId,Name,StageName,CloseDate,Amount from Opportunity where StageName IN ('Closed Won','Closed Lost') and CloseDate=TODAY];
        // fetch all the ownerid's of those opportunities which are "optyList"
        Set<Id> ownerIds =new Set<Id>();
        for(Opportunity op:optyList){
            ownerIds.add(op.ownerId);
        }
         // fetch the user email ids of those users whose Id in "ownerIds"
      	List<User> users =[select id,LastName,FirstName,email from user where id in:ownerIds];
        Map<Id,User> userMap =new Map<Id,User>();
        for(User us:users){
            userMap.put(us.id,us);
        }
      /*  userId is the key and user email is the value
        Map<Id,String> ownerMap =new Map<Id,String>();
        for(User u :users){
            ownerMap.put(u.id,u.email);
        }
		*/
        List<Messaging.Email> emails =new List<Messaging.Email>();
        
        // Take one by one opportunity and send the email to the corresponding owner 
        for(Opportunity p:optyList){
            Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
            // p.owerId is the id of the user 
            //  by the giving ownerid as key get the emailaddress from ownerMap
            User t=userMap.get(p.ownerId);
            //String email=ownerMap.get(p.ownerId);
            List<String> toadd=new List<String>();
            toadd.add(t.email);
            msg.setToAddresses(toadd);
            msg.setSubject('Opportunity Closed');
            String body='Dear'+t.firstName+'.'+t.lastName+' ,<br/>';
            body=body+'<b>Name:</b><i>'+p.name+'</i><br/>';
            body=body+'<b>Stage:</b><i>'+p.StageName+'</i><br/>';
            body=body+'<b>CloseDate:</b><i>'+p.closeDate+'</i><br/>';
            body=body+'<b>Amount:</b><i>'+p.Amount+'</i><br/>';
            body=body+'Thanks<br/> Sales Team';
            msg.setHtmlBody(body);
            emails.add(msg);
        }
        Messaging.sendEmail(emails);
    }
}