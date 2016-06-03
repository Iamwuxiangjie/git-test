window.onload = function() {
	
	var companyName=document.getElementsByClassName("companyName");
	var serviceName=document.getElementsByClassName("serviceName");
	var serviceExplain=document.getElementsByClassName("serviceExplain");
	var userName=document.getElementsByClassName("userName");
	var messageTitle=document.getElementsByClassName("messageTitle");
	for(var i=0;i<messageTitle.length;i++){
		if(messageTitle[i].innerHTML.length>5){
			messageTitle[i].innerHTML=messageTitle[i].innerHTML.substring(0,5)+"...";
		}
	}
	for(var i=0;i<userName.length;i++){
		if(userName[i].innerHTML.length>15){
			userName[i].innerHTML=userName[i].innerHTML.substring(0,15)+"...";
		}
	}
	for(var i=0;i<companyName.length;i++){
		if(companyName[i].innerHTML.length>15){
			companyName[i].innerHTML=companyName[i].innerHTML.substring(0,15)+"...";
		}
	}
	for(var i=0;i<serviceName.length;i++){
		if(serviceName[i].innerHTML.length>8){
			serviceName[i].innerHTML=serviceName[i].innerHTML.substring(0,8)+"...";
		}
	}
	for(var i=0;i<serviceExplain.length;i++){
		if(serviceExplain[i].innerHTML.length>16){
			serviceExplain[i].innerHTML=serviceExplain[i].innerHTML.substring(0,16)+"...";
		}
	}
	
	var oNav = document.getElementsByTagName('nav')[0];
	var oNavbarBrand = document.getElementsByClassName('navbar-brand')[0];
	var oNavLogo = oNavbarBrand.getElementsByTagName('img')[0];
	oNavbarBrand.onmouseover = function() {
		oNavLogo.src = 'images/logo-hover.png';
	};
	oNavbarBrand.onmouseout = function() {
		oNavLogo.src = 'images/logo.png';
	};
	// edit-personal-information.html 选择偏好
	var oHobbyBtn = document.getElementById('hobby');
	var oHobbyMenu = document.getElementById('hobby-menu');
	if (oHobbyMenu) {
		var oHobbyLi = oHobbyMenu.getElementsByTagName('li');
		for (var i = 0; i < oHobbyLi.length; i++) {
			oHobbyLi[i].onclick = function() {
				oHobbyBtn.innerHTML = this.innerHTML + ' <span class="caret"></span>';
				return false;
			};
		}
	}
	// service-list-check-more
	var oCheckMore = document.getElementById('check-more');
	var oServiceMore = document.getElementById('service-more');
	if (oCheckMore) {
		oCheckMore.onclick = function() {
			if (oServiceMore.style.display == 'none') {
				oServiceMore.style.display = 'block';
			} else {
				oServiceMore.style.display = 'none';
			}
		};
	}
	// 客户评分
	var oPf = document.getElementById('pingfen');
	var aLi = oPf.getElementsByTagName('li');
	var oPingJia = document.getElementById('pingjia');
	var aTxt = ["及其不满意", "不满意", "一般", "满意", "非常满意"];
	var i = 0;
	for (i = 0; i < aLi.length; i++) {
		aLi[i].index = i;
		aLi[i].onmouseover = function() {
			for (i = 0; i < aLi.length; i++) {
				if (i <= this.index) {
					aLi[i].style.background = "url(images/star.gif) no-repeat 0 -29px";
				} else {
					aLi[i].style.background = "url(images/star.gif) no-repeat 0 0";
				}
			}
		};
		aLi[i].onmousedown = function() {
			oPingJia.innerHTML = aTxt[this.index];
		};
	}
};