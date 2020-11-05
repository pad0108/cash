package kr.co.gdu.cash.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.*;

@Mapper // public class NoticeMapperIMpl implements NoticeMapper() 가 service에 Autowired로 객체 전송
public interface NoticeMapper {
	// index 화면의 최근 5개 공지사항을 보여주는 메소드
	List<Notice> selectLatestNoticeList();	
	// 페이징
	List<Notice> selectNoticeListByPage(Map<String, Integer> map);
	// 공지사항 추가
	int insertNotice(Notice notice);
	// 공지사항 삭제
	int deleteNotice(int noticeId);
	// 공지사항 수정
	int modifyNotice(Notice notice);
	// 공지사항 상세보기
	Notice selectNoticeOne(int noticeId);
	
	int selectNoticeCount();
}