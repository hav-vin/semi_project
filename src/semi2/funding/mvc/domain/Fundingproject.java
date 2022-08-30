package semi2.funding.mvc.domain;

import java.sql.Date;

public class Fundingproject {
	private int pnum;
	private String pid;
	private String psubject;
	private String pcontent;
	private String piname;
	private String pconiname;
	private int pmoney;
	private int pamount;
	
	private int fundcount;
	private int addmoney;
	private int ditem;
	private String did;
	
	public Fundingproject(int pnum, int addmoney, int ditem, String did){
		this.pnum = pnum;
		this.addmoney = addmoney;
		this.ditem= ditem;
		this.did = did;
	}
	
	public Fundingproject(int pnum, String pid, String psubject, String pcontent, String piname, String pconiname,
			int pmoney, int pamount, int fundcount) {
		this.pnum = pnum;
		this.pid = pid;
		this.psubject = psubject;
		this.pcontent = pcontent;
		this.piname = piname;
		this.pconiname = pconiname;
		this.pmoney = pmoney;
		this.pamount = pamount;
		this.fundcount = fundcount;
	}
	
	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public int getDitem() {
		return ditem;
	}

	public void setDitem(int ditem) {
		this.ditem = ditem;
	}

	public int getAddmoney() {
		return addmoney;
	}

	public void setAddmoney(int addmoney) {
		this.addmoney = addmoney;
	}

	public int getFundcount() {
		return fundcount;
	}
	public void setFundcount(int fundcount) {
		this.fundcount = fundcount;
	}
	
	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPsubject() {
		return psubject;
	}

	public void setPsubject(String psubject) {
		this.psubject = psubject;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPiname() {
		return piname;
	}

	public void setPiname(String piname) {
		this.piname = piname;
	}

	public String getPconiname() {
		return pconiname;
	}

	public void setPconiname(String pconiname) {
		this.pconiname = pconiname;
	}

	public int getPmoney() {
		return pmoney;
	}

	public void setPmoney(int pmoney) {
		this.pmoney = pmoney;
	}

	public int getPamount() {
		return pamount;
	}

	public void setPamount(int pamount) {
		this.pamount = pamount;
	}
}
