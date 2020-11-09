package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	// 공지 목록
	@GetMapping("/admin/noticeList/{currentPage}")
	public String noticeList(Model model, @PathVariable(value = "") int currentPage){
		int rowPerPage = 10;
		
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		System.out.println("Debug: " + noticeList);
		
		int totalCount = noticeService.getCountNotice();	// 전체 데이커
		int lastPage = totalCount / rowPerPage;	// 마지막 페이지
		
		if (totalCount % rowPerPage != 0) {	// 10 미만의 개수의 데이터가 있는 페이지를 표시
			lastPage += 1;
		}
		
		if (lastPage == 0) { // 전체 페이지가 0개이면 현재 페이지도 0으로 표시
			currentPage = 0;
		}
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);	
			
		return "noticeList";
	}
	// 공지 입력 폼
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	// 공지 입력 액션
	@PostMapping("/admin/addNotice")
	public String addNotice(Notice notice) {
		noticeService.addNotice(notice);
		return "redirect:/admin/noticeList";
	}
	// 공지 상세 보기
	@GetMapping("/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model, @PathVariable(value = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "noticeOne";
	}
	// 공지 삭제
	@GetMapping("/admin/removeNotice/{noticeId}")
	public String removeNotice(@PathVariable(value = "noticeId") int noticeId) {
		noticeService.removeNotice(noticeId);
		return "redirect:/admin/noticeList";
	}
	// 공지 수정 폼
	@GetMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Model model, @PathVariable(value = "noticeId") int noticeId) {
		Notice notice =noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "modifyNotice";
	}
	
	// 공지 수정 액션
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(Notice notice) {
		noticeService.modifyNotice(notice);
		return "redirect:/admin/noticeOne/"+notice.getNoticeId();
	}
}
