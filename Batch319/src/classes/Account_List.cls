public class Account_List {
    public List<Account_Wrap> accounts {set;get;}
    public Account_List(){
        accounts=new List<Account_Wrap>();
        // fetch all the accounts from the accounts 
        List<Account> myList =[select Id,Name,Phone,Rating,Industry from Account ];
        // for every record in myList create a wrapper instance  and add it the list of wrapper
        for(Account a: myList){
            Account_Wrap aw =new Account_Wrap();
            aw.acc=a;
            aw.flag=false;
            accounts.add(aw);
        }
    }
    public void deleteData(){
        List<Account> myList =new List<Account>();
        // take one by one element from the wrapper list and check the flag value 
        // if flag is true then add the account to myList
        // delete all the elements in mylist
        for(Account_Wrap aw :accounts){
            if(aw.flag==true){
                myList.add(aw.acc);
            }
        }
        delete myList;
        accounts.clear();
        List<Account> accList =[select Id,Name,Phone,Rating,Industry from Account ];
        for(Account a: accList){
             
            Account_Wrap aw =new Account_Wrap();
            aw.acc=a;
            aw.flag=false;
            accounts.add(aw);
        }
    }
}