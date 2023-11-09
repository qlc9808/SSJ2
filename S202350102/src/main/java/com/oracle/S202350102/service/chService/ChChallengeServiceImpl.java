package com.oracle.S202350102.service.chService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.chDao.ChChallengeDao;
import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.Comm;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class ChChallengeServiceImpl implements ChChallengeService {
	
	private final ChChallengeDao chChallengeService;
	
	
	
	@Override
	public List<Challenge> popchgList() {
		System.out.println("ChChallengeServiceImpl popChgList Start...");
		
		List<Challenge> popchgList = chChallengeService.popChgList();
		return popchgList;
	}



	@Override
	public List<Comm> chgCommList() {
		System.out.println("ChChallengeServiceImpl chgCommList Start...");
		List<Comm> chgCommList = null;
		
		chgCommList = chChallengeService.chgCommList();
		System.out.println("ChChallengeServiceImpl chgCommList size->" + chgCommList.size());
		return chgCommList;
	}

}
