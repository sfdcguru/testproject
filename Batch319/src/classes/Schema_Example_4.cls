public class Schema_Example_4 {
    public List<String> objectNames {set;get;}
    public Schema_Example_4(){
        Map<String,Schema.SobjectType> objMap =Schema.getGlobalDescribe();
        Set<String> objects =objMap.keySet();
        objectNames=new List<String>(objects);
    }
}