package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.YearIncome;

@Mapper
public interface ChartMapper {
	//연도에 따른 월별 지출 합
	public Map<String, Object> selectTotalOutByYear(int year);
	//연도에 따른 월별 수입 합
	public Map<String, Object> selectTotalComeByYear(int year);
	//연도에 따른 월별 지출 평균
	public Map<String, Object> selectAvgOutByYear(int year);
	//연도에 따른 월별 수입 평균
	public Map<String, Object> selectAvgComeByYear(int year);
	
	public List<YearIncome> selectTotalCompare();
	
	
}
