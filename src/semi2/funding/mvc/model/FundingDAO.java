package semi2.funding.mvc.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import semi2.funding.mvc.domain.Board;
import semi2.funding.mvc.domain.Comments;
import semi2.funding.mvc.domain.Fundingproject;
import semi2.funding.mvc.domain.Member;
import semi2.funding.mvc.domain.Notice;
import semi2.funding.mvc.domain.Users;
import semi2.funding.mvc.domain.item;
import semi2.funding.mvc.vo.FcontentVO;
import semi2.funding.mvc.vo.ListResult;

class FundingDAO {
	private DataSource ds;
	FundingDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
		}		
	}
	ArrayList<Notice> searchList(int currentPage, int pageSize, String category, String searchval, String pnum, String pid){
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = semi2.funding.mvc.model.FundingSQL.SEARCH_LIST_PAGE;
		//select * from (select ROWNUM rnum, aa.* from (select * from NOTICE where NPROJECT = ?  and nsubject like ? order by NNUM desc) aa) where rnum > ? and rnum <= ?
		
		int startRow = (currentPage-1)*pageSize;
		int endRow = currentPage*pageSize;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pnum);
			pstmt.setString(2, "%"+searchval+"%");
//			pstmt.setInt(3, startRow);
//			pstmt.setInt(4, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int nnum = rs.getInt("NNUM");
				int nproject = rs.getInt("NPROJECT");
				String nid = rs.getString("NID");
				String nsubject = rs.getString("NSUBJECT");
				String ncontent = rs.getString("NCONTENT");
				String ndate = rs.getString("NDATE");
				
				Notice no = new Notice(nnum, nproject, nid, nsubject, ncontent, ndate);
				list.add(no);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	long getSearchCount(String pnum, String searchval) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = semi2.funding.mvc.model.FundingSQL.SEARCHCOUNT;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchval+"%");
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				long count = rs.getLong(1);
				return count;
			}else {
				return -1L;
			}
		}catch(SQLException se) {
			return -1L;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	public boolean nupdateOk(Notice ntc) {
		String sql = semi2.funding.mvc.model.FundingSQL.NOTICEUPDATEOK;
		//update NOTICE set nsubject = ? , ncontent = ? where nnum = ?
		Connection con = null;
		PreparedStatement pstmt = null;	
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ntc.getNsubject());
			pstmt.setString(2, ntc.getNcontent());
			pstmt.setInt(3, ntc.getNum());
			System.out.println("updateok dao "+ntc.getNsubject() + ", "+ ntc.getNcontent() + ", " +  ntc.getNum());
			
			int i = pstmt.executeUpdate();
			
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		} 
		catch(SQLException se){
			System.out.println("update OK SQL except");
			return false;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null)  con.close();
			}catch(SQLException se){}
		}  
	}
	public Notice nupdate(String nnum) {
		String sql = semi2.funding.mvc.model.FundingSQL.NOTICECONTENT;

		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;		
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, nnum);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
				int nnum_int = rs.getInt("NNUM");
				int nproject_int = rs.getInt("NPROJECT");
				String nid = rs.getString("NID");
				String nsubject = rs.getString("NSUBJECT");
				String ncontent = rs.getString("NCONTENT");
				String ndate = rs.getString("NDATE");
				
				return new Notice(nnum_int, nproject_int, nid, nsubject, ncontent, ndate);
			}
			else {
				return null;
			}
		}catch(SQLException se){
			System.out.println("update SQL Exception");
			return null;  
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null)  con.close();
			}catch(SQLException se){}
		}
	}
	
	public Notice NContent(String seqStr, String nproject) {
		Connection con = null;		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int nnum = Integer.parseInt(seqStr);
		int nproject_int = Integer.parseInt(nproject);
		String sql = semi2.funding.mvc.model.FundingSQL.NOTICECONTENT;
		
		try{			
			con = ds.getConnection();			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nproject_int);			
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				String nid = rs.getString("NID");
				String nsubject = rs.getString("NSUBJECT");
				String ndate = rs.getString("NDATE");
				String ncontent = rs.getString("NCONTENT");
				return new Notice(nproject_int, nnum, nid, nsubject, ncontent, ndate);
			}else {
				return null;
			}
		}catch(SQLException se){	
			System.out.println(" ncontent SQL except");
			return null;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}		
	}
	public void nDel(int nnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = semi2.funding.mvc.model.FundingSQL.NOTICECONTENTDEL;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nnum);
			pstmt.executeUpdate();
		}catch(SQLException se){
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	public boolean nWriteOk(Notice ntc) {
		String sql= semi2.funding.mvc.model.FundingSQL.NOTICEWRITE;
		
		Connection con = null;	
		PreparedStatement pstmt = null;	
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ntc.getNporject());
			pstmt.setString(2, ntc.getNid());
			pstmt.setString(3, ntc.getNsubject());
			pstmt.setString(4, ntc.getNcontent());

			int i = pstmt.executeUpdate();
			if(i>0){
				return true;
			}else{
				return false;
			}
		}catch(SQLException se){
			System.out.println("공지사항 작성 SQL 문제");
			return false;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	ArrayList<Notice> list(int currentPage, int pageSize, String pnum, String pid){
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = semi2.funding.mvc.model.FundingSQL.LIST_PAGE;
	
		int startRow = (currentPage-1)*pageSize;
		int endRow = currentPage*pageSize;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pnum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int nnum = rs.getInt("NNUM");
				int nproject = rs.getInt("NPROJECT");
				String nid = rs.getString("NID");
				String nsubject = rs.getString("NSUBJECT");
				String ncontent = rs.getString("NCONTENT");
				String ndate = rs.getString("NDATE");
				
				Notice no = new Notice(nnum, nproject, nid, nsubject, ncontent, ndate);
				list.add(no);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	long getTotalCount(String pnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = semi2.funding.mvc.model.FundingSQL.COUNT;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				long count = rs.getLong(1);
				return count;
			}else {
				return -1L;
			}
		}catch(SQLException se) {
			return -1L;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	int replyTotalSize(String pnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		int MAXNUM = 0;
		String sql = semi2.funding.mvc.model.FundingSQL.FUNDMAX;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();	
			
			if(rs.next()) {
				MAXNUM = rs.getInt(1);
			}
			return MAXNUM;
		}
		catch(SQLException se){
			return 0;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null)  con.close();
			}catch(SQLException se){}
		}  		
	}
	public ListResult getReplyResult(int cp, int ps, String pnum) {
		System.out.println(cp + ", " + ps + ", " + pnum);
		ArrayList<Comments> rlist = new ArrayList<Comments>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		String sql = semi2.funding.mvc.model.FundingSQL.REPLYLIST;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pnum);
			pstmt.setInt(2, ps*(cp-1));
			pstmt.setInt(3, ps*cp);
			
			rs = pstmt.executeQuery();
			
//			if(rs.next()) {
			while(rs.next()) {
				int cnum = rs.getInt("CNUM");
				int cproject = rs.getInt("CPROJECT");
				String cname = rs.getString("CNAME");
				String ccontent = rs.getString("CCONTENT");
				Date cdate = rs.getDate("CDATE");
  
				rlist.add(new Comments(cnum, cproject, cname, ccontent, cdate));
			}
			System.out.println("DAO cp : "+ cp +", size : " + replyTotalSize(pnum) + ", ps : " + ps + ", listszie: " + rlist.size() );
			return new ListResult(cp, replyTotalSize(pnum), ps, null,  rlist, null, pnum);		
		}
		catch(SQLException se){
			System.out.println("getReplyResult SQL 익셉션");
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null)  con.close();
			}catch(SQLException se){}
		}  	
	}
	
	public FcontentVO fcontent(String pnum) {
		String sql = semi2.funding.mvc.model.FundingSQL.FUNDCONTENT;
		String sql2 = semi2.funding.mvc.model.FundingSQL.FUNDITEM;
		
		ResultSet rs = null;
		ResultSet rs2 = null;
		Connection con = null;
		Connection con2 = null;
		PreparedStatement pstmt = null;	
		PreparedStatement pstmt2 = null;
		
		ArrayList<item> list = new ArrayList<item>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int pnum_int = Integer.parseInt(rs.getString("PNUM"));
				String pid = rs.getString("PID");
				String psubject = rs.getString("PSUBJECT");
				String pcontent = rs.getString("PCONTENT");
				String piname = rs.getString("PINAME");
				String pconiname = rs.getString("PCONINAME");
				int pmoney = rs.getInt("PMONEY");
				int pamount = rs.getInt("PAMOUNT");
				
//				return new Fundingproject(pnum_int, pid, psubject, pcontent, piname, pconiname, pmoney, pamount, getFundCount(pnum));
				con2 = ds.getConnection();
				pstmt2 = con2.prepareStatement(sql2);
				pstmt2.setString(1, pnum);
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()) {
					int inum = rs2.getInt(1);
					int iproject = rs2.getInt(2);
					int price = rs2.getInt(3);
					String ilineup = rs2.getString(4);
					
					list.add(new item(inum, iproject, price, ilineup));
				}
				return new FcontentVO(new Fundingproject(pnum_int, pid, psubject, pcontent, piname, pconiname, pmoney, pamount, getFundCount(pnum)), list);
				
			}
			else {
				System.out.println("rs 오류");
				return null;
			}
		}
		catch(SQLException se) {
			System.out.println("fcontent SQL Exception");
			return null;  
		}finally{
			try{
				if(rs != null) rs.close();
				if(rs2 != null) rs2.close();
				if(pstmt != null) pstmt.close();
				if(pstmt2 != null) pstmt2.close();
				if(con != null)  con.close();
				if(con2 != null)  con2.close();
			}catch(SQLException se){}
		}
	}

	private int getFundCount(String pnum) {
		String sql = semi2.funding.mvc.model.FundingSQL.FUNDCOUNT;
		
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;	
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int fcount = Integer.parseInt(rs.getString(1));
				return fcount;
			}
			else {
				System.out.println("rs 오류");
				return -1;
			}
		}
		catch(SQLException se) {
			System.out.println("getfundcount SQL Exception");
			return -1;  
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null)  con.close();
			}catch(SQLException se){}
		}
	}
	public boolean updateDona(Fundingproject fundprj) {
		String sql = semi2.funding.mvc.model.FundingSQL.FUNDDONA;
		String sql2 = semi2.funding.mvc.model.FundingSQL.INSERTDONA;
		
		Connection con = null;
		PreparedStatement pstmt = null;	
		PreparedStatement pstmt2 = null;	
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			System.out.println(fundprj.getAddmoney() + ", " + fundprj.getPnum());
			pstmt.setInt(1, fundprj.getAddmoney());
			pstmt.setInt(2, fundprj.getPnum());
			
			pstmt2 = con.prepareStatement(sql2);
			System.out.println();
			pstmt2.setString(1, fundprj.getDid());
			pstmt2.setInt(2, fundprj.getPnum());
			pstmt2.setInt(3, fundprj.getDitem());
						
			int i = pstmt.executeUpdate();
			i += pstmt2.executeUpdate();
			if (i > 1) {
				System.out.println("i : " + i);
				return true;
			} else {
				return false;
			}
		}
		catch(SQLException se){
			System.out.println("updateDona SQL Exception");
			return false;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(pstmt2 != null) pstmt2.close();
				if(con != null)  con.close();
			}catch(SQLException se){}
		}  
	}
	
	public boolean replyOk(Comments cmm) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = semi2.funding.mvc.model.FundingSQL.COMMENTSWRITE;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cmm.getCproject());
			pstmt.setString(2, cmm.getCname());
			pstmt.setString(3, cmm.getCcontent());
			System.out.println(cmm.getCproject() + ", " + cmm.getCname() + ", " + cmm.getCcontent());
			
			int i = pstmt.executeUpdate();
		
			if(i>0) return true;
			else return false;
		}catch(SQLException se) {
			System.out.println("댓글 작성 SQL EXCEPTION");
			return false;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	//---------------------------------로그인 메소드
	Member getMember(String userid){
		System.out.println("DAO: " + userid);
		Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = semi2.funding.mvc.model.FundingSQL.LOGIN;
	    try {
	    	con = ds.getConnection();
	    	pstmt = con.prepareStatement(sql);
	    	pstmt.setString(1, userid);
	    	rs	= pstmt.executeQuery();
	    	if(rs.next()) {
	    		System.out.println("DAO 32");
	    		//int seq = rs.getInt(1);
	    		String id = rs.getString(1);
	    		String pwd = rs.getString(2);
	    		String nickname = rs.getString(3);
	    		String email = rs.getString(4);
	    		Date sysdate = rs.getDate(5);
	    		
	    		//System.out.println("seq: " + seq);
	    		System.out.println("userid: " + userid);
	    		System.out.println("pwd: " + pwd);
	    		System.out.println("nickname: " + nickname);
	    		System.out.println("email: " + email);
	    		System.out.println("sysdate: " + sysdate);
	    		
	    		return new Member(id, pwd, nickname, email, sysdate);
	    	}else {
	    		return null;
	    	}
	    }catch(SQLException se) {
	    	se.printStackTrace(); 
	    	return null;
	    }finally {
	    	try {
	    		if(rs != null) rs.close();
	    		if(pstmt != null) pstmt.close();
	    		if(con != null) con.close();
	    	}catch(SQLException se) {}
	    }
	}
	//---------------------------------회원가입 메소드
	public boolean insert(Users dto) {
		String sql= semi2.funding.mvc.model.FundingSQL.USERINSER;
		
		Connection con = null;	
		PreparedStatement pstmt = null;	
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUpwd());
			pstmt.setString(3, dto.getUname());
			pstmt.setString(4, dto.getUemail());
			//pstmt.setString(5, dto.getUdate());
			System.out.println(dto.getUserid() + ", " +dto.getUpwd() + ", " + dto.getUname() + ", " +dto.getUemail());
//			int i=0;
			int i = pstmt.executeUpdate();
			if(i>0){
				return true;
			}else{
				System.out.println("회원가입 false");
				return false;
			}
		}catch(SQLException se){
			System.out.println("회원가입 SQL except");
			return false;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	//------------------------메인
	ArrayList<Board> getList(){
		ArrayList<Board> list = new ArrayList<Board>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = semi2.funding.mvc.model.FundingSQL.MAINLISTS;
		try {
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				long seq = rs.getLong(1);
				String pid = rs.getString("PID");
				String psubject = rs.getString("PSUBJECT");
				String pcontent = rs.getString("PCONTENT");
				if(pcontent.length()>20) {
					pcontent = pcontent.substring(0, 20);
				}
				String piname = rs.getString("PINAME");
				String pconiname = rs.getString("PCONINAME");
				long pmoney = rs.getLong("PMONEY");
				long pamount = rs.getLong("PAMOUNT");
				
				Board b = new Board(seq, pid, psubject, pcontent, piname, pconiname, pmoney, pamount);
				list.add(b);
			}
			return list;
		}catch(SQLException se) {
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	//------------프로젝트 등록 및 서치
	ArrayList<Board> getSearch(String str){
		ArrayList<Board> lists = new ArrayList<Board>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = semi2.funding.mvc.model.FundingSQL.SEARCH;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+str+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println("7");
				long seq = rs.getLong(1);
				String pid = rs.getString("PID");
				String psubject = rs.getString("PSUBJECT");
				
				String pcontent = rs.getString("PCONTENT");
				if(pcontent.length()>20) {
					pcontent = pcontent.substring(0, 20);
				}
				String piname = rs.getString("PINAME");
				String pconiname = rs.getString("PCONINAME");
				long pmoney = rs.getLong("PMONEY");
				long pamount = rs.getLong("PAMOUNT");
				
				Board b = new Board(seq, pid, psubject, pcontent, piname, pconiname, pmoney, pamount);
				lists.add(b);
			}
			return lists;
		}catch(SQLException se) {
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	boolean getUpload(Board board) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = semi2.funding.mvc.model.FundingSQL.INSERTPJ;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getPid());
			pstmt.setString(2, board.getPsubject());
			pstmt.setString(3, board.getPcontent());
			pstmt.setString(4, board.getPiname());
			pstmt.setString(5, board.getPconiname());
			pstmt.setLong(6, board.getPmoney());
			int i = pstmt.executeUpdate();
			if(i>0) return true;
			else return false;
		}catch(SQLException se) {
			return false;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	boolean getItem(long iprice, String ilineup, String pid) {
		
		
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		String sql1 = semi2.funding.mvc.model.FundingSQL.PJNUM;
		String sql2 = semi2.funding.mvc.model.FundingSQL.INSERTIT;
		
		long pnum =0;
		
		try {
			con = ds.getConnection();
			pstmt1 = con.prepareStatement(sql1);
			pstmt1.setString(1, pid);
			
			rs = pstmt1.executeQuery();
			
			if(rs.next()) {
				pnum = rs.getLong("PNUM");
				
			}
				if(pstmt1 != null) pstmt1.close();
			
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setLong(1, pnum);
			pstmt2.setLong(2, iprice);
			pstmt2.setString(3, ilineup);
			int i = pstmt2.executeUpdate();
			if(i>0) return true;
			else return false;
		}catch(SQLException se) {
			return false;
		}finally {
			try {
				if(pstmt2 != null) pstmt2.close();				
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
}
