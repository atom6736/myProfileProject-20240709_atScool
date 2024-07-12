package com.chihwancompany.profile.dto;

public class Criteria {
	
	private int amount = 10; // 한 페이지당 출력될 글의 개수 amount
	private int pageNum = 1;  // 클라이언트가 클릭한 페이지 번호가 저장될 변수. 초기값은 무조건 1.
	private int stratNum;  // 이것은 초기갑이 없음. 클라이언트가 선택한 페이지에서 시작할 글의 번호(row number)
	
	public Criteria() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Criteria(int amount, int pageNum, int stratNum) {
		super();
		this.amount = amount;
		this.pageNum = pageNum;
		this.stratNum = stratNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getStratNum() {
		return stratNum;
	}
	public void setStratNum(int stratNum) {
		this.stratNum = stratNum;
	}

	
}
