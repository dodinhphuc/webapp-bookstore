package com.webapp.utils;

import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtil {
	private String value;
	
	public HttpUtil (String value) {
		this.value = value;
	}
	
	public <T> T toModel(Class<T> tClass) {
		try {
			return new ObjectMapper().readValue(value, tClass);
		} catch (Exception e) {
			return null;
		}
		
	}
	
	public static HttpUtil of (BufferedReader br) {
		StringBuilder sb = new StringBuilder();
	    String line;
	    try {	
		    while ((line = br.readLine()) != null) {
		        sb.append(line);
		    }
		} catch (IOException e) {
			System.out.println("!!");
		}	
		return new HttpUtil(sb.toString());
	}
}
