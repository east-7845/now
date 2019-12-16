package com.now.util;

import java.io.File;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.now.vo.AttachVO;

// dao, service도 아니라서 그냥 @Component라고 해놓았다 bean에 등ㄹ고은 해야되니... 
@Component
public class StudyAttachUtils {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// CommonsMultipartResolver // context-datasource.xml 에서
	@Value("#{app['file.upload.path']}")
	private String uploadPath;

	public AttachVO getAttachByMultipart(MultipartFile multipart, String category, String path) throws IOException {
		if (!multipart.isEmpty()) {
			String save_name = UUID.randomUUID().toString();
			AttachVO vo = new AttachVO();
			
			vo.setFa_Original_Name(multipart.getOriginalFilename());
			vo.setFa_File_Size(multipart.getSize());
			vo.setFa_Content_Type(multipart.getContentType());
			vo.setFa_File_Name(save_name);
			vo.setFa_Category(category);
			vo.setFa_Path(path);
			vo.setFa_Fancy_Size(fancySize(multipart.getSize()));
			String absoluteFileName = uploadPath + File.separatorChar + vo.getFa_Path() + File.separatorChar
					+ vo.getFa_File_Name();
			logger.debug("absoluteFileName = {}", absoluteFileName);
			// transferTo는 디렉토리가 없으면 에러발생, commons-io 사용
			// multipart.transferTo(new File(absoluteFileName));
			FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(absoluteFileName));
			return vo;
		} else {
			return null;
		}
	}

	public List<AttachVO> getAttachListByMultiparts(MultipartFile[] multipartFiles, String category, String path)
			throws IOException {
		List<AttachVO> atchList = new ArrayList<AttachVO>();
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile multipart = multipartFiles[i];
			AttachVO vo = this.getAttachByMultipart(multipart, category, path);
			if (vo != null) {
				atchList.add(vo);
			}
		}
		return atchList;
	}
	
	public String fancySize(long size) {
		String str = "";
		double age = 0;
		
		NumberFormat format = NumberFormat.getInstance();
		
		if(size < 1024) {
			
			str = Long.toString(size) + " byte";
		}else if(size >= 1024 && size < (1024*1024) ) {
			age = (size/1024.0);
			//str = format.format(age) + " kbyte";
			str = String.format("%.2f kbyte", age);
		}else if(size > (1024*1024) && size < (1024*1024*1024)) {
			age = size/(1024.0*1024.0);
			//str = format.format(age) + " Mbyte";
			str = String.format("%.2f Mbyte", age);
		}
		
		return str;
	}
}
