/*
*개발자: 배근후
*날짜: 2017.02.05
*프로그램명: NS Intranet ver1.0
*/
package bae.kh.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bae.kh.calendar.dto.CalendarDTO;

@Repository
public class CalendarDAOImpl implements CalendarDAO {

	@Autowired
	SqlSessionTemplate template;
	static String namespace = "bae.kh.calendar.calendarMapper.";

	public SqlSessionTemplate getTemplate() {
		return template;
	}

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}

	@Override
	public List<CalendarDTO> list(String emp_id) throws Exception {

		return template.selectList(namespace+"calendarList", emp_id);
	}

	@Override
	public List<CalendarDTO> searchDept(String emp_id) throws Exception {

		return template.selectList(namespace+"searchDept", emp_id);
	}

	// 개인일정등록
	@Override
	public int calendarInsert(CalendarDTO calendarDTO) throws Exception {

		return template.insert(namespace + "insertCalendar", calendarDTO);

	}

	// 부서원들에게 등록 + 부서일정 등록
	@Override
	public void insert(CalendarDTO calendarDTO) throws Exception {

		template.insert(namespace + "calendarDeptInsert", calendarDTO);// 부서일정등록
	}

	@Override
	public int maxNo() throws Exception {

		return template.selectOne(namespace + "maxNo");
	}

	@Override
	public void updateResize(CalendarDTO calendarDTO) throws Exception {

		template.update(namespace + "calendarUpdate", calendarDTO);
	}

	@Override
	public void updateMove(CalendarDTO calendarDTO) throws Exception {
		template.update(namespace + "calendarUpdateMove", calendarDTO);
	}

	@Override
	public void updateDrop(CalendarDTO calendarDTO) throws Exception {
		template.update(namespace + "calendarDropUpdate", calendarDTO);

	}

	@Override
	public void delete(CalendarDTO calendarDTO) throws Exception {

		template.delete("calendarDelete", calendarDTO);
	}
}
