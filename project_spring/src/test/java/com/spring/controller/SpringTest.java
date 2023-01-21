package com.spring.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.Criteria;
import com.spring.domain.ReviewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class SpringTest {

	@Inject
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(SpringTest.class);
	
	private static final String namespace = "com.spring.mapper.ReviewMapper";
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		cri.setPageStart(0);
		cri.setAmount(2);
		
		List<ReviewVO> list = session.selectList(namespace+".reviewPagingList", cri);
		
		logger.info(""+list);
	}
}
