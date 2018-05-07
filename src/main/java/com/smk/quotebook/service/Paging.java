package com.smk.quotebook.service;

public class Paging {
	private int currentPage = 1;
	private int pageSize = 5;
	private int blockSize = 5;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	private int total;
	private int pageCnt;
	public Paging(int total, String pageNum) {
		this.total = total;
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		startRow = (currentPage - 1) * pageSize + 1;
		endRow = startRow + pageSize - 1;
		pageCnt = (int)Math.ceil((double)total/pageSize);
		startPage = ((currentPage - 1)/blockSize)*blockSize + 1;
		endPage = startPage + blockSize - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
	}
	public Paging(int total, String pageNum, int pageSize) {
		this.total = total;
		this.pageSize = pageSize;
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		startRow = (currentPage - 1) * pageSize + 1;
		endRow = startRow + pageSize - 1;
		pageCnt = (int)Math.ceil((double)total/pageSize);
		startPage = ((currentPage - 1)/blockSize)*blockSize + 1;
		endPage = startPage + blockSize - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	
}
