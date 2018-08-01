package com.demo.converter;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.core.convert.converter.Converter;

public class String2DateConverter implements Converter<String, Date>{
	
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public Date convert(String str) {
		java.util.Date temp = null;
		try {
			//java.util.Date
			temp = DATE_FORMAT.parse(str);
		} catch (ParseException e) {
			temp = null;
		} 
		if(temp != null){
			//java.sql.Date
			long l1 = temp.getTime();
			java.sql.Date date = new Date(l1);
			
			return date;
		}else{
			return null;
		}
	}
}
