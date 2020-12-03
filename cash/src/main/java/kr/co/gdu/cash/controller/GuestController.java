package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.GuestService;
import kr.co.gdu.cash.vo.Guest;

@Controller
public class GuestController {
	@Autowired
	private GuestService guestService; 
	//리스트
	@GetMapping("/admin/guestList/{currentPage}")
	public String guestList(Model model, @PathVariable(value="") int currentPage) {
		int rowPerPage = 10;
		
		List<Guest> guestList = guestService.getGuestListByPage(currentPage, rowPerPage);
		System.out.println("Debug: " + guestList);
		int totalCount = guestService.getCountGuest(); // 전체 페이지
		int lastPage = totalCount / rowPerPage; //마지막 페이지
		
		if(totalCount % rowPerPage != 0) { // 10개 미만의 개수의 데이터가 있는 페이지를 표시
			lastPage += 1;
		}
		if(lastPage == 0) { //전체 페이지가 0개이면 현재 페이지를 0으로 표시
			currentPage = 0;
		}
		model.addAttribute("guestList", guestList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "guestList";
	}
	
	//입력
	@PostMapping("addGuestbook")
	public String addGuestbook(Guest guest) {
		guestService.addGuestbook(guest);
		return "redirect:/admin/guestList/1";
	}
	//수정 폼
	@GetMapping("/admin/modifyGuest/{guestId}")
	public String modifyGuest(Model model, @PathVariable(value="guestId")int guestId) {
		return "modifyGuest";
	}
	//수정 액션
	@PostMapping("/admin/modifyGuest")
	public String modifyGuest(Guest guest) {
		guestService.modifyGuestBook(guest);
		
		return "redirect:/admin/guestList/1";
	}
	//삭제
	@GetMapping("/removeGuest/{guestId}")
	public String removeGuest(@PathVariable(value="guestId") int guestId) {
		guestService.removeGuestbook(guestId);
		
		return "redirect:/admin/guestList/1";
	}
	
}
