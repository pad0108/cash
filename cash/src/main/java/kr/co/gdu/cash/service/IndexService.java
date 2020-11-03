package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.*;
import kr.co.gdu.cash.vo.*;

@Service
@Transactional
public class IndexService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	public Map<String, Object> getNoticeAndInOutList() { // 다수의 리스트가 들어가니 List 사용 X Map을 사용
		List<Notice> noticeList = noticeMapper.selectLatestNoticeList();
		
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		// return list;
		return map;
	}
}
