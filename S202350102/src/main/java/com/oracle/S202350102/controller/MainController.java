package com.oracle.S202350102.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.service.hbService.Paging;
import com.oracle.S202350102.service.thService.ThChgService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
	private final ThChgService tcs;
	
	
	
	@RequestMapping(value ="/")
	public String index() {
		System.out.println("MainController index Start...");
		
		return "home2";
	}
	@RequestMapping(value ="listChallenge")
	public String listChallenge() {
		System.out.println("MainController listChallenge Start...");
		
		return "listChallenge";
	}
	@RequestMapping(value ="nearbySharing")
	public String nearbySharing() {
		System.out.println("MainController nearbySharing Start...");
		
		return "nearbySharing";
	}
	/*
	 * @RequestMapping(value ="Sharing") public String Sharing() {
	 * System.out.println("MainController Sharing Start...");
	 * 
	 * return "Sharing"; }
	 */
	
	@RequestMapping(value ="Community")
	public String listCommunity() {
		System.out.println("MainController community Start...");

		
		return "community";
	}
	
	@RequestMapping(value ="introduce")
	public String introduce() {
		System.out.println("MainController introduce Start...");
		
		return "introduce";
	}

	
	/*
	 * @RequestMapping(value ="mypage") public String mypage() {
	 * System.out.println("MainController mypage Start...");
	 * 
	 * return "mypage"; }
	 */
	 
	@RequestMapping(value ="master")
	public String master() {
		System.out.println("MainController master Start...");
		
		return "master";
	}
	@RequestMapping(value ="search")
	public String search() {
		System.out.println("MainController search Start...");
		
		return "search";
	}
	@RequestMapping(value ="challengeDetail")
	public String challengeDetail() {
		System.out.println("MainController challengeDetail Start...");
		
		return "challengeDetail";
	}
	@RequestMapping(value ="signUp")
	public String signUp() {
		System.out.println("MainController signUp Start...");
		
		return "signUp";
	}
	@RequestMapping(value ="chatBot")
	public String chatBot() {
		System.out.println("MainController chatBot Start...");
		
		return "chatBot";
	}
	@RequestMapping(value ="questionBoard")
	public String questionBoard() {
		System.out.println("MainController questionBoard Start...");
		
		return "questionBoard";
	}
	@RequestMapping(value ="personalQuestion")
	public String personalQuestion() {
		System.out.println("MainController personalQuestion Start...");
		
		return "personalQuestion";
	}

	@RequestMapping(value ="logIn")
	public String logIn() {
		System.out.println("MainController logIn Start...");
		
		return "logIn";
	}
	
	@RequestMapping(value ="loginForm")
	public String logInForm() {
		System.out.println("MainController logIn Start...");
		
		return "loginForm";
	}
	
	@RequestMapping(value ="jhChgList")
	public String jhChgList(Challenge chg, String currentPage, Model model) {
		//지혜가 뷰랑 연결까지 만들어 놓은거 가져옴
		System.out.println("Main Controller jhChgList Start...");
		// Challenge 게시판 전체 Count
		int totalChg =  tcs.totalChg();
		
		// Paging 작업			  	11			0
		Paging page = new Paging(totalChg, currentPage);
		
		chg.setStart(page.getStart());
		chg.setEnd(page.getEnd());
		System.out.println("Main Controller chg.getStart() --> " + chg.getStart() );
		System.out.println("Main Controller chg.getEnd() --> " + chg.getEnd() );
		
		List<Challenge> listChg = tcs.listChg(chg);
		System.out.println("MainController list listChg.size() --> " + listChg.size());
		
		// Model에 메소드 수행한 결과(전체게시글수, 게시글리스트, 페이지) 넣음
		model.addAttribute("totalChg", totalChg);
		model.addAttribute("listChg", listChg);
		model.addAttribute("page", page);

		return "jh/jhChgList";
	}
}