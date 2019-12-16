package com.now.vo;

import java.util.List;

public class FreeBoardVO {
	
	private int fr_no; /* 게시글 */
	private String fr_title = "";
	private String fr_parent_no = ""; /* 작성자 */
	private String fr_pass = ""; /* 비밀번호 */
	private String fr_content = ""; /* 내용 */
	private int fr_hit; /* 조회수 */
	private String fr_ip = ""; /* IP */
	private String fr_reg_date = ""; /* 등록일 */
	private String fr_mod_date = ""; /* 수정일 */
	private String fr_del_yn = ""; /* 삭제여부 */
	private String fr_class = ""; /* 등록분류 */
	
	private List<AttachVO> attaches ; /* 첨부파일 리스트 */
	private int[] del_atch_nos; /* 삭제할 대상 첨부파일 번호 */
	
	public List<AttachVO> getAttaches() {
		return attaches;
	}

	public void setAttaches(List<AttachVO> attaches) {
		this.attaches = attaches;
	}

	public int[] getDel_atch_nos() {
		return del_atch_nos;
	}

	public void setDel_atch_nos(int[] del_atch_nos) {
		this.del_atch_nos = del_atch_nos;
	}

	public int getFr_no() {
		return fr_no;
	}

	public void setFr_no(int fr_no) {
		this.fr_no = fr_no;
	}

	public String getFr_title() {
		return fr_title;
	}

	public void setFr_title(String fr_title) {
		this.fr_title = fr_title;
	}

	public String getFr_parent_no() {
		return fr_parent_no;
	}

	public void setFr_parent_no(String fr_parent_no) {
		this.fr_parent_no = fr_parent_no;
	}

	public String getFr_pass() {
		return fr_pass;
	}

	public void setFr_pass(String fr_pass) {
		this.fr_pass = fr_pass;
	}

	public String getFr_content() {
		return fr_content;
	}

	public void setFr_content(String fr_content) {
		this.fr_content = fr_content;
	}

	public int getFr_hit() {
		return fr_hit;
	}

	public void setFr_hit(int fr_hit) {
		this.fr_hit = fr_hit;
	}

	public String getFr_ip() {
		return fr_ip;
	}

	public void setFr_ip(String fr_ip) {
		this.fr_ip = fr_ip;
	}

	public String getFr_reg_date() {
		return fr_reg_date;
	}

	public void setFr_reg_date(String fr_reg_date) {
		this.fr_reg_date = fr_reg_date;
	}

	public String getFr_mod_date() {
		return fr_mod_date;
	}

	public void setFr_mod_date(String fr_mod_date) {
		this.fr_mod_date = fr_mod_date;
	}

	public String getFr_del_yn() {
		return fr_del_yn;
	}

	public void setFr_del_yn(String fr_del_yn) {
		this.fr_del_yn = fr_del_yn;
	}

	public String getFr_class() {
		return fr_class;
	}

	public void setFr_class(String fr_class) {
		this.fr_class = fr_class;
	}

}
