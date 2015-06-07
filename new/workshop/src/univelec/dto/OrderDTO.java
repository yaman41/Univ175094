package univelec.dto;

import java.sql.Timestamp;

public class OrderDTO {
	private int no;
	private int itemno;
	private String itemname;
	private int count;
	private int usercode;
	private Timestamp date;

	public OrderDTO(int itemno, String itemname, int count, int usercode, Timestamp date){
		this.itemno = itemno;
		this.itemname = itemname;
		this.count = count;
		this.usercode = usercode;
		this.date = date;
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
	public void setItemno(int itemno) {
		this.itemno = itemno;
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
	public int getUsercode() {
		return usercode;
	}
	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}


}
