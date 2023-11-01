package com.oracle.S202350102.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.service.jhService.JhCallengeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class JhController {

	private final JhCallengeService jhCService;
	
	
	
	@RequestMapping(value = "/jhChgDetail")
	public String jhChgDetail(HttpSession session, Challenge chg_id, Model model ) {
		
		System.out.println("JhController jhChgDetail Start...");
		
		Challenge chg = jhCService.jhChgDetail(chg_id);
		
		System.out.println("JhController jhChgDetail chg -> " + chg);
		
		 
		model.addAttribute("chg", chg);
		
		
		return "jh/jhChgDetail";
	}
}
