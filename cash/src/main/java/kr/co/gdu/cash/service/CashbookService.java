package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashbookMapper;
	
	public int addCashbook(Cashbook cashbook) {
		return cashbookMapper.insertCashbook(cashbook);
	}
	
	public int getsumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cashbookKind",cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		Integer sum = cashbookMapper.selectsumCashbookPriceByInOut(map);
		return sum;
	}
	
	public List<Map<String, Object>> getCashListByMonth(int currentYear, int currentMonth){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		
		return cashbookMapper.selectCashListByMonth(map);
	}
	
	public List<Cashbook> getCashbookListByDay(int currentYear, int currentMonth, int currentDay){
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay",currentDay);
		return cashbookMapper.selectCashBookListByDay(map);
	}
	//삭제
	public void removeCashbook(int cashbookId) {
		cashbookMapper.deleteCashbook(cashbookId);
	}
	//수정
	public void modifyCashbook(Cashbook cashbook) {
		cashbookMapper.updateCashbook(cashbook);
	}
	//수정페이지
	public Cashbook getCashbookByDay(int cashbookId) {
		Cashbook cashbook = cashbookMapper.selectCashbookByDay(cashbookId);
		
		return cashbook;
	}
}
