public class Schema_Example_3 {
    public Map<String,Object> resMap {set;get;}
    public Schema_Example_3(){
        resMap =new Map<String,Object>();
        //1. fetch the description of a field
        Schema.DescribeFieldResult result =Account.Industry.getDescribe();
        resMap.put('Label',result.getLabel());
        resMap.put('Name',result.getName());
        resMap.put('DataType',result.getType());
        resMap.put('Read',result.isAccessible());
        resMap.put('AutoNumber',result.isAutoNumber());
        resMap.put('Aggregate',result.isAggregatable());
       // resMap.put('Default',result.getDefaultValue());
        resMap.put('Custom',result.isCustom());
        resMap.put('CaseSentive',result.isCaseSensitive());
        resMap.put('Lookup',result.isIdLookup());
    }
}