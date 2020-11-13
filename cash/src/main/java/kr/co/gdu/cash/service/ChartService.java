package kr.co.gdu.cash.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.ChartMapper;
import kr.co.gdu.cash.vo.YearIncome;

@Service
@Transactional
public class ChartService {
	@Autowired ChartMapper chartMapper;
	
	public Map<String, Object> getTotalOutByYear(int year){
		return chartMapper.selectTotalOutByYear(year);
	}
	public Map<String, Object> getTotalComeByYear(int year){
		return chartMapper.selectTotalComeByYear(year);
	}
	public Map<String, Object> getAvgOutByYear(int year){
		return chartMapper.selectAvgOutByYear(year);
	}
	public Map<String, Object> getAvgComeByYear(int year){
		return chartMapper.selectAvgOutByYear(year);
	}
	public List<YearIncome> getTotalCompare(){
		return chartMapper.selectTotalCompare();
	}
}
