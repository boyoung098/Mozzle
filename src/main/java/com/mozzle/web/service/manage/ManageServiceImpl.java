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
}
