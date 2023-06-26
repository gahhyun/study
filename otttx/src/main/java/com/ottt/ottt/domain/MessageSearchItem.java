package com.ottt.ottt.domain;

import static java.util.Objects.requireNonNullElse;

import org.springframework.web.util.UriComponentsBuilder;

import static java.lang.Math.*;

public class MessageSearchItem {
	
	//상수로 정의
	//기본, 최소, 최대 게시물 개수
	public static final int DEFAULT_PAGE_SIZE = 20;
	public static final int MIN_PAGE_SIZE = 5;
	public static final int MAX_PAGE_SIZE = 100;
	
	//전체 게시물 긁어옴
	private Integer page = 1;
	private Integer pageSize = DEFAULT_PAGE_SIZE;
	private Integer user_no;	
	
	public MessageSearchItem() {};

	public MessageSearchItem(Integer page, Integer pageSize, Integer user_no) {
		this.page = page;
		this.pageSize = pageSize;
		this.user_no = user_no;

	}

	//page와 pageSize는 늘 존재
	public MessageSearchItem(Integer page, Integer pageSize) {
		this(page, pageSize, 0);
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
		//pageSize가 null일 때 기본값 반환
		this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
		
		//페이지에 딱 진입했을 때 게시물 개수가 최소 보다 크거나 같고, 최대보다 작을 땐 현재 게시물 개수 적용함
		this.pageSize = max(MIN_PAGE_SIZE, min(pageSize, MAX_PAGE_SIZE));
	}

	//특정 페이지를 넘김
	public String getQueryString() {
		return getQueryString(page);
	}
	
	//?page=n&pageSize=nn
	public String getQueryString(Integer page) {
		//쿼리스트링 정보 생성해서 넘기기
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.build().toString();
	}
	
	public Integer getUser_no() {
		return user_no;
	}

	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}

	public Integer getOffset() {
		int result = (page - 1) * pageSize;
		if(result < 0) {
			result = 0;
		}
		return result;
	}
	
	
	
}
