/*
*개발자: 배근후
*날짜: 2017.02.05
*프로그램명: NS Intranet ver1.0
*/
package bae.kh.calendar.service;

import java.util.List;

import bae.kh.calendar.dto.CalendarDTO;

public interface CalendarService {

	public List<CalendarDTO> listAll(String emp_id) throws Exception;

	public List<CalendarDTO> calendarDeptSearch(String emp_id) throws Exception;
	
	public CalendarDTO calendarRegist(CalendarDTO calendarDTO) throws Exception;

	public int insertCalendar(CalendarDTO calendarDTO) throws Exception;
	
	public void calendarDeptRegist(CalendarDTO calendarDTO) throws Exception;
	
	public int getNo() throws Exception;
	
	public void calendarModify(CalendarDTO calendarDTO) throws Exception;
	
	public void calendarDropModify(CalendarDTO calendarDTO) throws Exception;

	public void calendarModifyMove(CalendarDTO calendarDTO) throws Exception;
	
	public void calendarRemove(CalendarDTO calendarDTO) throws Exception;
	
}
