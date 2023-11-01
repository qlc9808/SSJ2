package com.oracle.S202350102.controller;

import org.springframework.stereotype.Controller;

import com.oracle.S202350102.service.jhService.JhCallengeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class JhController {

	private final JhCallengeService jhCService;
	
}
