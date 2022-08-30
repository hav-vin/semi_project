package semi2.funding.mvc.vo;

import java.util.List;

import semi2.funding.mvc.domain.Comments;
import semi2.funding.mvc.domain.Notice;

public class ListResult {
	private int currentPage;	//현재페이지
	private long totalCount;	// 총 게시글 개수
	private int pageSize;		// 한 블록에 있는 페이지 개수
	private List<Notice> list;	//불러올 리스트?
	private long totalPageCount;	// 총 페이징 개수
	private List<Comments> comlist;	//댓글 리스트
	private String noticePid;
	private String pnum;
	
	public ListResult() {}
	// 원래 생성자
	public ListResult(int currentPage, long totalCount, int pageSize, List<Notice> list) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
	}
	//추가한 생성자 댓글의 리스트를 받을수있도록하기
	public ListResult(int currentPage, long totalCount, int pageSize, List<Notice> list, List<Comments> comlist) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
		this.comlist = comlist;
	}
	// 작성한 공지사항의 유저의 아이디까지 받기 위한 생성자
	public ListResult(int currentPage, long totalCount, int pageSize, List<Notice> list, List<Comments> comlist, String noticePid, String pnum) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
		this.comlist = comlist;
		this.noticePid = noticePid;
		this.pnum = pnum;
	}
	
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getNoticePid() {
		return noticePid;
	}
	public void setNoticePid(String noticePid) {
		this.noticePid = noticePid;
	}
	
	private long calTotalPageCount() {
		long tpc = totalCount/pageSize; //tpc 
		if(totalCount%pageSize != 0) tpc++;
		
		return tpc;
	}
	
	public List<Comments> getComlist() {
		return comlist;
	}
	public void setComlist(List<Comments> comlist) {
		this.comlist = comlist;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<Notice> getList() {
		return list;
	}
	public void setList(List<Notice> list) {
		this.list = list;
	}
	public long getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(long totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
}
