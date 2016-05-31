package com.test;

import java.util.List;

import com.tcs.dao.ServiceDAO;
import com.tcs.daoimpl.ServiceDAOImpl;
import com.tcs.entity.Comment;
import com.tcs.entity.Service;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ServiceDAO dao=new ServiceDAOImpl();
		/*List<Service> li=dao.selectAllService(1, 10, false, null, false, null,true,"a13s2f1ad");
		for(Service se:li){
			System.out.println(se.getServiceId()+":"+se.getServiceName());
		}
		System.out.println(li.size());*/
		long i = dao.theNumOfServices(false, null, false, null, true, "a13s2f1ad");
		System.out.println(i);
	}

}
