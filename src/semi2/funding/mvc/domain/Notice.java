package semi2.funding.mvc.domain;

import java.sql.Date;

public class Notice {
	private int num;
	private int nporject;
	private String nid;
	private String nsubject;
	private String ncontent;
	private String ndate;
	
	public Notice() {}
	
	public Notice(int num, int nporject, String nid, String nsubject, String ncontent, String ndate) {
		this.num = num;
		this.nporject = nporject;
		this.nid = nid;
		this.nsubject = nsubject;
		this.ncontent = ncontent;
		this.ndate = ndate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getNporject() {
		return nporject;
	}

	public void setNporject(int nporject) {
		this.nporject = nporject;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getNsubject() {
		return nsubject;
	}

	public void setNsubject(String nsubject) {
		this.nsubject = nsubject;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
}
