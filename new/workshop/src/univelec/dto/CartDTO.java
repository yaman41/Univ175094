package univelec.dto;

import java.sql.Timestamp;


public class CartDTO {
	private int no; // 注文番号「
	private int itemno;
	private String itemname;
	private int count;
	private String usercode;
	private Timestamp orderdate;
	private int price;
	private int category;
	private int stock;
	private int totalprice;

	public CartDTO(int itemno, String itemname, int price, int category, int stock, int count){
		this.itemno = itemno;
		this.itemname = itemname;
		this.price = price;
		this.category = category;
		this.stock = stock;
		this.count = count;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getItemno() {
		return itemno;
	}
	public void setItemno(int itemono) {
		this.itemno = itemono;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public Timestamp getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
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
	public int getTotalprice() {
		return this.count * this.price;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}



}
