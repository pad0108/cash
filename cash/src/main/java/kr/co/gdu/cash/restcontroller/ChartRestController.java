package kr.co.gdu.cash.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.service.ChartService;
import kr.co.gdu.cash.vo.YearIncome;

@RestController
public class ChartRestController {
	@Autowired ChartService chartService;
	
	//연도에 따른 월별 지출
	@GetMapping("admin/totalOutbyYear/{year}")
	public Map<String, Object> totalOutbyYear(@PathVariable(name = "year") int year){
		return chartService.getTotalOutByYear(year);
	}
	//연도에 따른 월별 수입
	@GetMapping("admin/totalComebyYear/{year}")
	public Map<String, Object> totalComebyYear(@PathVariable(name = "year") int year){
		return chartService.getTotalComeByYear(year);
	}
	//연도에 따른 월별 지출 평균
	@GetMapping("admin/avgOutbyYear/{year}")
	public Map<String, Object> avgOutbyYear(@PathVariable(name = "year") int year){
		return chartService.getAvgOutByYear(year);
	}
	//연도에 따른 월별 수입 평균
	@GetMapping("admin/avgComebyYear/{year}")
	public Map<String, Object >avgComebyYear(@PathVariable(name = "year") int year){
		return chartService.getAvgComeByYear(year);
	}
	//연도별 최대 최소 수입
	@GetMapping("admin/minMaxIncome/{year}")
	public Map<String, Object>minMaxIncome(@PathVariable(name = "year") int year){
		return chartService.getMinMaxIncome(year);
	}
	//연도별 최대 최소 지출
	@GetMapping("admin/minMaxOut/{year}")
	public Map<String, Object>minMaxOut(@PathVariable(name = "year") int year){
		return chartService.getMinMaxOut(year);
	}
	//3년간 수입 비교
	@GetMapping("admin/totalIncomeCompare")
	public Map<String, Object> totalIncomeCompare(){
		return chartService.getTotalCompare();
	}
	//3년간 지출 비교
	@GetMapping("admin/totalOutCompare")
	public Map<String, Object>totalOutCompare(){
		return chartService.getTotalOutCompare();
	}
}
