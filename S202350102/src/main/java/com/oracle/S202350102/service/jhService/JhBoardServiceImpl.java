package com.oracle.S202350102.service.jhService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.S202350102.dao.jhDao.JhBoardDao;
import com.oracle.S202350102.dao.jhDao.JhChallengeDao;
import com.oracle.S202350102.dto.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JhBoardServiceImpl implements JhBoardService {
	
	private final JhBoardDao jhBrdDao;
	
	//후기 내용
	@Override
	public Board reviewContent(int brd_num) {
		System.out.println("JhBoardServiceImpl reviewContent Start...");
		Board reviewContent = jhBrdDao.reviewContent(brd_num);
		
		return reviewContent;
	}
	
	//리뷰 총개수
	@Override
	public int reviewTotal(int chg_id) {
		System.out.println("JhBoardServiceImpl reviewTotal Start...");
		int reviewTotal = jhBrdDao.reviewTotal(chg_id);
		
		return reviewTotal;
	}
	
	//후기 리스트
	@Override
	public List<Board> chgReviewList(Board board) {
		System.out.println("JhBoardServiceImpl chgReviewList Start...");
		
		List<Board> chgReviewList = jhBrdDao.chgReviewList(board);
		
		return chgReviewList;
	}
	
	//조회수 업
	@Override
	public void viewCntUp(int brd_num) {
		System.out.println("JhBoardServiceImpl viewCntUp Start...");
		jhBrdDao.viewCntUp(brd_num);
	}


	//댓글 리스트
	@Override
	public List<Board> reviewReplyList(Board board) {
		System.out.println("JhBoardServiceImpl reviewReplyList Start...");
		
		List<Board> reviewReplyList = jhBrdDao.reviewReplyList(board);
		
		return reviewReplyList;
	}
}
