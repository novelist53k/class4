package com.class4.movie.util;

import lombok.Data;

@Data
public class PageVO {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int pageNum;
	private int amount;
	private int total;
	private Criteria cri;
	
	public PageVO() {
		
	}
	public PageVO( Criteria cri, int total) {
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		//끝페이지
		this.endPage = (int)Math.ceil(this.pageNum / 20.0) * 10;
		
		//시작페이지
		this.startPage = endPage - 10 + 1;
		
		//real끝페이지
		int realEnd = (int)Math.ceil(this.total / (double)this.amount) ;
		
		
		//endPage -> realEnd
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		//prev 버튼 활성화
		this.prev = startPage > 1;
		
		//next 버튼 활성화
		this.next = realEnd > this.endPage;
		
	}
	
	
	
}
