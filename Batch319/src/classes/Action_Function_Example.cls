public class Action_Function_Example {
    public String name      {set;get;}
    public String city      {set;get;}
    public String result    {set;get;}
    public void callMe(){
        result='Name :'+name +' city :'+city;
    }
}