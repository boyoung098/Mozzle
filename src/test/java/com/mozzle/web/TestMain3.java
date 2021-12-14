package com.mozzle.web;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mozzle.web.dao.board.IBoardDao;
import com.mozzle.web.dto.board.Board;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class TestMain3 {

	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private IBoardDao dao;
	
	@Test
	public void test() {
		List<Board> boardlist = dao.selectAllBoard();
		assertNotNull(boardlist);

	}

}
