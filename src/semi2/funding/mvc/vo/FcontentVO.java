package semi2.funding.mvc.vo;

import java.util.ArrayList;
import java.util.List;

import semi2.funding.mvc.domain.Fundingproject;
import semi2.funding.mvc.domain.item;

public class FcontentVO {
	private Fundingproject fundingprj;
	private ArrayList<item> ilist;
	
	public FcontentVO() {}

	public FcontentVO(Fundingproject fundingprj, ArrayList<item> ilist) {
		this.fundingprj = fundingprj;
		this.ilist = ilist;
	}

	public Fundingproject getFundingprj() {
		return fundingprj;
	}

	public void setFundingprj(Fundingproject fundingprj) {
		this.fundingprj = fundingprj;
	}

	public ArrayList<item> getIlist() {
		return ilist;
	}

	public void setIlist(ArrayList<item> ilist) {
		this.ilist = ilist;
	}
}
