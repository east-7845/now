package com.now.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class CommonVO {
	private String COM_CD = "";     /* 공통코드 */
	private String COM_NAME = "";   /* 공통명   */
	private String COM_DEL = "";    /* 삭제여부 */
	private String COM_PARENT = ""; /* 부모코드 */
	
	
	public CommonVO() {
	}


	public CommonVO(String cOM_CD, String cOM_NAME, String cOM_DEL, String cOM_PARENT) {
		super();
		COM_CD = cOM_CD;
		COM_NAME = cOM_NAME;
		COM_DEL = cOM_DEL;
		COM_PARENT = cOM_PARENT;
	}


	public String getCOM_CD() {
		return COM_CD;
	}


	public void setCOM_CD(String cOM_CD) {
		COM_CD = cOM_CD;
	}


	public String getCOM_NAME() {
		return COM_NAME;
	}


	public void setCOM_NAME(String cOM_NAME) {
		COM_NAME = cOM_NAME;
	}


	public String getCOM_DEL() {
		return COM_DEL;
	}


	public void setCOM_DEL(String cOM_DEL) {
		COM_DEL = cOM_DEL;
	}


	public String getCOM_PARENT() {
		return COM_PARENT;
	}


	public void setCOM_PARENT(String cOM_PARENT) {
		COM_PARENT = cOM_PARENT;
	}

	// ToStringBuilder
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
}