package com.tcs.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.PriveunitDAO;
import com.tcs.daoimpl.PriveunitDAOImpl;
import com.tcs.entity.FacilitatorType;
import com.tcs.entity.Priveunit;

public class PriveunitAction  extends SuperAction implements ModelDriven<Priveunit> {
	private static final long serialVersionUID = 1L;
	Priveunit punit = new Priveunit();
	PriveunitDAO pdao = new PriveunitDAOImpl();
	//获取价格单位
	public String getPriveunit() {
		List<Priveunit> li = pdao.getPriveunit();
		List<String> typeName = new ArrayList<String>();
		for (int i = 0; i < li.size(); i++) {
			typeName.add(li.get(i).getPriveunitName());
		}
		session.setAttribute("priveunit", li);//将价格单位放入session
		return "getpriveunit_success";
	}
	
	public String getPriveunitToUpdate(){
		punit = pdao.getPriveunitById(punit.getPriveunitId());
		request.setAttribute("priveunit", punit);
		return "getpriveunittoupdate_success";
	}
	
	public String updatePriveunit(){
		if(pdao.updatePriveunit(punit)){
			return "updatepriveunittype_success";
		}else{
			return "updatepriveunittype_failure";
		}
	}
	
	public String addPriveunit(){
		if(pdao.addPriveunit(punit)){
			return "addpriveunittype_success";
		}else{
			return "addpriveunittype_failure";
		}
	}
	
	public String delete(){
		punit = pdao.getPriveunitById(punit.getPriveunitId());
		if(pdao.deletePriveunit(punit)){
			return "deletepriveunittype_success";
		}else{
			return "deletepriveunittype_failure";
		}
	}
	
	public Priveunit getModel() {
		return this.punit;
	}

}
