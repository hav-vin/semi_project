package semi2.funding.mvc.domain;

import java.sql.Date;

public class item {
	private int inum;
	private int iproject;
	private int price;
	private String ilineup;
	
	public item() {}
	public item(int inum, int iproject, int price, String ilineup) {
		this.inum = inum;
		this.iproject = iproject;
		this.price = price;
		this.ilineup = ilineup;
	}
	public int getInum() {
		return inum;
	}
	public void setInum(int inum) {
		this.inum = inum;
	}
	public int getIproject() {
		return iproject;
	}
	public void setIproject(int iproject) {
		this.iproject = iproject;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getIlineup() {
		return ilineup;
	}
	public void setIlineup(String ilineup) {
		this.ilineup = ilineup;
	}
}
