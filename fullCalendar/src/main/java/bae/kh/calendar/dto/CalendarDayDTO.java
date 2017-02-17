/*
*개발자: 배근후
*날짜: 2017.02.05
*프로그램명: NS Intranet ver1.0
*/
package bae.kh.calendar.dto;

public class CalendarDayDTO {
	private String day;// 시작일
	private String year;
	private String month;
	private String hour;
	private String min;

	public CalendarDayDTO(String date) {
		this.year = date.substring(0, 4);
		this.month = date.substring(5, 7);
		int tmp = Integer.parseInt(month);
		tmp = tmp - 1;
		this.month = String.valueOf(tmp);
		this.day = date.substring(8, 10);
		if (date.length() > 13) {
			this.hour = date.substring(11, 13);
			this.min = date.substring(14, 16);
		}else{
			this.hour=null;
			this.min=null;
		}
	}

	public String getDay() {
		return day;
	}

	public String getYear() {
		return year;
	}

	public String getMonth() {
		return month;
	}

	public String getHour() {
		return hour;
	}

	public String getMin() {
		return min;
	}

	@Override
	public String toString() {
		return "CalendarDayBean [day=" + day + ", year=" + year + ", month=" + month + ", hour=" + hour + ", min=" + min
				+ "]";
	}

}
