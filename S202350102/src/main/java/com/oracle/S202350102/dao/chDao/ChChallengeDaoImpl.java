package com.oracle.S202350102.dao.chDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.Comm;

import lombok.Data;

@Repository
@Data
public class ChChallengeDaoImpl implements ChChallengeDao {
	
	private final SqlSession session;
	
	@Override
	public List<Challenge> popChgList() {
		System.out.println("ChChallengeDaoImpl popChgList Start...");
		List<Challenge> popChgList = null;
		
		try {
			popChgList = session.selectList("popchgList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChChallengeDaoImpl popChgList e.getMessage()->" + e.getMessage());
		}
		return popChgList;
	}

	@Override
	public List<Comm> chgCommList() {
		System.out.println("ChChallengeDaoImpl chgCommList Start...");
		List<Comm> chgCommList = null;
		
		try {
			chgCommList = session.selectList("chgCommList");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChChallengeDaoImpl chgCommList e.getMessage()->" + e.getMessage());
		}
		
		return chgCommList;
	}

}
