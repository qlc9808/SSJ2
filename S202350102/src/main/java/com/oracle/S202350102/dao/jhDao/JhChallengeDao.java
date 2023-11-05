package com.oracle.S202350102.dao.jhDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;

public interface JhChallengeDao {

	Challenge 		jhChgDetail(int chg_id);

	List<Board> 	jhReviewList(int chg_id);

}
