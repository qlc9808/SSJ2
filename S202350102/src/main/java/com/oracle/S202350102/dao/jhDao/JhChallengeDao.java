package com.oracle.S202350102.dao.jhDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;
import com.oracle.S202350102.dto.Challenge;
import com.oracle.S202350102.dto.Comm;

public interface JhChallengeDao {

	Challenge 			chgDetail(int chg_id);

	//아래 리스트 두개 합칠 수 없나?
	List<Board> 		chgReviewList(Board board);
	
	List<Board>			reviewReplyList(Board board);

	String 				userStatus(int userNum);

	Board 				reviewContent(int brd_num);

	int 				reviewTotal(int chg_id);

	int 				ingChgListTotal();

//	List<Challenge> 	ingChgRecentList(Challenge challenge);

//	List<Challenge> 	ingChgPickList(Challenge challenge);
 
	void 				replyInsert(Board board);

	int 				replyDelete(int brd_num);
		
	void 				viewCntUp(int brd_num);
 
	int 				replyUpdate(Board board);

	int 				reviewPost(Board board);

	int 				reviewUpdate(Board board);

	int 				reviewDelete(int brd_num);

	int 				boardImgDelete(int brd_num);

	List<Challenge> 	recomChgList(int chg_md);

	List<Comm> 			category(int categoryLd);

	int 				chgApplication(Challenge chg);

	List<Challenge> 	chgAdminList(Challenge challenge);

	List<Challenge>		chgAplList(Challenge challenge);

	int 				chgListTotal(int state_md);     
    
}       
   