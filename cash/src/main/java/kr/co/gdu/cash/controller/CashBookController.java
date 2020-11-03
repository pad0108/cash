package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.IndexService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class CashBookController {
	@Autowired
	private CashbookService cashbookService;

	@GetMapping(value = { "/cashbookByMonth" })
	// requestparam으로 paramMonth가 null이면 0으로 바꿔라(int로 형변환을 해야하기 떄문에) =
	// ("request.getParamater("paramMonth");)
	public String cashbookByMonth(Model model, @RequestParam(name = "currentYear", defaultValue = "-1") int currentYear,
			@RequestParam(name = "currentMonth", defaultValue = "-1") int currentMonth) {

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
		return "cashbookByMonth";
	}
}