package univelec.dto;

public class ItemDTO {
	private int no;
	private String name;
	private int price;
	private int category;
	private int stock;

	public ItemDTO(int no, String name, int price, int category, int stock){
		this.no = no;
		this.name = name;
		this.price = price;
		this.category = category;
		this.stock = stock;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}


}
