public class Schema_Example_2 {
    public List<String> fieldNames {set;get;}
    public Schema_Example_2(){
      //1. Get the description of the object 
      Schema.DescribeSobjectResult result =Account.SobjectType.getDescribe();
      //2.Create map with fieldName as key and fieldType as value Schema.SobjectField
      Map<String,Schema.SobjectField> fldMap =result.fields.getMap();
      //3.fetch all the fieldNames from the map
      Set<String> keys =fldMap.keySet();
      // 4. add all the keys to fieldNames list 
      fieldNames=new List<String>(keys);
    }
}