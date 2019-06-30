public class Product_Info {
	public String prodName;
    public Integer quantity;
    public Product_Info(){
        prodName='Admin';
        quantity=50;
    }
    public Product_Info(String name){
        prodName=name;
        quantity=50;
    }
    public Product_Info(Integer quant){
        prodName='Admin';
        quantity=quant;
    }
    public Product_Info(String name,Integer quant){
        prodName=name;
        quantity=quant;
    }
    public Product_Info(Integer quant,String name){
         prodName=name;
        quantity=quant;
    }
}