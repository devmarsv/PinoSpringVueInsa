package com.psi.myapp;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	
	@RequestMapping(value = "/uploadForm")
	public String uploadForm() {
	return "uploadForm";
	}
	
	@RequestMapping(value = "/uploadAjax")
	public String uploadAjax() {
	return "uploadAjax";
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "C:\\upload";
		for(MultipartFile multipartFile : uploadFile) {
		
		
				UUID uuid = UUID.randomUUID();
				String uploadFileName = multipartFile.getOriginalFilename();
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				File saveFile = new File(uploadFolder, uploadFileName);
				try {
					
				multipartFile.transferTo(saveFile);
			}catch(Exception e)
			{
				
			}
		 
		}
	}
}
