package com.mobileshop.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mobileshop.entity.FileEntity;
import com.mobileshop.utils.UploadFile;

@Controller
public class UploadFileController {

	@RequestMapping(value = "/admin/uploadFile", method = RequestMethod.GET)
	public String uploadOneFileHandler(Model model) {
		FileEntity fileEntity = new FileEntity();
		model.addAttribute("fileEntity", fileEntity);

		// Forward to "/WEB-INF/pages/uploadOneFile.jsp".
		return "admin/uploadfile";
	}

//	@RequestMapping(value = "/admin/uploadOneFile", method = RequestMethod.POST)
//	public String uploadOneFileHandlerPOST(HttpServletRequest request, //
//			Model model, @RequestParam("file") CommonsMultipartFile[] file) {
//		return UploadFile.doUpload(request, model, file);
//
//	}
	
	 @PostMapping("/api/uploadOneFile")
	   public ResponseEntity<List<String>> fileUpload(HttpServletRequest request, Model model,@RequestParam("file") CommonsMultipartFile[] file)
	         throws IOException {
		 List<String> linkImages= UploadFile.doUpload(request, model, file);
	      return new ResponseEntity<>(linkImages,HttpStatus.OK);
	   }
}
