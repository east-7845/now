package com.now.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class PollListVO {
	private int PO_NO;             /* 글번호*/ 
	private String PO_LIST = "";   /* 항목  */

	public PollListVO() {
	} 
	
	public PollListVO(int pO_NO, String pO_LIST) {
		super();
		PO_NO = pO_NO;
		PO_LIST = pO_LIST;
	}

	public int getPO_NO() {
		return PO_NO;
	}

	public void setPO_NO(int pO_NO) {
		PO_NO = pO_NO;
	}

	public String getPO_LIST() {
		return PO_LIST;
	}

	public void setPO_LIST(String pO_LIST) {
		PO_LIST = pO_LIST;
	}

	// ToStringBuilder
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
