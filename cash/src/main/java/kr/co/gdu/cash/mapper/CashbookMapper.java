package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

@Mapper
public interface CashbookMapper {
	int insertCashbook(Cashbook cashbook);
	List<Map<String, Object>> selectCashInOutList();
	Integer selectsumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String, Object>> selectCashListByMonth(Map<String,Object>map);
	List<Cashbook> selectCashBookListByDay(Map<String, Object> map);
}
