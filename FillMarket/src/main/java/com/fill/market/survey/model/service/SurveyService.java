package com.fill.market.survey.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fill.market.survey.model.dao.SurveyDAO;
import com.fill.market.survey.model.vo.Survey;
@Service
public class SurveyService {

	@Autowired
	SurveyDAO surveyDAO;
	
	
	public int insertSurvey(Survey survey) {
		int result = surveyDAO.insertSurvey(survey);
		return result;
	}


	public Survey surveyResult(int no) {
		// TODO Auto-generated method stub
		return null;
	}

}
