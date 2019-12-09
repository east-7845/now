package com.now.noticeboard.vo;

public class NoticeVO {
	                                                              
		private int nt_no; 
		private String nt_title = "";
		private String	nt_content = "";
		private int nt_hit;
		private int nt_reg_date;
		private int nt_mod_date;
		private String nt_class;
		private String nt_writer;
		private String	 nt_del_yn;
		
		
		public int getNt_no() {
			return nt_no;
		}
		public String getNt_title() {
			return nt_title;
		}
		public String getNt_content() {
			return nt_content;
		}
		public int getNt_hit() {
			return nt_hit;
		}
		public int getNt_reg_date() {
			return nt_reg_date;
		}
		public int getNt_mod_date() {
			return nt_mod_date;
		}
		public String getNt_class() {
			return nt_class;
		}
		public String getNt_writer() {
			return nt_writer;
		}
		public String getNt_del_yn() {
			return nt_del_yn;
		}
		public void setNt_no(int nt_no) {
			this.nt_no = nt_no;
		}
		public void setNt_title(String nt_title) {
			this.nt_title = nt_title;
		}
		public void setNt_content(String nt_content) {
			this.nt_content = nt_content;
		}
		public void setNt_hit(int nt_hit) {
			this.nt_hit = nt_hit;
		}
		public void setNt_reg_date(int nt_reg_date) {
			this.nt_reg_date = nt_reg_date;
		}
		public void setNt_mod_date(int nt_mod_date) {
			this.nt_mod_date = nt_mod_date;
		}
		public void setNt_class(String nt_class) {
			this.nt_class = nt_class;
		}
		public void setNt_writer(String nt_writer) {
			this.nt_writer = nt_writer;
		}
		public void setNt_del_yn(String nt_del_yn) {
			this.nt_del_yn = nt_del_yn;
		}

}
