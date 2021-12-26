package com.mozzle.web.dto.board;

import java.io.Serializable;

public class RowNum_Dto implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1807342103693743891L;
	private int pageList; // 출력할 페이지의 번호 갯수
	private int index; //출력한 페이지
	private int pageNum; // 출력할 페이지의 시작번호
	private int listNum; // 출력할 리스트의 갯수
	private int total; // 리스트의 총갯수
	private String mozzle_id;
	
	
	public String getMozzle_id() {
		return mozzle_id;
	}



	public void setMozzle_id(String mozzle_id) {
		this.mozzle_id = mozzle_id;
	}

	{
		pageList = 5;
		index = 0;
		pageNum = 1;
		listNum=5;
	}
	
	
	public RowNum_Dto() {
	}
	
	
	






	@Override
	public String toString() {
		return "RowNum_Dto [pageList=" + pageList + ", index=" + index + ", pageNum=" + pageNum + ", listNum=" + listNum
				+ ", total=" + total + ", mozzle_id=" + mozzle_id + "]";
	}



	// 화면에서 입력 받는 변화 하는 값
	public RowNum_Dto(String index, String pageNum, String listNum) {
		if(index!= null) {
			this.index = Integer.parseInt(index);
		}
		if(pageNum!=null) {
			this.pageNum = Integer.parseInt(pageNum);
		}
		if(listNum!= null) {
			this.listNum = Integer.parseInt(listNum);
		}
	}
	
	
	
	//paging 처리시 database의 글의 갯수를 가져옴 
	// 쿼리 문의 between의 범위
	
	public int getStart() {
		return index*listNum +1;
	}
	
	public int getLast() {
		return (index*listNum) + listNum;
	}
	
	
	public int getCount() {
		int temp = total - listNum*(pageNum-1); // 35 - 5*(6-1) =>10;
		int min = temp/listNum; //10/5 2
		int count =0;
		
		if(temp%listNum !=0) {
			min++;
		}
		
		if(temp <= listNum) {
			count = pageNum;
		}else if(min <= pageList) {
			count =min+pageNum-1;
		}else {
			count = pageList+pageNum-1;
		}
		return count;
	}

	
	
	public int getPageList() {
		return pageList;
	}

	public void setPageList(int pageList) {
		this.pageList = pageList;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
}




