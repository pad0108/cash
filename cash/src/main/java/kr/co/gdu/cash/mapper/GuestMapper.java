package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Guest;

@Mapper
public interface GuestMapper {
	//방명록 리스트
	List<Guest> selectGuestListByPage(Map<String, Integer> map);
	//방명록 추가
	int insertGuest(Guest guest);
	//방명록 삭제
	int deleteGuest(int guestId);
	//방명록 수정
	int updateGuest(Guest guest);
	//전체 페이지
	int selectGuestCount();
}
