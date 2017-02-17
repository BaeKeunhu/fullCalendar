/*
*개발자: 배근후
*날짜: 2017.02.05
*프로그램명: NS Intranet ver1.0
*/
package bae.kh.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bae.kh.calendar.dao.CalendarDAO;
import bae.kh.calendar.dto.CalendarDTO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDAO calendarDAO;

	@Override
	public List<CalendarDTO> listAll(String emp_id) throws Exception {
		return calendarDAO.list(emp_id);
	}
	//같은 부서원 소팅
	@Override
	public List<CalendarDTO> calendarDeptSearch(String emp_id) throws Exception {
		return calendarDAO.searchDept(emp_id);
		
	}

	@Override
	public CalendarDTO calendarRegist(CalendarDTO calendarDTO) throws Exception {
		
		calendarDAO.insert(calendarDTO);
		return calendarDTO;
	}

	@Override
	public int insertCalendar(CalendarDTO calendarDTO) throws Exception {
		
		return calendarDAO.calendarInsert(calendarDTO);
	}
	//각각 부서원들에게 등록
	@Override
	public void calendarDeptRegist(CalendarDTO calendarDTO) throws Exception {
		
		calendarDAO.insert(calendarDTO);
	}

	@Override
	public int getNo() throws Exception {
		
		return calendarDAO.maxNo();
	}

	@Override
	public void calendarModify(CalendarDTO calendarDTO) throws Exception {
		calendarDAO.updateResize(calendarDTO);
		
	}
	@Override
	public void calendarModifyMove(CalendarDTO calendarDTO) throws Exception {
		calendarDAO.updateMove(calendarDTO);
		
	}

	@Override
	public void calendarDropModify(CalendarDTO calendarDTO) throws Exception {
		calendarDAO.updateDrop(calendarDTO);
		
	}

	@Override
	public void calendarRemove(CalendarDTO calendarDTO) throws Exception {
		calendarDAO.delete(calendarDTO);
		
	}

}
