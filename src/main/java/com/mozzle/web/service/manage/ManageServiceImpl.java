package com.mozzle.web.service.manage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mozzle.web.dao.manage.IManageDao;
import com.mozzle.web.dto.manage.MozzleDto;

@Service
public class ManageServiceImpl implements IManageService {
	
	@Autowired
	IManageDao dao;
	
	@Override
	public String createMozzleId() {
		return dao.createMozzleId();
	}
	
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
	
	@Transactional
	@Override
	public MozzleDto selectMozzleByMozzleId(String mozzle_id) {
		return dao.selectMozzleByMozzleId(mozzle_id);
	}

	@Override
	public List<MozzleDto> selectMozzleByUserNumber() {
		List<MozzleDto> mList = dao.selectMozzleByUserNumber();
		for (MozzleDto mozzleDto : mList) {
			mozzleDto.setLeader_nickname(dao.searchLeaderNickname(mozzleDto.getMozzle_id()));
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

	@Override
	public boolean checkMember(Map<String, String> map) {
		int n = dao.checkMember(map);
		return (n==1) ? true : false;
	}

	@Override
	public boolean deleteMozzle(String mozzle_id) {
		int n = dao.delflagMozzle(mozzle_id);
		int m = dao.deleteMozzleUser(mozzle_id);
		
		return (n + m) > 0 ? true : false;
	}

	@Override
	public boolean checkMozzleLeader(Map<String, String> map) {
		int n = dao.checkMozzleLeader(map);
		return (n == 1) ? true : false;
	}

	@Override
	public List<MozzleDto> selectAllMyMozzle(String userId) {
		List<MozzleDto> mList = dao.selectAllMyMozzle(userId);
		for (MozzleDto mozzleDto : mList) {
			mozzleDto.setMemberCnt(dao.selectUserNum(mozzleDto.getMozzle_id()));
		}
		return mList;
	}
}
