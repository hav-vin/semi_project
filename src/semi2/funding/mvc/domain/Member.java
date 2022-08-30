package semi2.funding.mvc.domain;

import java.sql.Date;

public class Member {
	private String userid;
	private String pwd;
	private String nickname;
	private String email;
	private Date sysdate;
	
	public Member() {}

	public Member(String userid, String pwd, String nickname, String email, Date sysdate) {
		
		this.userid = userid;
		this.pwd = pwd;
		this.nickname = nickname;
		this.email = email;
		this.sysdate = sysdate;
	}

	public String getUserId() {
		return userid;
	}

	public void setUserId(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getSysdate() {
		return sysdate;
	}

	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}
}