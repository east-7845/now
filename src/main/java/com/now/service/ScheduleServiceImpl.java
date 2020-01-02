package com.now.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.now.dao.IScheduleDao;
import com.now.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements IScheduleService{

	@Autowired
	public IScheduleDao scheduledao;
	
	@Override
	public List<ScheduleVO> selectScList(ScheduleVO sch) throws Exception {
		List<ScheduleVO> list = scheduledao.selectScList(sch);
		
		return list;
	}

	@Override
	public int insertSc(ScheduleVO sch) throws Exception {
		int cnt = scheduledao.insertSc(sch);
		
		return cnt;
	}

	@Override
	public int updateSc(ScheduleVO sch) throws Exception {
		int cnt = scheduledao.updateSc(sch);
		
		return cnt;
	}

	@Override
	public int insertScHoliday(ScheduleVO sch) throws Exception {
		
		return 0;
	}

	@Override
	public int deleteSc(ScheduleVO sch) throws Exception {
		
		return 0;
	}
}





