package semi2.funding.mvc.domain;

public class Users {
	
	private String userid;
	private String upwd;
	private String uname;
	private String uemail;
	private String udate;
	
	public Users() {
	
	}

	public Users(String userid, String upwd, String uname, String uemail, String udate) {
		this.userid = userid;
		this.upwd = upwd;
		this.uname = uname;
		this.uemail = uemail;
		this.udate = udate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUdate() {
		return udate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}
	
}
