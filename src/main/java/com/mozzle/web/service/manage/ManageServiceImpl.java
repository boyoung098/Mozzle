package com.mozzle.web.service.manage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dao.manage.IManageDao;
import com.mozzle.web.dto.manage.MozzleDto;

@Service
public class ManageServiceImpl implements IManageService {
	
	@Autowired
	IManageDao dao;

	@Override
	public int registMozzle(MozzleDto mozzle) {
		int checkNum01 = dao.registMozzle(mozzle);
		int checkNum02 = dao.registLeader(mozzle);
		return checkNum01 + checkNum02;
	}

	@Override
	public List<MozzleDto> selectMozzleByCreatDate() {
		List<MozzleDto> mList = dao.selectMozzleByCreatDate();
		
		for (MozzleDto mozzleDto : mList) {
			mozzleDto.setMemberCnt(dao.selectUserNum(mozzleDto.getMozzle_id()));
		}
		
		return mList; 	
	}

	@Override
	public MozzleDto selectMozzleByMozzleId(String mozzle_id) {
		return dao.selectMozzleByMozzleId(mozzle_id);
	}

	@Override
	public List<MozzleDto> selectMozzleByUserNumber() {
		List<MozzleDto> mList = dao.selectMozzleByUserNumber();
		for (MozzleDto mozzleDto : mList) {
			mozzleDto.setLeader_id(dao.searchLeaderId(mozzleDto.getMozzle_id()));
		}
		
		return mList; 
	}

	@Override
	public List<MozzleDto> selectMyMozzle(String user_id) {;
		List<MozzleDto> mList = dao.selectMyMozzle(user_id);
		
		for (MozzleDto mozzleDto : mList) {
			mozzleDto.setMemberCnt(dao.selectUserNum(mozzleDto.getMozzle_id()));
		}
		
		return mList; 
	}

	@Override
	public List<MozzleDto> selectMozzleBySearchBasedeOnImportance(String keyword) {
		return dao.selectMozzleBySearchBasedOnImportance(keyword);
	}

	@Override
	public List<MozzleDto> selectMozzleBySearchFromTheLastest(String keyword) {
		return dao.selectMozzleBySearchFromTheLastest(keyword);
	}

	@Override
	public String[] selectCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMozzle(MozzleDto mozzle) {
		return dao.updateMozzle(mozzle);
	}

	@Override
	public String selectMozzleIdByMozzleName(String mozzleName) {
		return dao.selectMozzleIdByMozzleName(mozzleName);
	}

	@Override
	public int mozzleNameCheck(String mozzle_name) {
		return dao.mozzleNameCheck(mozzle_name);
	}

}
