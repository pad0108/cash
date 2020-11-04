package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashbookMapper;
	
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
}
