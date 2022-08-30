package semi2.funding.mvc.domain;

import java.sql.Date;

public class Board {
	private long pnum; 
	private long inum;
	private String pid;
	private String psubject;
	private String pcontent;
	private String piname;
	private String pconiname;
	private long pmoney;
	private long pamount;
	private long iprice;
	private String ilineup;
	
	public Board() {}

	public Board(long pnum, String pid, String psubject, String pcontent, String piname, String pconiname, long pmoney,
			long pamount) {
		super();
		this.pnum = pnum;
		this.pid = pid;
		this.psubject = psubject;
		this.pcontent = pcontent;
		this.piname = piname;
		this.pconiname = pconiname;
		this.pmoney = pmoney;
		this.pamount = pamount;
	}
	
	public Board(long pnum, String psubject, String pcontent, String piname) {
		this.pnum = pnum;
		this.psubject = psubject;
		this.pcontent = pcontent;
		this.piname = piname;
	}
	
	public Board(long inum, long pnum, long iprice, String ilineup){
		this.inum = inum;
		this.pnum = pnum;
		this.iprice = iprice;
		this.ilineup = ilineup;
	}

	public long getPnum() {
		return pnum;
	}

	public void setPnum(long pnum) {
		this.pnum = pnum;
	}
	
	public long getInum() {
		return inum;
	}

	public void setInum(long inum) {
		this.inum = inum;
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

	public long getPmoney() {
		return pmoney;
	}

	public void setPmoney(long pmoney) {
		this.pmoney = pmoney;
	}

	public long getPamount() {
		return pamount;
	}

	public void setPamount(long pamount) {
		this.pamount = pamount;
	}
	
	public long getIprice() {
		return iprice;
	}

	public void setIprice(long iprice) {
		this.iprice = iprice;
	}

	public String getIlineup() {
		return ilineup;
	}

	public void setIlineup(String ilineup) {
		this.ilineup = ilineup;
	}
}
