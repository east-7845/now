package com.now.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.now.vo.ScheduleVO;

@Mapper
public interface IScheduleDao {
	
	/**
	 * 사용자 근태정보 리스트
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> selectScList() throws Exception;
	
	/**
	 * 근태정보 등록(출근, 휴가일)
	 * @return
	 * @throws Exception
	 */
	public int insertSc(ScheduleVO sch) throws Exception;
	
	/**
	 * 근태정보 등록(휴가)
	 * @return
	 * @throws Exception
	 */
	public int insertScHoliday(ScheduleVO sch) throws Exception;
	
	/**
	 * 근태정보 수정 및 등록(퇴근)
	 * @param sch
	 * @return
	 * @throws Exception
	 */
	public int updateSc(ScheduleVO sch) throws Exception;
	
	/**
	 * 근태정보 등록(퇴근)
	 * @return
	 * @throws Exception
	 */
	public int insertScOut(ScheduleVO sch) throws Exception;
	
	
	
}
