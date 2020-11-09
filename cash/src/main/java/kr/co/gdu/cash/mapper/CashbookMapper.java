package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

@Mapper
public interface CashbookMapper {
	List<Map<String, Object>> selectCashInOutList();
	Integer selectsumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String, Object>> selectCashListByMonth(Map<String,Object>map);
	List<Cashbook> selectCashBookListByDay(Map<String, Object> map);
	//추가
	int insertCashbook(Cashbook cashbook);
	//삭제
	int deleteCashbook(int cashbookId);
	//수정
	int updateCashbook(Cashbook cashbook);
	//상세 보기
	Cashbook selectCashbookByDay(int cashbookId);
	
}
