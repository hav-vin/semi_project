package semi2.funding.mvc.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import file.mvc.control.FileSet;
import semi2.funding.mvc.domain.Board;
import semi2.funding.mvc.domain.Comments;
import semi2.funding.mvc.domain.Fundingproject;
import semi2.funding.mvc.domain.Member;
import semi2.funding.mvc.domain.Notice;
import semi2.funding.mvc.domain.Users;
import semi2.funding.mvc.model.FundingService;
import semi2.funding.mvc.model.LoginSet;
import semi2.funding.mvc.vo.FcontentVO;
import semi2.funding.mvc.vo.ListResult;

@WebServlet("/funding/funding.do")
public class FundingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int filecount = 0;
	private String s = "search";
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String m = request.getParameter("m");
		
		s = request.getParameter("search");
		System.out.println("메인 m 확인 : " + m);
		if(m != null) {
			m = m.trim();
			// 콘텐트 부분
			if(m.equals("fund_content")) {
				fund_content(request, response);
			}
			else if(m.equals("don_apply")) {
				don_apply(request, response);
			}
			else if(m.equals("reply")) {
				reply(request, response);
			}
			else if(m.equals("infor")) {
				infor(request, response);
			}
			else if(m.equals("replyOk")) {
				replyOk(request, response);
			}
			//로그인  부분
			else if(m.equals("form")) {
				form(request, response);
			}
			else if(m.equals("check")) {
				check(request, response);
			}
			else if(m.equals("out")) {
				out(request, response);
			}
			// 회원가입 부분
			else if(m.equals("addmission")) {
				addmission(request, response);
			}
			else if(m.equals("input")) {
				input(request, response);
			}
			else if(m.equals("list")){
				list(request, response);
			}
			else if(m.equals("n_write")){
				n_write(request, response);
			}
			else if(m.equals("n_writeOk")){
				n_writeOk(request, response);
			}
			else if(m.equals("upload")){
				upload(request, response);
			}
			else if(m.equals("write")){
				write(request, response);
			}
			else if(m.equals("ncontent")){
				ncontent(request, response);
			}
			else if(m.equals("ndel")){
				nDel(request, response);				
			}
			else if(m.equals("nupdate")){
				nupdateControl(request, response);
			}
			else if(m.equals("nupdateOk")){
				nupdateOkControl(request, response);
			}
			else if(m.equals("not_search")) {
				notSearch(request, response);
			}
		}
		else if(m == null && s != null) {
			System.out.println("s확인 :  " + s);
			search(request, response);
		}
		else {
			response.sendRedirect("../index.do");
		}
	}
	private void notSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String category = request.getParameter("sel");
		String searchval = request.getParameter("ser");
		String pnum = request.getParameter("pnum");
		String pid = request.getParameter("pid");
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		//(1) cp 
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		//(2) ps 
		int ps = 5;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);
			
		FundingService service = FundingService.getInstance();
		ListResult listResult = service.searchNotice(cp, ps , category, searchval, pnum, pid);
		request.setAttribute("listResult", listResult);
		if(listResult.getList().size() == 0 && cp>1) {
			response.sendRedirect("funding.do?m=list&cp="+(cp-1));
		}else {
			String view = "noticeList.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
	}
	private void nupdateOkControl(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int nnum = Integer.parseInt(request.getParameter("hidn_nnum_nm"));
		int nproject = Integer.parseInt(request.getParameter("hidn_nporject_nm"));
		String nid = request.getParameter("hidn_uid_nm");
		String notice_sub = request.getParameter("notice_sub");
		String notice_cont = request.getParameter("notice_cont");
		
		Notice ntc = new Notice(nnum, -1, nid, notice_sub, notice_cont, null);
		FundingService service = FundingService.getInstance();
		boolean flag = service.nupdateOkS(ntc);
		request.setAttribute("flag", flag); //boolean -> Boolean -> Object
		request.setAttribute("nporject_nm", nproject);

		String view = "notice_update_ok.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);			
	}
	private void nupdateControl(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nnum = request.getParameter("nnum");
		FundingService service = FundingService.getInstance();
		Notice update = service.nupdateS(nnum);
		request.setAttribute("update", update);
		
		String view = "notice_update.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);	
	}
	public void nDel(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int nnum = 0;
		String seqStr = request.getParameter("nnum");
		String nproject = request.getParameter("nproject");
		
		if(seqStr != null) {
			seqStr = seqStr.trim();
			 nnum = Integer.parseInt(seqStr);
		}
		FundingService service = FundingService.getInstance();
		service.nDelS(nnum);
		
		String view = "funding.do?m=fund_content&pnum="+ nproject;
		response.sendRedirect(view);	
	}
	public void ncontent(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {		
		FundingService service = FundingService.getInstance();
		String nnum = request.getParameter("num");
		String nproject = request.getParameter("nproject");
		System.out.println(nnum + ", "+ nproject);
		Notice nContent = service.nContent(nnum, nproject);
		request.setAttribute("ncontent", nContent);
		
		String view = "content.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
	}
	public void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		HttpSession session = request.getSession();
		session.setAttribute("uid", uid);
		
		String view = "prjWrite.jsp";	
		response.sendRedirect(view);
	}
	
	private void upload(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session =  request.getSession();
		String pid = (String)session.getAttribute("uid");
		String saveDir = FileSet.FILE_DIR;
		File fSaveDir = new File(saveDir);
		if(!fSaveDir.exists()) fSaveDir.mkdirs();
		
		int maxPostSize = 10*1024*1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		MultipartRequest mr = null;
		try{
			mr = new MultipartRequest(request, saveDir, maxPostSize, encoding, policy);
			
			String psubject = mr.getParameter("psubject");
			String pcontent = mr.getParameter("pcontent");
			long pmoney = Integer.parseInt(mr.getParameter("pmoney"));
			
			String piname = mr.getFilesystemName("piname");
			int temp = piname.length();
			int temp2 = piname.lastIndexOf('.');
			String pinametype = piname.substring(temp2, temp).toLowerCase();
			piname = piname.substring(0, temp2)+pinametype;
			String pconiname = mr.getFilesystemName("pconiname");
			int temp3 = pconiname.length();
			int temp4 = pconiname.lastIndexOf('.');
			pinametype = pconiname.substring(temp4, temp3).toLowerCase();
			pconiname = pconiname.substring(0, temp4)+pinametype;
			
			FundingService service = FundingService.getInstance();
			Board board = new Board(-1, pid, psubject, pcontent, piname, pconiname, pmoney, -1);
			service.getUploadS(board);
			try {
				if(mr.getParameter("item1")!=null) {
					String ilineup1 = mr.getParameter("item1");
					long iprice1 = Integer.parseInt(mr.getParameter("price1"));
					service.getItemS(iprice1, ilineup1, pid);
				}
				if(mr.getParameter("item2")!=null) {
					String ilineup2 = mr.getParameter("item2");
					long iprice2 = Integer.parseInt(mr.getParameter("price2"));
					service.getItemS(iprice2, ilineup2, pid);
				}
				if(mr.getParameter("item3")!=null) {
					String ilineup3 = mr.getParameter("item3");
					long iprice3 = Integer.parseInt(mr.getParameter("price3"));
					service.getItemS(iprice3, ilineup3, pid);
				}
				long pnum = 0;
				
			}catch(NumberFormatException e) { 
				System.out.println("NumberFormatException");
			}
			
		}catch(IOException ie) {
			System.out.println("업로드 실패: " + ie);
		}
		
		String view = "../index.do";
		response.sendRedirect(view);
	}
	
	public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("search");
		FundingService service = FundingService.getInstance();
		ArrayList<Board> lists = service.getSearchS(str);
		request.setAttribute("lists", lists);
		String view = "search.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	private void n_writeOk(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pnum = Integer.parseInt(request.getParameter("hidn_pnum_nm"));
		System.out.println("공지사항 글쓰기 번호 확인 : " + pnum);
		String nid = request.getParameter("hidn_uid_nm");
		System.out.println(nid);
		String nsubject = request.getParameter("notice_sub");
		System.out.println(nsubject);
		String ncontent = request.getParameter("notice_cont");
		System.out.println("공지사항 글작성 post 값 확인 : " +pnum + ", " + nsubject + ", " + ncontent);

		Notice ntc = new Notice(-1, pnum, nid, nsubject, ncontent, null);
		
		FundingService service = FundingService.getInstance();
		boolean flag = service.nWriteOkS(ntc);
		request.setAttribute("noticePnumSet", pnum);
		request.setAttribute("flag", flag);
		
		String view = "notice_write_insert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void n_write(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pnum = request.getParameter("pnum");
		System.out.println("write pnum 확인하기 : " + pnum);
		request.setAttribute("noticeWritePnum", pnum);
		
		String view = "notice_write.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);	
	}
	private void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		String pnum = request.getParameter("pnum");
		String pid = request.getParameter("pid");

		//(1) cp 
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		//(2) ps 
		int ps = 5;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);
			
		FundingService service = FundingService.getInstance();
		ListResult listResult = service.getListResult(cp, ps , pnum, pid);
		request.setAttribute("listResult", listResult);
		if(listResult.getList().size() == 0 && cp>1) {
			response.sendRedirect("funding.do?m=list&cp="+(cp-1));
		}else {
			String view = "noticeList.jsp";	
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
		
	}
	private void addmission(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = "user.jsp";
		response.sendRedirect(view);
	}
	private void input(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String uemail = request.getParameter("uemail");
		//String udate = request.getParameter("udate");
		Users dto = new Users(userid, upwd, uname, uemail, null);
		
		FundingService service = FundingService.getInstance();
		boolean flag = service.insertS(dto);
		request.setAttribute("flag", flag); //boolean -> Boolean -> Object ;
		
		String view = "insert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
	}
	private void form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "loginMain.jsp";
		response.sendRedirect(view);
	}
	
	private void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String userid = request.getParameter("iid");
	    String pwd = request.getParameter("userpw");
	    if(userid != null) userid = userid.trim();
	    if(pwd != null) pwd = pwd.trim();
	    
	    FundingService service = FundingService.getInstance();
	    int rCode = service.checkMember(userid, pwd);
	    request.setAttribute("rCode", rCode);
	    System.out.println("rCode: " + rCode);
	    
	    if(rCode == LoginSet.PASS) {
	    	HttpSession session = request.getSession();
	    	Member m = service.getMemberS(userid);
	    	session.setAttribute("loginUser", m);
	    
	    	System.out.println("a확인ㅇ : " + m.getUserId());
	    	//세션 session객체에 로그인 아이디가 없는 관계로 아이디가 들어있는 세션을 따로 생성
	    	HttpSession session2 = request.getSession();
	    	session2.setAttribute("u_id", m.getUserId());
	    }
	    
	    String view = "login_msg.jsp";
	    RequestDispatcher rd = request.getRequestDispatcher(view);
	    rd.forward(request, response);
	    
	}
	
	private void out(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		String view = "../index.do";
		response.sendRedirect(view);
	}
	
	private void replyOk(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Member mem = (Member)session.getAttribute("loginUser");
		String session_user = mem.getUserId();
		String content = request.getParameter("reply_cont");
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		
		// 더미데이터 넣기
		Comments cmm = new Comments(-1, pnum, session_user, content, null);
		FundingService service = FundingService.getInstance();
		boolean flag = service.replyOkS(cmm);
		request.setAttribute("flag", flag);
		request.setAttribute("replyOkPnum", pnum);
		
		String view = "replyOk.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void infor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pnum = request.getParameter("pnum");
		
		FundingService  service = FundingService.getInstance();
		FcontentVO fcontent = service.fcontentS(pnum);
		request.setAttribute("fcontent", fcontent);
		
		String view = "infor.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);	
	}
	private void reply(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		int cp=1;
		int ps=5;
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		String pnum = request.getParameter("pnum");
		System.out.println("reply pnum : " + pnum);
		// cp 셋
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}
		else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		// ps 셋
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);	
		FundingService service = FundingService.getInstance();
		ListResult listResult = service.getReplyResultS(cp, ps, pnum);
		request.setAttribute("Replylist", listResult);
		
		if(listResult.getComlist().size() == 0) {
			if(cp > 1)
				response.sendRedirect("funding.do?m=reply&cp="+(cp-1));
			else {
				String view = "reply.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(view);
				rd.forward(request, response);		
			}
		}else {
			String view = "reply.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}	

	}
	private void don_apply(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		int addmoney = Integer.parseInt(request.getParameter("addmoney"));
		int ditem = Integer.parseInt(request.getParameter("ditem"));
		String did = request.getParameter("did");
		
		System.out.println("addmoney : " + addmoney +", pnum : "+pnum + ", ditem : " + ditem + ", did : " + did);
		
		Fundingproject fundprj = new Fundingproject(pnum, addmoney, ditem, did);
		FundingService service = FundingService.getInstance();
		boolean flag = service.updateDonaS(fundprj);
		request.setAttribute("flag", flag);

		String view = "update_donation.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void fund_content(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pnum = request.getParameter("pnum");
		
		FundingService  service = FundingService.getInstance();
		FcontentVO fcontent = service.fcontentS(pnum);
		request.setAttribute("fcontent", fcontent);
		
		String view = "FundingContent.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);	
		
	}

	
}
