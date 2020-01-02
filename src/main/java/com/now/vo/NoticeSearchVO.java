package com.now.vo;


public class NoticeSearchVO extends PagingVO{
	
	private String searchType = ""; // 검색구분 : 제목, 작성자, 내용, 전체
	private String searchWord = ""; // 검색어    
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	@Override
	public String toString() {
		return "NoticeSearchVO [searchType=" + searchType + ", searchWord=" + searchWord + "]";
	}
	
	
}