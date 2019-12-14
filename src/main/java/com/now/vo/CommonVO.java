package com.now.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class CommonVO {
	private String com_cd = "";     /* 공통코드 */
	private String com_name = "";   /* 공통명   */
	private String com_del = "";    /* 삭제여부 */
	private String com_parent = ""; /* 부모코드 */

	public String getCom_cd() {
		return com_cd;
	}
	public void setCom_cd(String com_cd) {
		this.com_cd = com_cd;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_del() {
		return com_del;
	}
	public void setCom_del(String com_del) {
		this.com_del = com_del;
	}
	public String getCom_parent() {
		return com_parent;
	}
	public void setCom_parent(String com_parent) {
		this.com_parent = com_parent;
	}

	// ToStringBuilder
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
}