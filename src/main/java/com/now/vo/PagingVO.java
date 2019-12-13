package com.now.vo;

public class PagingVO {
	// 게시판 페이징 처리하는 부분은 공통 부분이다.
	private int totalRowCount;	// 총 레코드 건수
	private int screenListSize;		// 화면에서 보여줄 레코드 목록 개수
	private int totalPageCount;	// 총 페이지 수
	private int curPage;		// 현재 페이지 번호
	private int startRow;		// 시작 레코드 번호
	private int endRow;				// 끝 레코드 번호
	
	private int pageListSize;	// 화면에 보여줄 페이지 목록 갯수
	private int startPage;		// 시작 페이지 번호
	private int endPage;		// 끝 페이지 번호
	
	public void pageSetting() {
		// 페이지 관련 초기화 및 계산
		if(curPage < 1) curPage = 1;
		if(screenListSize < 1) screenListSize = 10;
		if(pageListSize < 1) pageListSize = 10;
		
		//전자정부에는 이게 하나더 있는데...
		if(totalRowCount < 0) {	// 레코드가 없다면 굳이 계산할 필요없이 초기화만 하면됨.
			totalRowCount = 0;
			startRow = 0;
			endRow = 0;
			startPage = 0;
			endPage = 0;
		}else {
			// (23 - 1)/5+1 = ?(5)
			totalPageCount = (totalRowCount - 1) / screenListSize + 1;
			// curPage = 2이면 ---> startRow = 11, endRow = 20 
			startRow = (curPage -1) * screenListSize + 1;
			endRow = (curPage * screenListSize);
			
			// curPage = 2이면, pageListSize = 10 -> startPage = 1, endPage = 10
			startPage = ( (curPage-1) / pageListSize ) * pageListSize + 1;
			endPage = startPage + pageListSize - 1;
			
			// endPage 가 > totalPageCount -> endPage = totalPageCount
			// endPage = 10 -> endPage = 3
			if(endPage > totalPageCount) endPage = totalPageCount;
		}
	}
	
	public static void main(String[] args) {
		PagingVO vo = new PagingVO();
		vo.setTotalRowCount(230);
		vo.pageSetting();
		System.out.printf("총페이지 건수 %d\n", vo.getTotalPageCount());
		System.out.printf("startRpw %d\n", vo.getStartRow());
		System.out.printf("endRow %d\n", vo.getEndRow());
		System.out.printf("startPage %d\n", vo.getStartPage());
		System.out.printf("endPage %d\n", vo.getEndPage());
		
		vo.setCurPage(13);
		vo.pageSetting();
		System.out.printf("총페이지 건수 %d\n", vo.getTotalPageCount());
		System.out.printf("startRpw %d\n", vo.getStartRow());
		System.out.printf("endRow %d\n", vo.getEndRow());
		System.out.printf("startPage %d\n", vo.getStartPage());
		System.out.printf("endPage %d\n", vo.getEndPage());
	}
	
	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}

	public int getScreenListSize() {
		return screenListSize;
	}

	public void setScreenListSize(int screenListSize) {
		this.screenListSize = screenListSize;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPageListSize() {
		return pageListSize;
	}

	public void setPageListSize(int pageListSize) {
		this.pageListSize = pageListSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
	
}
