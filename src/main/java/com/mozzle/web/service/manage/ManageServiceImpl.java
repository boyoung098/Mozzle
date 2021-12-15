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
		return dao.registMozzle(mozzle);
	}

	@Override
	public List<MozzleDto> selectMozzleByCreatDate() {
		return dao.selectMozzleByCreatDate();
	}

	@Override
	public MozzleDto selectMozzleByMozzleId(String mozzle_id) {
		return dao.selectMozzleByMozzleId(mozzle_id);
	}

	@Override
	public List<MozzleDto> selectMozzleByUserNumber() {
		List<String> lists = dao.selectMozzleIdByUserNumber();
		return dao.selectMozzleByUserNumber(lists);
	}

	@Override
	public List<MozzleDto> selectMyMozzle(String user_id) {;
		return dao.selectMyMozzle(user_id);
	}

	@Override
	public List<MozzleDto> selectMozzleBySearchBasedeOnImportance(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MozzleDto> selectMozzleBySearchFromTheLastest(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
}
