/*
*개발자: 배근후
*날짜: 2017.02.05
*기술: 스캐너
*네이밍: 
*프로그램명: NS Intranet ver1.0
*/
package bae.kh.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import bae.kh.calendar.dto.CalendarDTO;
import bae.kh.calendar.service.CalendarService;

@Controller
//@SessionAttributes("login.emp_id")
@RequestMapping("/user/calendar/*")
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
	
	
	//#########################일정조회##############################
	//##############################################################
	@RequestMapping(value="/calendarList", method = RequestMethod.GET)
	public String getCalendarList(CalendarDTO calendarDTO, Model model, HttpSession session) throws Exception{
		
		
		calendarDTO.setEmp_id("abc");
		
		
		model.addAttribute("list", calendarService.listAll(calendarDTO.getEmp_id()));
		return "calendar";
	}
	
	//########################일정등록부##############################
	//##############################################################
	//개인일정등록
	@ResponseBody
	@RequestMapping(value="/calendarInsert", method = RequestMethod.POST)
	public int calendarRegist(CalendarDTO calendarDTO) throws Exception{
		calendarService.insertCalendar(calendarDTO);
		calendarService.getNo();//키 값 전달 key value toss
		
		return calendarService.getNo();
	}
	//부서일정등록
	/*@RequestMapping(value="/calendarDeptRegist", method = RequestMethod.POST)
	public String registdeptCalendar(CalendarDTO calendarDTO) throws Exception{
		
	    calendarService.calendarRegist(calendarDTO); //일정 등급 이상 부서 일정 등록 calendarDeptRegist
		//String emp_id=calendarDTO.getEmp_id();//dto에 저장된 세션으로 부터 받아온 아이디값
	    String emp_id = "abc";
		List<CalendarDTO>list = calendarService.calendarDeptSearch(emp_id);//아이디를 통해 같은 부서의 아이디 소팅
		for (CalendarDTO dto : list) {
		 calendarDTO.setEmp_id(dto.getEmp_id());
		 calendarService.calendarDeptRegist(calendarDTO);//받아온 아이디들에 일정 등록
		}
		return "redirect:/user/calendar/calendarList";
	}
	*/
	//#####################일정업데이트부분############################
	//##############################################################
	//일정 리사이징
	@RequestMapping(value="/calendarUpdate", method = RequestMethod.POST)
	public String updateCalendar(CalendarDTO calendarDTO) throws Exception{
		
		calendarService.calendarModify(calendarDTO);
		return "redirect:/user/calendar/calendarList";
	}
	//일정 드래그 업데이트
	@RequestMapping(value="/calendarUpdateMove", method = RequestMethod.POST)
	public String updateMoveCalendar(CalendarDTO calendarDTO) throws Exception{
		
		calendarService.calendarModifyMove(calendarDTO);
		return "redirect:/user/calendar/calendarList";
	}
	
	//일정 드롭시 업데이트
	@RequestMapping(value="/calendarDropUpdate", method = RequestMethod.POST)
	public String dropUpdate(CalendarDTO calendarDTO) throws Exception{
		
		calendarService.calendarDropModify(calendarDTO);
		return "redirect:/user/calendar";
	}
	
	//########################일정삭제부분############################
	//##############################################################
	@RequestMapping(value="/calendarDelete", method = RequestMethod.POST)
	public String deleteCalendar(CalendarDTO calendarDTO) throws Exception{
		calendarService.calendarRemove(calendarDTO);
		
		return "redirect:/user/calendar/calendarList";
	}
}
