/*
*개발자: 배근후
*날짜: 2017.02.05
*프로그램명: NS Intranet ver1.0
*/
package bae.kh.calendar.dto;

public class CalendarDTO {

	private int calendar_no; // 일정 번호
	private String emp_id;
	private String title;// 타이틀
	private String start_day;
	private String end_day;
	private CalendarDayDTO start_date;
	private CalendarDayDTO end_date;
	private String color;

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getCalendar_no() {
		return calendar_no;
	}

	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getStart_day() {
		return start_day;
	}

	public void setStart_day(String start_day) {
		this.start_day = start_day;
		this.start_date = new CalendarDayDTO(start_day);
	}

	public String getEnd_day() {
		return end_day;
	}

	public void setEnd_day(String end_day) {
		this.end_day = end_day;
		if (end_day == null) {
			end_day = start_day;
		}
		this.end_date = new CalendarDayDTO(end_day);
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public CalendarDayDTO getStart_date() {
		return start_date;
	}

	public CalendarDayDTO getEnd_date() {
		return end_date;
	}

	@Override
	public String toString() {
		return "CalendarBean [calendar_no=" + calendar_no + ", emp_id=" + emp_id + ", title=" + title + ", start_day="
				+ start_day + ", end_day=" + end_day + ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}

}
