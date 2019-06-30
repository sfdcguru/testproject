public class Schema_Example {
    public Map<String,Object> resMap {set;get;}
    public Schema_Example(){
        resMap =new Map<String,Object>();
        Schema.DescribeSobjectResult  result=Account.SobjectType.getDescribe();
        resMap.put('Label',result.getLabel());
        resMap.put('Name',result.getName());
        resMap.put('Custom',result.isCustom());
        resMap.put('CustomSettings',result.isCustomSetting());
        resMap.put('Read',result.isAccessible());
        resMap.put('Edit',result.isUpdateable());
        resMap.put('Delete',result.isDeletable());
        resMap.put('Undelete',result.isUndeletable());
        resMap.put('Create',result.isCreateable());
        resMap.put('key',result.getKeyPrefix());
        
    }
    
}