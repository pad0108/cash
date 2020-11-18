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
	//연도 별 최대, 최소 수입
	public Map<String, Object> selectMinMaxIncome(int year);
	//연도 별 최대, 최소 지출
	public Map<String, Object> selectMinMaxOut(int year);
	//3년 간 수입 비교
	public Map<String, Object> selectTotalCompare();
	//3년 간 지출 비교
	public Map<String, Object> selectOutCompare();
}
