package com.kks.trashpedia.board.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Hits;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.NestedComment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;


public interface BoardService {
	/* 페이징 */
	Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect,
			String searchValue);

	/* 게시판 상세 */
	Post boardDetail(int postNo);

	/* 카테고리 */
	List<BigCategory> bigCategory();
	List<SubCategory> subCategory();
	List<Post> categoryList();
	
	// 무료 페이지
	List<Post> getFreeShareList(int subCategoryNo, Pageable pageable, int page);
	ImgAttachment getImageUrl(int boardNo, int imgType);
	String getTrashTitleByboardNo(int boardNo);
	String getTrashContentByboardNo(int boardNo);
	// 무료 페이지

	// 무료 상세 페이지
	Post getFreeTrashDetail(int boardNo);
	String getTrashWriterByboardNo(int boardNo);
	String getTrashCreateByboardNo(int boardNo);
	Date getTrashViewsByboardNo(int boardNo);

	Attachment getDetailAttach(int boardNo);

	void increaseCount(Hits hits);

	Post getPostByTitle(String title);

	Page<Post> loadListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue,
			int subCategoryNo);

	/*대댓글*/
	int insertNC(NestedComment nc); // 삽입
	List<NestedComment> viewNC(int commentNo); // 조회
	List<Comment> selectCommentList(Board b); //commentNo 가져오기
	int deleteNC(int nCommentNo); // 삭제

	List<Post> getFreeTrashTotalList(int subCategoryNo);

	int increaseUserPoint(int userNo, int amount, String pointContent);
}
