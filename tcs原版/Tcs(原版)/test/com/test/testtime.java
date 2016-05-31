package com.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class testtime {
	public static void main(String[] args) throws ParseException {
		Date date = new Date();
		date.setDate(date.getDate()+1);
		
		String d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		
		Date date3=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(d1);
		Date date2 = new Date();
		
		long time = date3.getTime()-date2.getTime();
		System.out.println(time/3600);

	}
}
