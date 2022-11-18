package com.silvertier.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.silvertier.dto.EventDTO;

public class EventDAO {
//	싱글톤 디자인 패턴
	private static EventDAO instance = new EventDAO();
	private EventDAO() {	}
	public static EventDAO getInstance() {
		return instance;
	}
	
	public void eventInsert(SqlSession mapper, EventDTO eDTO) {
		System.out.println("insert() Method of EventDAO Class");
		mapper.insert("eventInsert", eDTO);
	}
	
	public int eventSelectCount(SqlSession mapper) {
		System.out.println("eventSelectCount() Method of EventDAO Class");
		return (int) mapper.selectOne("eventSelectCount");
	}
	public ArrayList<EventDTO> eventSelectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("EventSelectList() Method of EventDAO Class");
		return (ArrayList<EventDTO>) mapper.selectList("eventSelectList", hmap);
	}
	public ArrayList<EventDTO> eventSelectArrayList(SqlSession mapper) {
		System.out.println("eventSelectArrayList() Method of EventDAO Class");
		return (ArrayList<EventDTO>) mapper.selectList("eventSelectArrayList");
	}
	public ArrayList<EventDTO> workSelectArrayList(SqlSession mapper) {
		System.out.println("workSelectArrayList() Method of EventDAO Class");
		return (ArrayList<EventDTO>) mapper.selectList("workSelectArrayList");
	}

}
