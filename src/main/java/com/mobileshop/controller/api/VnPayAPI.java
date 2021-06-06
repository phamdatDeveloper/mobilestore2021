package com.mobileshop.controller.api;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mobileshop.config.VnPayConfig;

@RestController
public class VnPayAPI {
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@PostMapping("/vnpay")
	public @ResponseBody String vnpay(HttpServletRequest req, HttpServletResponse resp)
			throws UnsupportedEncodingException {
		String vnp_Version = "2.0.0";
		String vnp_Command = "pay";
		String vnp_OrderInfo = req.getParameter("vnp_OrderInfo");
		String orderType = req.getParameter("ordertype");
		String vnp_TxnRef = VnPayConfig.getRandomNumber(8);
		String vnp_IpAddr = VnPayConfig.getIpAddress(req);
		String vnp_TmnCode = VnPayConfig.vnp_TmnCode;

		String vnp_TransactionNo = vnp_TxnRef;
		String vnp_hashSecret = VnPayConfig.vnp_HashSecret;

		Long amount = Long.parseLong(req.getParameter("amount")) * 100;
		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", vnp_Version);
		vnp_Params.put("vnp_Command", vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(amount));
		vnp_Params.put("vnp_CurrCode", "VND");
		String bank_code = req.getParameter("bankcode");
		if (bank_code != null && bank_code.isEmpty()) {
			vnp_Params.put("vnp_BankCode", bank_code);
		}
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
		vnp_Params.put("vnp_OrderType", orderType);

		String locate = req.getParameter("language");
		if (locate != null && !locate.isEmpty()) {
			vnp_Params.put("vnp_Locale", locate);
		} else {
			vnp_Params.put("vnp_Locale", "vn");
		}
		vnp_Params.put("vnp_ReturnUrl", VnPayConfig.vnp_Returnurl);
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

		Date dt = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(dt);
		String vnp_CreateDate = dateString;
		String vnp_TransDate = vnp_CreateDate;
		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		// Build data to hash and querystring
		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				// Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(fieldValue);
				// Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();
		String vnp_SecureHash = VnPayConfig.Sha256(VnPayConfig.vnp_HashSecret + hashData.toString());
		// System.out.println("HashData=" + hashData.toString());
		queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = VnPayConfig.vnp_PayUrl + "?" + queryUrl;
		com.google.gson.JsonObject job = new JsonObject();
		job.addProperty("code", "00");
		job.addProperty("message", "success");
		job.addProperty("data", paymentUrl);
		Gson gson = new Gson();
//        Respon.getWriter().write(gson.toJson(job));
		return gson.toJson(job);

	}
}
