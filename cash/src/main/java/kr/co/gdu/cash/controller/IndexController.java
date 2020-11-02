package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.IndexService;
import kr.co.gdu.cash.vo.Notice;
@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;
	
	@GetMapping(value={"/","/index"})
	public String index(Model model) {
		//1. 요청 분석
		Calendar c = Calendar.getInstance(); //오늘 날짜 구하기
		//알고리즘 테스트용
		//c.set(Calendar.MONTH, 11);
		
		int month = c.get(Calendar.MONTH) + 1; // 월
		int lastDay = c.getActualMaximum(Calendar.DATE);
		//1일로 만드는 코드
		Calendar firstDay = Calendar.getInstance();
		//알고리즘 테스트용
		//firstDay.set(Calendar.MONTH, 11);
		
		firstDay.set(Calendar.DATE, 1);
		int firstDayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK);
		//디버깅
		System.out.println(month+"<-month");
		System.out.println(lastDay+"<-lastDay");
		System.out.println(firstDayOfWeek+"<-firstDayOfWeek");
		//2. 서비스 호출
		List<Notice> list = indexService.getLatestNoticeList();
		//디버깅
		System.out.println("list.size(5) : " + (list.size() == 5));	// true
		
		//3.뷰 모델 추가
		model.addAttribute("month",month); //월
		model.addAttribute("lastDay",lastDay); // 마지막 일
		model.addAttribute("firstDayOfWeek",firstDayOfWeek); // 이번달 1일
		model.addAttribute("list", list);
		// 실제로 포워딩 되는 것은 prefix에서 지정한 /WEB-INF/view/index.jsp으로 반환됨
		return "index";	
	}
}
