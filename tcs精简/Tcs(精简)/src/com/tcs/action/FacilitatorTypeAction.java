package com.tcs.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.FacilitatorTypeDAO;
import com.tcs.daoimpl.FacilitatorTypeDAOImpl;
import com.tcs.entity.Company;
import com.tcs.entity.FacilitatorType;

public class FacilitatorTypeAction extends SuperAction implements ModelDriven<FacilitatorType> {
	private static final long serialVersionUID = 1L;

	FacilitatorType ftype = new FacilitatorType();
	
	FacilitatorTypeDAO fdao = new FacilitatorTypeDAOImpl();
	
	//获取全部服务类型
	public String getType() {
		List<FacilitatorType> li = fdao.getType();
		List<String> typeName = new ArrayList<String>();
		for (int i = 0; i < li.size(); i++) {
			typeName.add(li.get(i).getFacilitatorTypeName());
		}
		session.setAttribute("facilitatorType", li);//将服务类型放入session
		session.setAttribute("facilitatorTypeName", typeName);//将服务类型名称放入session

		return "gettpye_success";
	}
	//获取类型名称
	public String getTypeName(){
		Company com = (Company) session.getAttribute("loginCompany");
		if(com.getCompany_facilitatorType()!=null){
			FacilitatorType facilitatorType = fdao.getTypeById(com.getCompany_facilitatorType().getFacilitatorTypeId());
			session.setAttribute("ftName", facilitatorType.getFacilitatorTypeName());
		}
		return "gettypename_success";
	}
	
	public String getTypeToUpdate(){
		FacilitatorType ft = fdao.getTypeById(ftype.getFacilitatorTypeId());
		request.setAttribute("type", ft);
		return "gettypetoupdate_success";
	}
	
	public String addType(){
		if(fdao.addFacilitatorType(ftype)){
			return "addfacilitatortype_success";
		}else{
			return "addfacilitatortype_failure";
		}
	}
	
	public String updateType(){
		if(fdao.updateFacilitatorType(ftype)){
			return "updatefacilitatortype_success";
		}else{
			return "updatefacilitatortype_failure";
		}
	}
	
	public String delete(){
		ftype = fdao.getTypeById(ftype.getFacilitatorTypeId());
		if(fdao.deleteFacilitatorType(ftype)){
			return "deletefacilitatortype_success";
		}else{
			return "deletefacilitatortype_failure";
		}
	}
	
	@Override
	public FacilitatorType getModel() {
		return this.ftype;
	}

}
