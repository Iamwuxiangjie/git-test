//校验登录
function repwd(){
	var oldpwd=document.getElementById('oldpwd');
	var newpwd=document.getElementById('newpwd');
	var newrepwd=document.getElementById('newrepwd');
	if(frm.oldpwd.value==null||frm.oldpwd.value==''){
		oldpwd.style.display='block';
		oldpwd.innerHTML='旧密码不为空';
		return false;
	}
	else{
		oldpwd.style.display='none';
		if(frm.newpwd.value==null||frm.newpwd.value==''){
			newpwd.style.display='block';
			newpwd.innerHTML='新密码不为空';
			return false;
		}
		else{
			newpwd.style.display='none';
			if(frm.newpwd.value!=frm.newrepwd.value){
				newrepwd.style.display='block';
				newrepwd.innerHTML='两次密码输入不一致';
				return false;
			}
		}
	}
	newrepwd.style.display='none';
	return true;
}