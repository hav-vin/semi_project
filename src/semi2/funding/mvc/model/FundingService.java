package semi2.funding.mvc.model;

import java.util.ArrayList;

import semi2.funding.mvc.domain.Board;
import semi2.funding.mvc.domain.Comments;
import semi2.funding.mvc.domain.Fundingproject;
import semi2.funding.mvc.domain.Member;
import semi2.funding.mvc.domain.Notice;
import semi2.funding.mvc.domain.Users;
import semi2.funding.mvc.vo.FcontentVO;
import semi2.funding.mvc.vo.ListResult;


public class FundingService {
	private FundingDAO dao;
	private static final FundingService instance = new FundingService();
	
	private FundingService() {
		dao = new FundingDAO();
	}
	public static FundingService getInstance() {
		return instance;
	}	
	public FcontentVO fcontentS(String pnum) {
		return dao.fcontent(pnum);
	}
	public boolean updateDonaS(Fundingproject fundprj) {
		return dao.updateDona(fundprj);
	}
	public ListResult getReplyResultS(int cp, int ps, String pnum) {
		return dao.getReplyResult(cp, ps, pnum);
	}
	public boolean replyOkS(Comments cmm) {
		return dao.replyOk(cmm);
	}
	public int checkMember(String userid, String pwd) {
		System.out.println("Service 16");
		Member m = dao.getMember(userid);
		if(m == null) {
			return LoginSet.NO_ID; //그런 이메일을 가진 회원이 없음
		}else {
			String pwdDb = m.getPwd();
			if(pwdDb != null) pwdDb = pwdDb.trim();
			
			if(!pwd.equals(pwdDb)) {
				return LoginSet.NO_PWD; //PWD불일치 
			}else {
				return LoginSet.PASS; //PWD 일치 
				
			}
		}
	}
	public Member getMemberS(String userid) {
		System.out.println("Service 34");
		Member m = dao.getMember(userid);
		m.setPwd("");
		
		return m;
	}
	public boolean insertS(Users dto) {
		return dao.insert(dto);
	}
	public ListResult getListResult(int currentPage, int pageSize, String pnum, String pid) {
		ArrayList<Notice> list = dao.list(currentPage, pageSize , pnum ,pid);
		long totalCount = dao.getTotalCount(pnum);
		ListResult r = new ListResult(currentPage, totalCount, pageSize, list, null, pid , pnum);
		
		return r;
	}
	public ListResult searchNotice(int cp, int ps, String category, String searchval, String pnum, String pid) {
		ArrayList<Notice> serlist = dao.searchList(cp, ps , category ,searchval, pnum, pid);
		long totalCount = dao.getSearchCount(pnum, searchval);
		ListResult r = new ListResult(cp, totalCount, ps, serlist, null, pid , pnum);
		
		return r;
	}
	public boolean nWriteOkS(Notice ntc) {
		return dao.nWriteOk(ntc);
	}
	public ArrayList<Board> getListS() {
		return dao.getList();
	}
	public ArrayList<Board> getSearchS(String str) {
		return dao.getSearch(str);
	}
	
	public boolean getUploadS(Board board) {
		return dao.getUpload(board);
	}
	
	public boolean getItemS(long iprice, String ilineup, String pid) {
		return dao.getItem(iprice, ilineup, pid);
	}
	
	public Notice nContent(String nnum, String nproject) {		
		return dao.NContent(nnum, nproject);		
	}
	public void nDelS(int nnum){
		dao.nDel(nnum);		
	}
	public Notice nupdateS(String nnum) {
		return dao.nupdate(nnum);
	}
	public boolean nupdateOkS(Notice ntc) {
		return dao.nupdateOk(ntc);
	}
}
