public class ProductInfo {
	public String name;
    Integer price;
    Integer quantity;
    public ProductInfo(){
        name='IPhone';
        price=10000;
        quantity=4;
    }
    public void show(){
        System.debug('Name :'+name);
        System.debug('Price:'+price);
        System.debug('Quantity:'+quantity);
    }
	
}