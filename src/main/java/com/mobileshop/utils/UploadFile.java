package com.mobileshop.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadFile {

	public static List<String> doUpload(HttpServletRequest request, Model model, //
			CommonsMultipartFile[] files) {
		List<String> result = new ArrayList<String>();
		// Thư mục gốc upload file.
		String uploadRootPath = request.getServletContext().getRealPath("/");
		System.out.println("uploadRootPath=" + uploadRootPath);
		
		
		File uploadRootDir = new File(uploadRootPath + File.separator + "template"+File.separator+"admin"+File.separator+"assets"+File.separator+"images");
		//
		// Tạo thư mục gốc upload nếu nó không tồn tại.
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}
		List<File> uploadedFiles = new ArrayList<File>();
		for (CommonsMultipartFile fileData : files) {

			// Tên file gốc tại Client.
			String name = fileData.getOriginalFilename();
			System.out.println("Client File Name = " + name);

			if (name != null && name.length() > 0) {
				try {
					// Tạo file tại Server.
					File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

					// Luồng ghi dữ liệu vào file trên Server.
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(fileData.getBytes());
					result.add("/template/admin/assets/images/"+name);
					System.out.println(File.separator + "template"+File.separator+"admin"+File.separator+"assets"+File.separator+"images"+File.separator+name);
					stream.close();
					//
					uploadedFiles.add(serverFile);
					System.out.println("Write file: " + serverFile);
				} catch (Exception e) {
					System.out.println("Error Write file: " + name);
				}
			}
		}
		model.addAttribute("uploadedFiles", result);
		return result;
	}
}
