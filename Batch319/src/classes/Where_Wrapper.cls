public class Where_Wrapper {
    public List<SelectOption> fields 	{set;get;}
    public List<SelectOption> operators {set;get;}
    public String value					{set;get;}
    public Where_Wrapper(List<String> flist,List<String> oList ){
        fields =new List<SelectOption>();
        for(String s:flist){
            selectOption op=new SelectOption(s,s);
            fields.add(op);
        }
        operators =new List<SelectOption>();
        for(String n:olist){
            selectOption op1 =new SelectOption(n,n);
            operators.add(op1);
        }
    }
}