package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdu.cash.mapper.GuestMapper;
import kr.co.gdu.cash.vo.Guest;

@Service
public class GuestService {
	@Autowired GuestMapper guestMapper;
	//리스트
	public List<Guest> getGuestListByPage(int currentPage, int rowPerPage){
		int beginRow = (currentPage -1) * rowPerPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<Guest> guestList = guestMapper.selectGuestListByPage(map);
		
		return guestList;
	}
	//추가
	public int addGuestbook(Guest guest) {
		return guestMapper.insertGuest(guest);
	}
	//삭제
	public void removeGuestbook(int guestId) {
		guestMapper.deleteGuest(guestId);
	}
	//수정
	public void modifyGuestBook(Guest guest) {
		guestMapper.updateGuest(guest);
	}
	//전체 페이지
	public int getCountGuest() {
		return guestMapper.selectGuestCount();
	}
}
