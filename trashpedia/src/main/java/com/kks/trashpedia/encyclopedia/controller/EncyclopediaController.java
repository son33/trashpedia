package com.kks.trashpedia.encyclopedia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.Image;
import com.kks.trashpedia.encyclopedia.model.service.EncyclopediaService;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashPost;

@Controller
@RequestMapping("")
public class EncyclopediaController {

	@Autowired
	private EncyclopediaService encyclopediaService;

	// 쓰레기사전 페이지 이동
//	@GetMapping("/trashlist")
//	public ModelAndView showEncyclopediaPage() {
//		ModelAndView modelAndView = new ModelAndView();
//		List<Trash> popularTrashList = encyclopediaService.getPopularTrashList(); // 이 메서드는 인기 쓰레기 정보를 가져오는 메서드
//
//		// popularTrashList의 각 항목에 대해 이미지 URL과 제목을 가져와서 설정
//		// 이미지 주소와 쓰레기 이름 가져오기
//		for (Trash trash : popularTrashList) {
//			String imageUrl = encyclopediaService.getImageUrlByTrashNo(trash.getTrashNo());
//			Image image = new Image();
//			image.setOriginName(imageUrl);
//
//			String trashTitle = encyclopediaService.getTrashTitleByTrashNo(trash.getTrashNo());
//			TrashPost trashPost = new TrashPost();
//			trashPost.setTrashTitle(trashTitle);
//
//		}
//
//		modelAndView.addObject("popularTrashList", popularTrashList);
//		modelAndView.setViewName("encyclopedia/trashEncyclopedia");
//		return modelAndView;
//	}

	// 쓰레기사전 세부 페이지 이동
//	@GetMapping("/trashDetail")
//	public ModelAndView showTrashDetail(@RequestParam(value = "trashNo") int trashNo) {
//		ModelAndView modelAndView = new ModelAndView();
//		// trashNo를 기반으로 해당 쓰레기 정보를 가져옴
//		Trash trash = encyclopediaService.getTrashByNo(trashNo);
//		String imageUrl = encyclopediaService.getImageUrlByTrashNo(trashNo);
//		String trashTitle = encyclopediaService.getTrashTitleByTrashNo(trashNo);
//		String trashContent = encyclopediaService.getTrashContentByTrashNo(trashNo);
//
//		modelAndView.addObject("trash", trash);
//		modelAndView.addObject("imageUrl", imageUrl);
//		modelAndView.addObject("trashTitle", trashTitle);
//		modelAndView.addObject("trashContent", trashContent);
//		modelAndView.setViewName("encyclopedia/trashEncyclopediaDetail");
//		return modelAndView;
//	}

	// 검색 기능
//	@PostMapping("/search")
//	public ModelAndView search(String searchText) {
//		// searchText를 이용하여 검색 로직을 수행하고 검색 결과를 가져옵니다.
//		int trashNo = encyclopediaService.searchTrash(searchText);
//
//		
//	    // 검색 결과가 없을 경우
//	    if (trashNo == -1) {
//	        // 뷰에 전달할 알림 메시지 설정
//	        String alertMessage = "검색하신 정보가 없습니다.";
//	        // 알림 메시지를 포함한 뷰 객체 생성
//	        ModelAndView modelAndView = new ModelAndView();
//	        modelAndView.addObject("alertMessage", alertMessage);
//	        modelAndView.setViewName("encyclopedia/trashEncyclopedia"); // 이전 페이지로 돌아감
//	        return modelAndView;
//	    }else {
//	    	// 검색 결과를 뷰에 전달하고 해당 뷰를 반환합니다.
//	    	ModelAndView modelAndView = new ModelAndView();
//	    	// trashNo를 기반으로 해당 쓰레기 정보를 가져옴
//	    	Trash trash = encyclopediaService.getTrashByNo(trashNo);
//	    	String imageUrl = encyclopediaService.getImageUrlByTrashNo(trashNo);
//	    	String trashTitle = encyclopediaService.getTrashTitleByTrashNo(trashNo);
//	    	String trashContent = encyclopediaService.getTrashContentByTrashNo(trashNo);
//	    	
//	    	modelAndView.addObject("trash", trash);
//	    	modelAndView.addObject("imageUrl", imageUrl);
//	    	modelAndView.addObject("trashTitle", trashTitle);
//	    	modelAndView.addObject("trashContent", trashContent);
//	    	modelAndView.setViewName("encyclopedia/trashEncyclopediaDetail");
//	    	return modelAndView;
//	    	
//	    }
//	    
//	}

	// 메인 카테고리
//	@PostMapping("/mainCategory")
//	public ModelAndView receiveMainCategory(@RequestParam(value = "mainCategory") String mainCategory) {
//		ModelAndView modelAndView = new ModelAndView();
//		List<Trash> trashList;
//		if (mainCategory != null) {
//			// 카테고리 선택시
//			trashList = encyclopediaService.getTrashListByCategory(mainCategory);
//		} else {
//			// Default 5장
//			trashList = encyclopediaService.getAllTrashList();
//		}
//
//		// 이미지 주소와 쓰레기 내용 가져오기
//		for (Trash trash : trashList) {
//			String imageUrl = encyclopediaService.getImageUrlByTrashNo(trash.getTrashNo());
//			Image image = new Image();
//			image.setOriginName(imageUrl);
//
//			String trashContent = encyclopediaService.getTrashContentByTrashNo(trash.getTrashNo());
//			TrashPost trashPost = new TrashPost();
//			trashPost.setTrashContent(trashContent);
//
//			// 이후에 Image나 TrashPost 객체를 어떻게 사용할지에 대한 코드를 작성합니다.
//			// 예를 들어, 어떤 자료구조에 담거나, 다른 처리를 하거나, 화면에 표시하는 등의 작업을 수행할 수 있습니다.
//		}
//
//		modelAndView.addObject("trashList", trashList);
//		modelAndView.setViewName("encyclopedia/trashEncyclopedia");
//		return modelAndView;
//	}

	// 서브 카테고리
//	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}