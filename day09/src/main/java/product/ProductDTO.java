package product;

//IDX   NOT NULL NUMBER        
//NAME  NOT NULL VARCHAR2(100) 
//PRICE NOT NULL NUMBER 

public class ProductDTO {
	
	private int idx;
	private String name;
	private int price;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	

}
