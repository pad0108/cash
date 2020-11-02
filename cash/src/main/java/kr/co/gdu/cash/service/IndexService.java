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
	@Autowired
	private NoticeMapper noticeMapper;
	public List<Notice> getLatestNoticeList() {
		// List<Notice> list = noticeMapper.selectLatestNoticeList();
		// return list;
		return noticeMapper.selectLatestNoticeList();
	}
}
