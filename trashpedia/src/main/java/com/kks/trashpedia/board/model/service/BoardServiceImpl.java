package com.kks.trashpedia.board.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.dao.BoardDao;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.trash.model.vo.Trash;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;

	@Override
	public Post boardDetail(int postNo) {
		return dao.boardDetail(postNo);
	}

	@Override
	public Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect,
			String searchValue) {
		return dao.boardList(subCategoryNo, pageable, page, filter, searchSelect, searchValue);
	}

	@Override
	public List<BigCategory> bigCategory() {
		return dao.bigCategory();
	}
	@Override
	public List<SubCategory> subCategory() {
		return dao.subCategory();
	}

	@Override
	public List<Post> categoryList() {
		return dao.categoryList();
	}
	
	
	
	// 무료 페이지
		@Override
		public List<Trash> getFreeTrashList() {
			return dao.getFreeTrashList();
		}

		@Override
		public String getImageUrlByTrashNo(int trashNo) {
			return dao.getImageUrlByTrashNo(trashNo);
		}

		@Override
		public String getTrashTitleByTrashNo(int trashNo) {
			return dao.getTrashTitleByTrashNo(trashNo);
		}

		@Override
		public String getTrashContentByTrashNo(int trashNo) {
			return dao.getTrashContentByTrashNo(trashNo);
		}
		// 무료 페이지

		// 무료 상세 페이지
		@Override
		public Trash getFreeTrashDetail(int trashNo) {
			return dao.getFreeTrashDetail(trashNo);
		}

		@Override
		public String getTrashWriterByTrashNo(int trashNo) {
			return dao.getTrashWriterByTrashNo(trashNo);
		}

		@Override
		public String getTrashCreateByTrashNo(int trashNo) {
			return dao.getTrashCreateByTrashNo(trashNo);
		}

		@Override
		public Date getTrashViewsByTrashNo(int trashNo) {
			return dao.getTrashViewsByTrashNo(trashNo);
		}
	
	
}
