package com.now.vo;

public class ScheduleVO {
	
	private String sc_emp_no = "";          /* 사원번호 */
	private String sc_date = "";            /* 날짜 */
	private String sc_attendance = "";      /* 출근시간 */
	private String sc_leave = "";           /* 퇴근시간 */
	private int sc_date_leng;               /* 휴가일(수) */
	private String sc_division = "";        /* 휴가구분 */
	private String sc_status = "";          /* 상태 */
	
	public String getSc_emp_no() {
		return sc_emp_no;
	}
	public void setSc_emp_no(String sc_emp_no) {
		this.sc_emp_no = sc_emp_no;
	}
	public String getSc_date() {
		return sc_date;
	}
	public void setSc_date(String sc_date) {
		this.sc_date = sc_date;
	}
	public String getSc_attendance() {
		return sc_attendance;
	}
	public void setSc_attendance(String sc_attendance) {
		this.sc_attendance = sc_attendance;
	}
	public String getSc_leave() {
		return sc_leave;
	}
	public void setSc_leave(String sc_leave) {
		this.sc_leave = sc_leave;
	}
	public int getSc_date_leng() {
		return sc_date_leng;
	}
	public void setSc_date_leng(int sc_date_leng) {
		this.sc_date_leng = sc_date_leng;
	}
	public String getSc_division() {
		return sc_division;
	}
	public void setSc_division(String sc_division) {
		this.sc_division = sc_division;
	}
	public String getSc_status() {
		return sc_status;
	}
	public void setSc_status(String sc_status) {
		this.sc_status = sc_status;
	}
	
	
}
