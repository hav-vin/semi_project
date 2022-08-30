package semi2.funding.mvc.model;

public class FundingSQL {
	static final String FUNDCONTENT = "select * from fundingproject where pnum = ?";
	static final String FUNDCOUNT ="select count(*) from donate where dproject= ?";
	static final String FUNDITEM = "select * from item where iproject = ?";
	static final String FUNDDONA = "update fundingproject set pamount = pamount + ? where pnum = ?";
	static final String INSERTDONA = "insert into DONATE values(DONATE_SEQ_PK.nextval, ?, ?, ?)";
	static final String REPLYLIST = "select * from (select ROWNUM rnum, aa.* from (select * from Comments where cproject = ? order by cnum desc) aa) where rnum > ? and rnum <= ?";
	static final String FUNDMAX = "select MAX(ROWNUM) from COMMENTS where cproject = ?";
	static final String COMMENTSWRITE = "insert into COMMENTS values(COMMENTS_SEQ_PK.nextval, ?, ?, ?, to_char(SYSDATE, 'YY/MM/DD'))";
	static final String LOGIN = "select * from USERS where USERID=?";
	static final String USERINSER = "insert into USERS values(?, ?, ?, ?, to_char(SYSDATE, 'YY/MM/DD'))";
	static final String LIST_PAGE 
	= "select * from (select ROWNUM rnum, aa.* from (select * from NOTICE where NPROJECT=? order by NNUM desc) aa) where rnum> ? and rnum<=?";
	static final String COUNT = "select COUNT(NNUM) from NOTICE where NPROJECT = ?";
	static final String NOTICEWRITE = "insert into NOTICE values(NOTICE_SEQ_PK.nextval, ?, ?, ?, ?, to_char(SYSDATE, 'YY/MM/DD'))";
	static final String MAINLISTS = "select * from FUNDINGPROJECT order by PNUM desc";
	static final String SEARCH = "select * from FUNDINGPROJECT where PSUBJECT like ? order by PNUM desc";
	static final String INSERTPJ = 
			"insert into FUNDINGPROJECT(PNUM, PID, PSUBJECT, PCONTENT, PINAME, PCONINAME, PMONEY, PAMOUNT) values(FUNDINGPROJECT_SEQ_PK.nextval, ?, ?, ?, ?, ?, ?, 0)";
	static final String PJNUM = "select * from (select PNUM from FUNDINGPROJECT where PID= ? order by pnum desc) where ROWNUM=1";
	static final String INSERTIT = "insert into ITEM(INUM, IPROJECT, UPRICE, ILINEUP) values(ITEM_SEQ_PK.nextval, ?, ?, ?)";
	static final String NOTICECONTENT = "select * from Notice where NNUM = ?";
	static final String NOTICECONTENTDEL = "delete from Notice where NNUM = ?";
	static final String NOTICEUPDATEOK = "update NOTICE set nsubject = ? , ncontent = ? where nnum = ?";
	static final String SEARCHCOUNT = "select count(*) from notice where nsubject like ? and nproject = ? order by NNUM";
	static final String SEARCH_LIST_PAGE = "select * from (select ROWNUM rnum, aa.* from (select * from NOTICE where NPROJECT = ?  and nsubject like ? order by NNUM desc) aa)";
}
