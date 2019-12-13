package com.now.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class PollBoardVO {
	private int po_no;                 /* 글번호 */
	private String po_title = "";      /* 제목 */
	private String po_topic = "";      /* 내용분류 */
	private String po_writer = "";     /* 작성자 */
	private String po_pass = "";       /* 비밀번호 */
	private String po_group = "";      /* 투표해당그룹 */
	private String po_content = "";    /* 내용 */
	private int po_hit;                /* 조회수 */
	private String po_ip = "";         /* IP */
	private String po_reg_date = "";   /* 등록일 */
	private String po_mod_date = "";   /* 수정일 */
	private String po_due_date = "";   /* 만료일 */
	private String po_comp_yn = "";    /* 완료여부 */
	private String po_del_yn = "";     /* 삭제여부 */
	private String po_vaild_yn = "";   /* 만료여부 */
	private String po_result = "";     /* 투표결과 */
	
	public PollBoardVO() {
	}

	public PollBoardVO(int po_no, String po_title, String po_topic, String po_writer, String po_pass, String po_group,
			String po_content, int po_hit, String po_ip, String po_reg_date, String po_mod_date, String po_due_date,
			String po_comp_yn, String po_del_yn, String po_vaild_yn, String po_result) {
		super();
		this.po_no = po_no;
		this.po_title = po_title;
		this.po_topic = po_topic;
		this.po_writer = po_writer;
		this.po_pass = po_pass;
		this.po_group = po_group;
		this.po_content = po_content;
		this.po_hit = po_hit;
		this.po_ip = po_ip;
		this.po_reg_date = po_reg_date;
		this.po_mod_date = po_mod_date;
		this.po_due_date = po_due_date;
		this.po_comp_yn = po_comp_yn;
		this.po_del_yn = po_del_yn;
		this.po_vaild_yn = po_vaild_yn;
		this.po_result = po_result;
	}

	public int getPo_no() {
		return po_no;
	}

	public void setPo_no(int po_no) {
		this.po_no = po_no;
	}

	public String getPo_title() {
		return po_title;
	}

	public void setPo_title(String po_title) {
		this.po_title = po_title;
	}

	public String getPo_topic() {
		return po_topic;
	}

	public void setPo_topic(String po_topic) {
		this.po_topic = po_topic;
	}

	public String getPo_writer() {
		return po_writer;
	}

	public void setPo_writer(String po_writer) {
		this.po_writer = po_writer;
	}

	public String getPo_pass() {
		return po_pass;
	}

	public void setPo_pass(String po_pass) {
		this.po_pass = po_pass;
	}

	public String getPo_group() {
		return po_group;
	}

	public void setPo_group(String po_group) {
		this.po_group = po_group;
	}

	public String getPo_content() {
		return po_content;
	}

	public void setPo_content(String po_content) {
		this.po_content = po_content;
	}

	public int getPo_hit() {
		return po_hit;
	}

	public void setPo_hit(int po_hit) {
		this.po_hit = po_hit;
	}

	public String getPo_ip() {
		return po_ip;
	}

	public void setPo_ip(String po_ip) {
		this.po_ip = po_ip;
	}

	public String getPo_reg_date() {
		return po_reg_date;
	}

	public void setPo_reg_date(String po_reg_date) {
		this.po_reg_date = po_reg_date;
	}

	public String getPo_mod_date() {
		return po_mod_date;
	}

	public void setPo_mod_date(String po_mod_date) {
		this.po_mod_date = po_mod_date;
	}

	public String getPo_due_date() {
		return po_due_date;
	}

	public void setPo_due_date(String po_due_date) {
		this.po_due_date = po_due_date;
	}

	public String getPo_comp_yn() {
		return po_comp_yn;
	}

	public void setPo_comp_yn(String po_comp_yn) {
		this.po_comp_yn = po_comp_yn;
	}

	public String getPo_del_yn() {
		return po_del_yn;
	}

	public void setPo_del_yn(String po_del_yn) {
		this.po_del_yn = po_del_yn;
	}

	public String getPo_vaild_yn() {
		return po_vaild_yn;
	}

	public void setPo_vaild_yn(String po_vaild_yn) {
		this.po_vaild_yn = po_vaild_yn;
	}

	public String getPo_result() {
		return po_result;
	}

	public void setPo_result(String po_result) {
		this.po_result = po_result;
	}
	
	// ToStringBuilder
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
}
