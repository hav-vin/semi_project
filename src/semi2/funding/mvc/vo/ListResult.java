package semi2.funding.mvc.vo;

import java.util.List;

import semi2.funding.mvc.domain.Comments;
import semi2.funding.mvc.domain.Notice;

public class ListResult {
	private int currentPage;	//����������
	private long totalCount;	// �� �Խñ� ����
	private int pageSize;		// �� ��Ͽ� �ִ� ������ ����
	private List<Notice> list;	//�ҷ��� ����Ʈ?
	private long totalPageCount;	// �� ����¡ ����
	private List<Comments> comlist;	//��� ����Ʈ
	private String noticePid;
	private String pnum;
	
	public ListResult() {}
	// ���� ������
	public ListResult(int currentPage, long totalCount, int pageSize, List<Notice> list) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
	}
	//�߰��� ������ ����� ����Ʈ�� �������ֵ����ϱ�
	public ListResult(int currentPage, long totalCount, int pageSize, List<Notice> list, List<Comments> comlist) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
		this.comlist = comlist;
	}
	// �ۼ��� ���������� ������ ���̵���� �ޱ� ���� ������
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
