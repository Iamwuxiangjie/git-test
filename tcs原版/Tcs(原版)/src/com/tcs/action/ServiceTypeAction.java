package com.tcs.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.tcs.dao.ServiceTypeDAO;
import com.tcs.daoimpl.ServiceTypeDAOImpl;
import com.tcs.entity.ServiceType;
import com.tcs.entity.User;

public class ServiceTypeAction extends SuperAction implements ModelDriven<ServiceType> {
	private static final long serialVersionUID = 1L;
	ServiceType stype = new ServiceType();
	ServiceTypeDAO  stypedao = new ServiceTypeDAOImpl(); 
	//获取服务类型
	public String getServiceType() {
		List<ServiceType> li = stypedao.getServiceType();
		List<String> typeName = new ArrayList<String>();
		for (int i = 0; i < li.size(); i++) {
			typeName.add(li.get(i).getServiceTypeName());
		}
		session.setAttribute("serviceType", li);//将服务类型放入session
		session.setAttribute("serviceTypeName", typeName);//将服务类型名称放入session

		return "getservicetpye_success";
	}
	
	public String addType(){
		if(stypedao.addServiceType(stype)){
			return "addservicetype_success";
		}else{
			return "addservicetype_failure";
		}
	}
	
	public String getTypeToUpdate(){
		stype = stypedao.getServiceTypeById(stype.getServiceTypeId());
		request.setAttribute("type", stype);
		return "getservicetypetoupdate_success";
	}
	
	public String updateType(){
		if(stypedao.updateServiceType(stype)){
			return "updateservicetype_success";
		}else{
			return "updateservicetype_failure";
		}
	}
	
	public String delete(){
		stype = stypedao.getServiceTypeById(stype.getServiceTypeId());
		if(stypedao.deleteServiceType(stype)){
			return "deleteservicetype_success";
		}else{
			return "deleteservicetype_failure";
		}
	}
	
	public String getUserLikeServiceTypeId(){
		User u = (User) session.getAttribute("loginUser");
		if(u.getUserLike()!=null){
			int typeId = stypedao.getServiceTypeIdByName(u.getUserLike());
			session.setAttribute("serviceTypeId", typeId);
		}
		return "getuserlikeservicetypeid_success";
	}
	
	@Override
	public ServiceType getModel() {
		return this.stype;
	}

}
