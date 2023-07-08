package com.ottt.ottt.domain;
import static java.util.Objects.requireNonNullElse;

import java.util.List;

import org.springframework.web.util.UriComponentsBuilder;

import static java.lang.Math.*;

public class SearchItem {
	
	public static final int DEFAULT_PAGE_SIZE = 10;
	public static final int MIN_PAGE_SIZE = 1;
	public static final int MAX_PAGE_SIZE = 50;
	
	private Integer page = 1;
	private Integer pageSize = DEFAULT_PAGE_SIZE;
	private String keyword = "";
	private String option = "";
	private Integer offset;
	private String user;
	private Integer user_no;
	private Integer content_no;
	private String content_nm;
	private List<Integer> ott_no;
	private List<Integer> genre_no;
	private List<Integer> category_no;
	private Integer categoryNo;
	private String category;

	public SearchItem() {};
	
	public SearchItem(Integer page, Integer pageSize) {
		this(page, pageSize, "", "");
	}
	
	public SearchItem(Integer page, Integer pageSize, String option, String keyword) {
		this.page = page;
		this.pageSize = pageSize;
		this.option = option;
		this.keyword = keyword;
	}
	
	public SearchItem(Integer page, String user
			, Integer content_no, Integer user_no) {
		this.page = page;
		this.user = user;
		this.content_no = content_no;
		this.user_no = user_no;
	}
		
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		//pageSize가 null일 때 default값을 반환
		this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
		
		//MIN_PAGE_SIZE <= pageSize <= MAX_PAGE_SIZE
		this.pageSize = max(MIN_PAGE_SIZE, min(this.pageSize, MAX_PAGE_SIZE));
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	
	public String getQueryString() {
		return getQueryString(page);
	}
	
	//?page=10&pageSize=10&option=A&keyword=title 
	public String getQueryString(Integer page) {
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.queryParam("option", option)
				.queryParam("keyword", keyword)
				.build().toString();
	}
	
	public String getString() {
		return getString(page);
	}
	
	public String getString(Integer page) {
		return UriComponentsBuilder.newInstance()
				.queryParam("user", user)
				.queryParam("content", content_no)
				.build().toString();
	}
	
	public String getList() {
		return getList(page);
	}
	
	public String getList(Integer page) {
		return UriComponentsBuilder.newInstance()
				.queryParam("user", user)
				.queryParam("page", page)
				.build().toString();
	}
	
	public String getContentList() {
		return getList(page);
	}
	
	public String getContentList(Integer page) {
		return UriComponentsBuilder.newInstance()
				.queryParam("category", category)
				.queryParam("page", page)
				.queryParam("option", option)
				.build().toString();
	}
	
	public String getSearchString(Integer page) {
		
		return UriComponentsBuilder.newInstance()
				.queryParam("content_nm", content_nm)
				.queryParam("ott_no", ott_no)
				.queryParam("genre_no", genre_no)
				.queryParam("category_no", category_no)
				.queryParam("option", option)
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)				
				.build().toString();
	}
	
	public String getUserString() {
		return getUserString(user);
	}
	
	public String getUserString(String user) {
		return UriComponentsBuilder.newInstance()
				.queryParam("user", user)
				.build().toString();
	}	
	public String getContent_nm() {
		return content_nm;
	}

	public void setContent_nm(String content_nm) {
		this.content_nm = content_nm;
	}

	public List<Integer> getOtt_no() {
		return ott_no;
	}

	public void setOtt_no(List<Integer> ott_no) {
		this.ott_no = ott_no;
	}

	public List<Integer> getCategory_no() {
		return category_no;
	}

	public void setCategory_no(List<Integer> category_no) {
		this.category_no = category_no;
	}

	public List<Integer> getGenre_no() {
		return genre_no;
	}

	public void setGenre_no(List<Integer> genre_no) {
		this.genre_no = genre_no;
	}

	public Integer getOffset() {
		int result = (page-1)*pageSize;
		if(result < 0) result = 0;
		return result;
	}

	public void setOffset(Integer offset) {
		offset = offset;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Integer getUser_no() {
		return user_no;
	}

	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}

	public Integer getContent_no() {
		return content_no;
	}

	public void setContent_no(Integer content_no) {
		this.content_no = content_no;
	}
	
	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Integer getCategoryNo() {
		return categoryNo;
	}

	@Override
	public String toString() {
		return "SearchItem [page=" + page + ", pageSize=" + pageSize + ", user=" + user + ", user_no=" + user_no
				+ ", content_no=" + content_no + ", content_nm=" + content_nm + ", ott_no=" + ott_no + ", genre_no="
				+ genre_no + ", category_no=" + category_no + ", categoryNo=" + categoryNo + "]";
	}
	
	
}
