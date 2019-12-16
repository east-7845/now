package com.now.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IAttachDao;
import com.now.vo.AttachVO;

@Service
public class AttachServiceImpl implements IAttachService {
	@Autowired
	private IAttachDao attachDao;

	@Override
	public AttachVO selectAttach(int atch_no) throws Exception {
		return attachDao.selectAttach(atch_no);
	}

	@Override
	public int increaseDownloadCount(int atch_no) throws Exception {
		return attachDao.increaseDownloadCount(atch_no);
	}
}