package com.kks.trashpedia.board.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.trash.model.vo.Trash;

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
	List<Post> getFreeTrashList(int subCategoryNo);
	ImgAttachment getImageUrlByboardNo(int boardNo);
	String getTrashTitleByboardNo(int boardNo);
	String getTrashContentByboardNo(int boardNo);
	// 무료 페이지

	// 무료 상세 페이지
	Post getFreeTrashDetail(int boardNo);
	String getTrashWriterByboardNo(int boardNo);
	String getTrashCreateByboardNo(int boardNo);
	Date getTrashViewsByboardNo(int boardNo);

	Attachment getDetailAttach(int boardNo);

	Date pledgeHitDate(Board b);

	int increaseCount(Board b);

	Post getPostByTitle(String title);

}
