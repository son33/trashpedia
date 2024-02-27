package com.kks.trashpedia.pledge.model.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;

@Repository
public class PledgeDaoImpl implements PledgeDao{
	
	@Autowired
	private SqlSessionTemplate session;

	//실천서약 게시글 조회
	@Override
	public List<Post> pledgeList(int subCategoryNo) {
		return session.selectList("pledgeMapper.pledgeList",subCategoryNo);
	}

	//게시글 상세 조회
	@Override
	public Post pledgeDetail(int postNo) {
		return session.selectOne("pledgeMapper.pledgeDetail", postNo);
	}
	
	//게시글 상세-이미지
	@Override
	public ImgAttachment pledgeDetailImg(int boardNo) {
		return session.selectOne("pledgeMapper.pledgeDetailImg", boardNo);
	}
	
	//게시글 상세-첨부파일
	@Override
	public Attachment pledgeDetailAttach(int boardNo) {
		return  session.selectOne("pledgeMapper.pledgeDetailAttach", boardNo);
	}
	
	//처음 조회일 조회
	@Override
	public Date pledgeHitDate(Board b) {
		return session.selectOne("pledgeMapper.pledgeHitDate", b);
	}
	
	//게시글 조회수 증가
	@Override
	public int increaseCount(Board b) {
		return session.update("pledgeMapper.increaseCount", b);
	}



	
}
