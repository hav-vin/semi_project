package semi2.funding.mvc.domain;

import java.sql.Date;

public class Comments {
	private int cnum;
	private int cproject;
	private String cname;
	private String ccontent;
	private Date cdate;
	
	public Comments() {}

	public Comments(int cnum, int cproject, String cname, String ccontent, Date cdate) {
		this.cnum = cnum;
		this.cproject = cproject;
		this.cname = cname;
		this.ccontent = ccontent;
		this.cdate = cdate;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public int getCproject() {
		return cproject;
	}

	public void setCproject(int cproject) {
		this.cproject = cproject;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	
}
