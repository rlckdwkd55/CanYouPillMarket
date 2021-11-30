package com.fill.market.survey.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fill.market.survey.model.vo.Survey;

@Repository
public class SurveyDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertSurvey(Survey survey) {
		return sqlSession.insert("surveySQL.insertSurvey", survey) ;
	}
	

}
