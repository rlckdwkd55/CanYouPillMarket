package com.fill.market.survey.controller;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fill.market.survey.model.service.SurveyService;
import com.fill.market.survey.model.vo.Survey;

@Controller
public class SurveyController {
	@Autowired
	SurveyService surveyService;
	
	//설문조사 작성 폼
@RequestMapping("/survey/surveyList.do")
	public String surveyList() {
			System.out.println("진단 사이트 호출");
			return "survey/survey";
	}

	//설문조사 작성 내용 DB에 등록
@RequestMapping("/survey/surveyInsert.do")
public String insertSurvey(Survey survey) {

	System.out.println("결과추가 : " + survey);
	
	// DB에 등록
	int result = surveyService.insertSurvey(survey);

	return  "survey/surveyResult";
	
	}

	//설문조사 결과DB 내용 불러와서 결과화면 띄우기. - fk를 뭔가를 줘야...그러려면 로그인...
@RequestMapping("/survey/surveyResult.do")
public String surveyResult(@RequestParam int no, Model model) {
	
	Survey survey = surveyService.surveyResult(no);
	
	model.addAttribute("survey", survey);
	
	return "survey/surveyResult";
	}
}

