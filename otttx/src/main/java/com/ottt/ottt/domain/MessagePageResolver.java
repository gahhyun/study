package com.ottt.ottt.domain;

public class MessagePageResolver {

	private MessageSearchItem msc;
	
	private int totalCnt;				//게시물의 총 개수
	private int pageSize;				//한 페이지당 지정된 쪽지의 개수(20)
	private final int NAV_SIZE = 5;		//페이지 네비게이션 크기
	
	private int totalPage;				//총 페이지 개수
	private int page;					//현재 페이지
	
	private int beginPage;				//네비게이션의 첫 페이지 숫자
	private int endPage;				//네비게이션의 끝 페이지 숫자
	private boolean showNext = false;	//다음 페이지로 이동하는 링크 보일지 말지
	private boolean showPrev = false;	//이전 페이지로 이동하는 링크 보일지 말지
	
	//웹페이지를 클릭했을 때 어디서부터 어디까지 나오는 기능
	public MessagePageResolver(int totalCnt, MessageSearchItem msc) {
		this.totalCnt = totalCnt;
		this.msc = msc;
		
		doPaging(totalCnt, msc);
	}
	
	private void doPaging(int totalCnt, MessageSearchItem msc) {
		this.totalPage = totalCnt / msc.getPageSize() + (totalCnt % msc.getPageSize() == 0 ? 0 : 1);
		//page가 totalPage보다 크지 않음. 괄호 안 페이지 중 작은 값이 선택됨. 당연하지만 명시함
		this.msc.setPage(Math.min(msc.getPage(), totalPage));
		
		//현재 페이지를 네비게이션 크기로 나누고, 다시 그 크기만큼 곱해 일의 자리수를 0으로 만든 뒤 1을 더함
		// (25/10)*10+1 -> 21	/ (29/10)*10+1 -> 21 / 일의 자리는 항상 1로 끝나게 됨
		this.beginPage = (this.msc.getPage() - 1) / NAV_SIZE * NAV_SIZE + 1;
		//네비게이션의 마지막 페이지 숫자
		//beginPage에 NAV_SIZE를 더하고 1을 뺀 값과 totalPage 수 중에 작은 것을 구함
		this.endPage = Math.min(this.beginPage + this.NAV_SIZE - 1, totalPage);
		
		//beginPage가 1이 아니면 true(앞으로 가기 버튼 보일지 말지 여부)
		this.showPrev = beginPage != 1;
		//endPage가 totalPage가 아니면 true(뒤로 가기 버튼 보일지 말지 여부)
		this.showNext = endPage != totalPage;		
	}
	
	//콘솔창에서 확인
	public void print() {
		System.out.println("현재 페이지 (page) = " + msc.getPage());
		System.out.print(showPrev ? "PREV " : "");
		
		for(int i = beginPage; i <= endPage; i++) {		// 네비바 숫자들 띄워주기 1 2 3 4 5 6 7 8 9 10 >
			System.out.print(i + " ");
		}
		
		System.out.println(showNext ? " NEXT" : "");
	}
	
	public MessagePageResolver(int totalCnt, Integer page, Integer pageSize) {
		this(totalCnt, new MessageSearchItem(page, pageSize));
	}
	
	public MessagePageResolver(int totalCnt, Integer page) {
		this(totalCnt, new MessageSearchItem(page, 20));
	}

	public MessageSearchItem getMsc() {
		return msc;
	}

	public void setMsc(MessageSearchItem msc) {
		this.msc = msc;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public int getNAV_SIZE() {
		return NAV_SIZE;
	}

	@Override
	public String toString() {
		return "MessagePageResolver [msc=" + msc + ", totalCnt=" + totalCnt + ", pageSize=" + pageSize + ", NAV_SIZE="
				+ NAV_SIZE + ", totalPage=" + totalPage + ", page=" + page + ", beginPage=" + beginPage + ", endPage="
				+ endPage + ", showNext=" + showNext + ", showPrev=" + showPrev + "]";
	}
	
}
