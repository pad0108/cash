package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;

@Mapper
public interface NoticefileMapper {
	//파일 추가
	int insertNoticefile(Noticefile noticefile);
	//파일 삭제
	int deleteNoticefile(int noticeId);
	//리스트
	List<String> selectNoticeFileNameList(int boardId);
	//상세보기 파일 삭제
	int deleteNoticefileOne(int noticefileId);
	
}
