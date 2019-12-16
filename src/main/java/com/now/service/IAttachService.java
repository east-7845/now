package com.now.service;

import com.now.vo.AttachVO;

public interface IAttachService {
	/** 첨부파일 상세 조회 */
	public AttachVO selectAttach(int atch_no) throws Exception;

	/** 다운로드 횟수 증가 */
	public int increaseDownloadCount(int atch_no) throws Exception;
}
