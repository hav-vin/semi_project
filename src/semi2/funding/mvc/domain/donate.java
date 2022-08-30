package semi2.funding.mvc.domain;

import java.sql.Date;

public class donate {
	private int dnum;
	private String did;
	private int dproject;
	private int ditem;
	
	public donate() {}
	public donate(int dnum, String did, int dproject, int ditem) {
		this.dnum = dnum;
		this.did = did;
		this.dproject = dproject;
		this.ditem = ditem;
	}
	public int getDnum() {
		return dnum;
	}

	public void setDnum(int dnum) {
		this.dnum = dnum;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public int getDproject() {
		return dproject;
	}

	public void setDproject(int dproject) {
		this.dproject = dproject;
	}

	public int getDitem() {
		return ditem;
	}

	public void setDitem(int ditem) {
		this.ditem = ditem;
	}
}
