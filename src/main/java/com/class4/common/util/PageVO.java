package com.class4.common.util;

import lombok.Data;

@Data
public class PageVO {
	
	private int startPage; //페이지네이션의 시작번호
	private int endPage; //페이지네이션의 끝번호
	private boolean prev; //이전페이지 활성화여부
	private boolean next; //다음패이지 활성화여부
	private int pageNum; //조회페이지 번호
	private int amount; //데이터개수
	private int total; //전체게시글수 
	private Criteria cri; //페이지기준 (번호, 데이터 개수)
	
	//PageVO가 생성될때 cri, total반드시 전달 되야하기 때문에 한개로 제한
	
	public PageVO(Criteria cri, int total) {
		//페이지번호, 데이터개수, 전체게시글 수는 전달되는 값에 따라라서 초기화
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		
		//끝페이지 계산
		this.endPage = (int)Math.ceil(this.pageNum / 10.0) * 10;
		
		//첫페이지 계산
		this.startPage = endPage - 10 + 1;
		
		//진짜 끝번호 계산
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		//특정 조건에 따라 endPage를 realEnd변경
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		//이전버튼 활성화여부
		this.prev = startPage > 1;
		
		//다음 버튼은 
		this.next = realEnd > this.endPage;
		
	}
	
}