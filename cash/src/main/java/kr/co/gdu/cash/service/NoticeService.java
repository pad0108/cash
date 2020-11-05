package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.*;
import kr.co.gdu.cash.vo.*;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(map);
		
		return noticeList;
	}
	
	//noticeList 중복 코드 있음 수정 요망
	public Map<String, Object> getNoticeAndInOutList() { // 다수의 리스트가 들어가니 List 사용 X Map을 사용
		List<Notice> noticeList = noticeMapper.selectLatestNoticeList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		// return list;
		return map;
	}
	
	public List<Notice> getNoticeList(){
		return noticeMapper.selectLatestNoticeList();
	}
	public int addNotice(Notice notice) {
		return noticeMapper.insertNotice(notice);
	}
	public void removeNotice(int noticeId) {
		noticeMapper.deleteNotice(noticeId);
	}
	public void modifyNotice(Notice notice) {
		noticeMapper.modifyNotice(notice);
	}
	public Notice getNoticeOne(int noticeId) {
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
	}
	public int getCountNotice() {
		return noticeMapper.selectNoticeCount();
	}
}
