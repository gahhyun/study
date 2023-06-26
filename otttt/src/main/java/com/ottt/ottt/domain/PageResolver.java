package com.ottt.ottt.domain;

public class PageResolver {
	
	private SearchItem sc;
	
	private int totalCnt;			//게시물 총 개수
	private int pageSize;			//한 페이지당 게시물 개수
	private final int NAV_SIZE=5;	//page navigation size
	
	private int totalPage;			//전체 페이지 개수
	private int page;				//현재 페이지
	
	private int beginPage;			//내비게이션 첫 페이지 숫자
	private int endPage;			//내비게이션 마지막 페이지 숫자
	private boolean showNext = false; //다음 페이지로 이동하는 링크를 보여줄지 여부(endPage==totalPage이면 showNext는 false)
	private boolean showPrev = false; //이전 페이지로 이동하는 링크를 보여줄지 여부(beginPage!=1이면 showPrev는 true)
	
	public PageResolver(int totalCnt, Integer page) {
		this(totalCnt, new SearchItem(page, 10));
	}
	
	public PageResolver(int tatalCnt, Integer page, Integer pageSize) {
		this(tatalCnt, new SearchItem(page, pageSize));
	}
	
	public PageResolver(int totalCnt, SearchItem sc) {
		this.totalCnt = totalCnt;
		this.sc = sc;
		
		doPaging(totalCnt, sc);
	}

	private void doPaging(int totalCnt, SearchItem sc) {
		//전체 게시물수 초기화
		this.totalPage = totalCnt/sc.getPageSize() + (totalCnt%sc.getPageSize()==0?0:1);
		//page가 totalPage보다 크지 않아야함
		this.sc.setPage(Math.min(sc.getPage(), totalPage));
		
		//현재 페이지(page)를 네비게이션 크기(nav_size)로 나누고, 
		//다시 네비게이션 크기를 곱해서 1의 자리수를 0으로 만들고 1을 더함
		this.beginPage = (this.sc.getPage()-1)/NAV_SIZE*NAV_SIZE+1;
		
		//네비게이션 마지막 페이지 숫자
		//beginPage에 네비게이션 크기(nav_size)를 더하고 1을 뺀 결과
		//총 페이지수(totalPage) 중에 작은 것을 구함
		this.endPage = Math.min(this.beginPage + this.NAV_SIZE-1, totalPage);
		
		//beginPage가 1가 아니면 true로 함(< 기호가 보임)
		this.showPrev = beginPage != 1;
		
		//endPage가 totalPage가 아니면 true로 함(> 기호가 보임)
		this.showNext = endPage != totalPage;
	}
	
	public void print() {
		System.out.println("page = "+sc.getPage());
		System.out.println(showPrev ? "PREV ": "");
		
		for(int i = beginPage; i<=endPage; i++) {
			System.out.println(i + " ");
		}
		
		System.out.println(showNext ? " NEXT" : "");
		
	}

	public SearchItem getSc() {
		return sc;
	}

	public void setSc(SearchItem sc) {
		this.sc = sc;
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

	@Override
	public String toString() {
		return "PageResolver [sc=" + sc + ", totalCnt=" + totalCnt + ", pageSize=" + pageSize + ", NAV_SIZE=" + NAV_SIZE
				+ ", totalPage=" + totalPage + ", page=" + page + ", beginPage=" + beginPage + ", endPage=" + endPage
				+ ", showNext=" + showNext + ", showPrev=" + showPrev + "]";
	}
}
