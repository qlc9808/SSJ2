package com.oracle.S202350102.dao.jhDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.S202350102.dto.Challenge;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class JhChallengeDaoImpl implements JhChallengeDao {
	
	private final SqlSession session;

	@Override
	public Challenge jhChgDetail(int chg_id) {
		System.out.println("JhChallengeDaoImpl jhChgDetail Start...");
		System.out.println("JhChallengeDaoImpl jhChgDetail  chg_id -> "+ chg_id);

		Challenge chg = null;
		
		
		try {
			
			chg = session.selectOne("JhChgDetail", chg_id);
			
			System.out.println("JhChallengeDaoImpl jhChgDetail  chg -> "+ chg);
			
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl jhChgDetail e.getMessage() -> "+ e.getMessage());

		}
		
		return chg;
	}

	@Override
	public String jhChgCtn(Challenge chg) {
		
		System.out.println("JhChallengeDaoImpl jhChgCtn Start...");
		
		String ctn = null;
		
		try {
			
			ctn = session.selectOne("JhChgCtn", chg);
			
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl jhChgCtn e.getMessage() -> "+ e.getMessage());
		}

		return ctn;
	}

	@Override
	public String jhChgCreator(Challenge chg) {
		System.out.println("JhChallengeDaoImpl jhChgCreator Start...");
		
		String creator = null;
		
		try {
			creator = session.selectOne("jhChgCreator", chg);
		} catch (Exception e) {
			System.out.println("JhChallengeDaoImpl jhChgCreator e.getMessage() -> "+ e.getMessage());
		}
		
		return creator;
	}

}
