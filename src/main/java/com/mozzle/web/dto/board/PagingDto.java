package com.mozzle.web.dto.board;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import lombok.Data;
import lombok.NoArgsConstructor;

// PagingDto
@Data
public class PagingDto {
	
	private Logger logger = LoggerFactory.getLogger(PagingDto.class);
	
	private int pageCnt;	// 출력할 페이지번호 갯수
	private int index;	// 출력할 페이지 번호
	private int pageStartNum;	// 출력할 페이지 시작 번호
	private int listCnt;	// 출력할 리스트 갯수
	private int total;	// 리스트이 총 갯수

	
	
	
	public PagingDto(String index, String pageStartNum, String listCnt) {
		super();
		logger.info("===================== PagingDto 생성자 호출 실행 시간 {} =====================", new Date());
		// view에서 전달 받은 parameter는 "" or null, 객체로 판단하면
		// index의 초기값이 0일 수 있음, 하지만 parameter를 객체로 받을 경우 0과 값이 없음을 구분하기 편해짐
		if(index != null) {
			this.index = Integer.parseInt(index);
		}
		if(pageStartNum != null) {
			this.pageStartNum = Integer.parseInt(pageStartNum);
		}
		if(listCnt != null) {
			this.listCnt = Integer.parseInt(listCnt);
		}
	}

	public int getStart(){
		logger.info("===================== PagingDto getStart 호출 실행 시간 {} =====================", new Date());
		return index * listCnt + 1;
	}
	
	public int getLast(){
		logger.info("===================== PagingDto getLast 호출 실행 시간 {} =====================", new Date());
		return (index * listCnt) + listCnt;
	}
	
	public int getPageLastNum(){
		logger.info("===================== PagingDto getLastNum 호출 실행 시간 {} =====================", new Date());
		// 전체 갯수 - 출력 리스트 * (시작 번호 - 1)
		// 111 - 5 *(1 - 1) = 111
		int remainListCnt = total - listCnt * (pageStartNum - 1);
		// 111 / 5 = 22
		int remainPageCnt = remainListCnt / listCnt;
		// 111 % 5 != 0 => 23
		if(remainListCnt % listCnt != 0) {
			remainPageCnt++;
		}
		int pageLastNum = 0;
		if(remainListCnt <= listCnt) {
			pageLastNum = pageStartNum;
		}
		else if(remainPageCnt <= pageCnt) {
			pageLastNum = remainPageCnt + pageStartNum - 1;
		}
		else {
			pageLastNum = pageCnt + pageStartNum - 1;
		}
		return pageLastNum;
	}

	{
		logger.info("===================== PagingDto 초기화 블럭 생성 시간 {} =====================", new Date());
		pageCnt = 5;
		index = 0;
		pageStartNum = 1;
		listCnt = 5;
	}


	
	
}
