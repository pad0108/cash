package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class CashBookController {
	@Autowired
	private CashbookService cashbookService;
	@Autowired 
	private CategoryService categoryService;
	@PostMapping("/admin/addCashbook/now/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Cashbook cashbook){ //커맨드 객체
		//디버깅
		//System.out.println(cashbook);
		cashbookService.addCashbook(cashbook);
		return "redirect:/admin/cashbookByMonth"; //response.sendRedirect() 와 동일
	}
	@GetMapping("/admin/addCashbook/now/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Model model,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay){
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("currentDay", currentDay);
		
		return "addCashbook"; //forward 와 동일
	}
	
	@GetMapping("/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}") //@GetMapping("/admin/cashbookByDay")
	public String cashbookByDay(Model model,
											@PathVariable(name = "target") String target,
											@PathVariable(name = "currentYear", required = true) int currentYear,
											@PathVariable(name = "currentMonth", required = true) int currentMonth,
											@PathVariable(name = "currentDay", required = true) int currentDay) {
		
		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth-1);
		targetDay.set(Calendar.DATE, currentDay);
		if(target.equals("pre")) {
			targetDay.add(Calendar.DATE, -1);
		} else if(target.equals("next")) {
			targetDay.add(Calendar.DATE, +1);
		}
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(
											targetDay.get(Calendar.YEAR),targetDay.get(Calendar.MONTH)+1,targetDay.get(Calendar.DATE));
		model.addAttribute("cashbookList",cashbookList);
		model.addAttribute("currentYear",targetDay.get(Calendar.YEAR));
		model.addAttribute("currentMonth",targetDay.get(Calendar.MONTH)+1);
		model.addAttribute("currentDay",targetDay.get(Calendar.DATE));
		return "cashbookByDay";
	}
	
	
	
	@GetMapping("/admin/cashbookByMonth/{currentYear}/{currentMonth}")
	// requestparam으로 paramMonth가 null이면 0으로 바꿔라(int로 형변환을 해야하기 떄문에) =
	// ("request.getParamater("paramMonth");)
	public String cashbookByMonth(Model model, @PathVariable(name = "currentYear") int currentYear,
			@PathVariable(name = "currentMonth") int currentMonth) {

		// 1. 요청분석
		/*
		 *
		 */
		Calendar currentDay = Calendar.getInstance();// 2020년 11월 2일.
		// currentYear 넘어오고, currentMonth도 넘어오면
		if (currentYear != -1 && currentMonth != -1) {
			if (currentMonth == 0) {
				currentMonth = 12; // currentMonth가 0이면 12월로 바뀌고
				currentYear -= 1; // 년도가 1년 빠짐.
			}
			if (currentMonth == 13) {// month가 13월 되면
				currentMonth = 1; // 1월로 바뀌고
				currentYear += 1; // 년도는 1년 올라간다.
			}
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth - 1);
		}
		currentDay.set(Calendar.DATE, 1); // 2020년 11월1일
		currentYear = currentDay.get(Calendar.YEAR);
		currentMonth = currentDay.get(Calendar.MONTH) + 1; // 월
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);
		// ------------------------------------------다이어리
		int sumIn = cashbookService.getsumCashbookPriceByInOut("수입", currentYear, currentMonth);
		int sumOut = cashbookService.getsumCashbookPriceByInOut("지출", currentYear, currentMonth);
		// ------------------------------------------DB
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		// 디버깅
		System.out.println(currentMonth + "<--month");
		System.out.println(lastDay + "<--lastDay");

		// 3. 뷰 연결(모델 추가)
		/*
		 * 1) 월, 마지막 일(30 or 31 , 윤달이 껴서 ..29일인지...), 1일 요일 공지사항 목록
		 */
		model.addAttribute("currentYear", currentYear); // 년
		model.addAttribute("currentMonth", currentMonth);// 월
		model.addAttribute("lastDay", lastDay);// 마지막 일
		model.addAttribute("firstDayOfWeek", firstDayOfWeek); // 1일의 요일
		
		model.addAttribute("sumIn",sumIn);
		model.addAttribute("sumOut",sumOut);
		
		model.addAttribute("cashList",cashList);
		return "cashbookByMonth";
	}
	// 수입/지출 삭제
	@GetMapping("/admin/removeCashbook/{cashbookId}")
	public String removeCashbook(@PathVariable(value = "cashbookId") int cashbookId) {
		cashbookService.removeCashbook(cashbookId);
		return "redirect:/admin/cashbookByMonth/-1/-1";
	}
	// 수입/지출 폼
	@GetMapping("/admin/modifyCashbook/{cashbookId}")
	public String modifyCashbook(Model model,
									@PathVariable(value = "cashbookId")int cashbookId) {
		Cashbook cashbook = cashbookService.getCashbookByDay(cashbookId);
		
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cashbook", cashbook);
		
		
		return "modifyCashbook";
	}
	// 수입/지출 액션
	@PostMapping("admin/modifyCashbook")
	public String modifyCashbook(Cashbook cashbook) {
		cashbookService.modifyCashbook(cashbook);
		
		return"redirect:/admin/cashbookByMonth/-1/-1";
	}
	// 수입/지출 표
	@GetMapping("/admin/cashbookList/{currentPage}")
	public String cashbookList(Model model, 
							@PathVariable(name = "currentPage", required = true) int currentPage) {
		int rowPerPage = 20;
		List<Cashbook> cashbookList = cashbookService.getCashbookListByPage(currentPage, rowPerPage);
		int totalCount = cashbookService.getCountCashbook();	// 전체 데이커
		int lastPage = totalCount / rowPerPage;	// 마지막 페이지
		
		if (totalCount % rowPerPage != 0) {	// 10 미만의 개수의 데이터가 있는 페이지를 표시
			lastPage += 1;
		}
		
		if (lastPage == 0) { // 전체 페이지가 0개이면 현재 페이지도 0으로 표시
			currentPage = 0;
		}
		model.addAttribute("cashbookList", cashbookList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);	
		return "cashbookList";
	}
}