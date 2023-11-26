package com.oracle.S202350102.dao.jhDao;

import java.util.List;

import com.oracle.S202350102.dto.Board;

public interface JhBoardDao {
	//후기 내용
	Board 				reviewContent(int brd_num);
	
	//후기 총 개수
	int 				reviewTotal(int chg_id);
	
	//후기 리스트
	List<Board> 		chgReviewList(Board board);
	
	//조회수 업
	void 				viewCntUp(int brd_num);
	
	//댓글 리스트
	List<Board>			reviewReplyList(Board board);
	
	
}
