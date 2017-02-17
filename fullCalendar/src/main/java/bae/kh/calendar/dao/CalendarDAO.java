/*
*개발자: 배근후
*날짜: 2017.02.05
*프로그램명: NS Intranet ver1.0
*/
package bae.kh.calendar.dao;

import java.util.List;

import bae.kh.calendar.dto.CalendarDTO;

public interface CalendarDAO {
	
	public List<CalendarDTO> list(String emp_id) throws Exception;

	public List<CalendarDTO> searchDept(String emp_id) throws Exception;

	public int calendarInsert(CalendarDTO calendarDTO) throws Exception;

	public void insert(CalendarDTO calendarDTO) throws Exception;

	public int maxNo() throws Exception;

	public void updateResize(CalendarDTO calendarDTO) throws Exception;

	public void updateDrop(CalendarDTO calendarDTO) throws Exception;

	public void updateMove(CalendarDTO calendarDTO) throws Exception;

	public void delete(CalendarDTO calendarDTO) throws Exception;

}
