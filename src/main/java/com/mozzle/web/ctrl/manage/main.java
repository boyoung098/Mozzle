package com.mozzle.web.ctrl.manage;

import com.mozzle.web.dao.manage.IManageDao;
import com.mozzle.web.dao.manage.ManageDaoImpl;

public class main {

	public static void main(String[] args) {
		
		IManageDao dao = new ManageDaoImpl();
		System.out.println(dao.selectMozzleBySearchFromTheLastest("커피"));
		
		System.out.println();
	}
}
