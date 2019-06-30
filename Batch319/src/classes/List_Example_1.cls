public class List_Example_1 {
    public List<String> names {set;get;}
    public String value		  {set;get;}
    public List_Example_1(){
        names =new List<String>{'Sam','Ram','Kiran'};
    }
    public void addEle(){
        names.add(value);
        value=null;
    }
    public void addAt2(){
        names.add(2,value);
        value=null;
    }
    public void addAt3(){
        names.add(3,value);
        value=null;
    }
    public void remove1(){
        names.remove(1);
    }
    public void remove2(){
        names.remove(2);
    }
    public void sortData(){
        names.sort();
    }
    public void deleteAll(){
        names.clear();
    }
}