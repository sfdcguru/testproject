public class Workbench_Example {
    public Map<String,Schema.SobjectType> objMap {set;get;}
    public List<String> objectNames              {set;get;}
    public List<String> fieldNames               {set;get;}
    public List<String> selectedFields           {set;get;}
    public List<SelectOption> objectsList        {set;get;}
    public List<SelectOption> fieldsList         {set;get;}
    public String selected                       {set;get;}
    public String query                          {set;get;}
    public List<Where_Wrapper>  whereList        {set;get;}
    public Workbench_Example(){
        WhereList =new List<Where_Wrapper>();
        List<String> dummy=new List<String>{'none'};
        Where_Wrapper ww =new Where_Wrapper(dummy,dummy);
        whereList.add(ww);
        objectNames =new List<String>();
        fieldNames =new List<String>();
        selectedFields =new List<String>();
        objectsList =new List<SelectOption>();
        fieldsList =new List<SelectOption>();
        // 1. Get all the objects from the salesforce
         objMap =Schema.getGlobalDescribe();
        // 2. Take one by one object and verify it is custom or standard 
        Set<String> names =objMap.keySet();
        SelectOption none=new SelectOption('none','-None-');
        objectsList.add(none);
        for(String s:names){
            // based on the key get sobjectType
            Schema.SobjectType  obj =objMap.get(s);
            // get description of the sobjectType 
            Schema.DescribeSobjectResult result =obj.getDescribe();
            // Check if the sobject is a custom Sobject
            if(result.isCustom()){
                // if the soject is a custom create picklist option with sobjectName
                String n=result.getName();
                objectNames.add(n);
                SelectOption op=new SelectOption(n,n);
                objectsList.add(op);
                
            }
        }
    }
    public void getFields(){
        if(selected!='none'){
            // Get the objectType based on the object we seleced in the picklist
            Schema.SobjectType obj=objMap.get(selected);
            // 1. get the description 
            Schema.DescribeSobjectResult result =obj.getDescribe();
            // 2. get the fields of the sobject 
            Map<String,Schema.SobjectField> fldMap =result.fields.getMap();
            Set<String> fields =fldMap.keySet();
            // remove all the old fields from fiedList and add new Fields of the given sobject
            fieldNames.clear();
            fieldNames.addAll(fields);
        }
        create();
    }
    public void create(){
        // remove all the options from the FieldList
        fieldsList.clear();
        // if the there are any fields in the list create a option
        if(fieldNames.size()>0){
            for(String s:fieldNames){
                SelectOption op=new SelectOption(s,s);
                fieldsList.add(op);
            }
        }else{
             SelectOption none=new SelectOption('none','-None-');
            fieldsList.add(none);
        }
      
    }
    public void createQuery(){
        query='select id';
        for(String s:fieldNames){
            if(s!='Id'){
                query =query+','+s;
            }
        }
        query=query+' from '+selected;
    }
    public void add(){
        
        List<String> operators =new List<String>{'=','!=','<','>'};
        Where_Wrapper ww =new Where_Wrapper(fieldNames,operators);
        whereList.add(ww);
    }
}