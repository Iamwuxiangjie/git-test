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
	var oNavbarBrand = getByClass(oNav, 'navbar-brand')[0];
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
};


//get class
function getByClass(oParent, sClass) {
	var aEle = oParent.getElementsByTagName('*');
	var aResult = [];
	var re = new RegExp('\\b' + sClass + '\\b', 'i');
	var i = 0;
	for (i = 0; i < aEle.length; i++) {
		//if(aEle[i].className==sClass)
		//if(aEle[i].className.search(sClass)!=-1)
		if (re.test(aEle[i].className)) {
			aResult.push(aEle[i]);
		}
	}
	return aResult;
}
//Bootstrap Hover Dropdown 
;(function($, window, undefined) {
	var $allDropdowns = $();
	$.fn.dropdownHover = function(options) {
		if ('ontouchstart' in document) return this; // don't want to affect chaining
		$allDropdowns = $allDropdowns.add(this.parent());
		return this.each(function() {
			var $this = $(this),
			$parent = $this.parent(),
			defaults = {
				delay: 100,
				hoverDelay: 0,
				instantlyCloseOthers: true
			},
			data = {
				delay: $(this).data('delay'),
				hoverDelay: $(this).data('hover-delay'),
				instantlyCloseOthers: $(this).data('close-others')
			},
			showEvent = 'show.bs.dropdown',
			hideEvent = 'hide.bs.dropdown',
			settings = $.extend(true, {}, defaults, options, data),
			timeout, timeoutHover;
			$parent.hover(function(event) {
				if (!$parent.hasClass('open') && !$this.is(event.target)) {
					return true;
				}
				openDropdown(event);
			}, function() {
				window.clearTimeout(timeoutHover)
				timeout = window.setTimeout(function() {
					$this.attr('aria-expanded', 'false');
					$parent.removeClass('open');
					$this.trigger(hideEvent);
				}, settings.delay);
			});
			$this.hover(function(event) {
				if (!$parent.hasClass('open') && !$parent.is(event.target)) {
					return true;
				}
				openDropdown(event);
			});
			$parent.find('.dropdown-submenu').each(function() {
				var $this = $(this);
				var subTimeout;
				$this.hover(function() {
					window.clearTimeout(subTimeout);
					$this.children('.dropdown-menu').show();
					$this.siblings().children('.dropdown-menu').hide();
				}, function() {
					var $submenu = $this.children('.dropdown-menu');
					subTimeout = window.setTimeout(function() {
						$submenu.hide();
					}, settings.delay);
				});
			});

			function openDropdown(event) {
				if ($this.parents(".navbar").find(".navbar-toggle").is(":visible")) {
					return;
				}
				window.clearTimeout(timeout);
				window.clearTimeout(timeoutHover);
				timeoutHover = window.setTimeout(function() {
					$allDropdowns.find(':focus').blur();
					if (settings.instantlyCloseOthers === true) $allDropdowns.removeClass('open');
					window.clearTimeout(timeoutHover);
					$this.attr('aria-expanded', 'true');
					$parent.addClass('open');
					$this.trigger(showEvent);
				}, settings.hoverDelay);
			}
		});
	};
	$(document).ready(function() {
		$('[data-hover="dropdown"]').dropdownHover();
	});
})(jQuery, window);
//radio
$(document).ready(function() {
	$('input').iCheck({
		radioClass: 'iradio_square-blue',
		increaseArea: '20%' // optional
	});
});
//masonry
$(function() {
	var $container = $('#masonry');
	$container.imagesLoaded(function() {
		$container.masonry({
			itemSelector: '.box',
			isAnimated: true,
		});
	});
});

//表单验证
$(function(){
	$('#LoginBtn').click(function(){
		var Name = $('#LoginName').val();
		var Pwd = $('#LoginPwd').val();
		if(Name == "") {
			alert("请输入账号！");
			return false;
		} 
		else{
			if(Pwd == "") {
				alert("请输入密码！");
				return false;
			}
			else{
				var val=$('input:radio[name="person"]:checked').val();
				var val2=$('input:radio[name="square-radio"]:checked').val();		
				if(val==null&&val2==null){
					alert("请选择登录类型！");
					return false;
				}
				else{
					return true;
				}	
			}
		}
		return true;
	});
});

$(function(){
	$('#RegBtn').click(function(){
		var Accout = $('#LoginA').val();
		var Name = $('#LoginN').val();
		var Pwd = $('#LoginP').val();
		var RePwd = $('#LoginRP').val();
		var Phone = $('#LoginPh').val();
		var Provinces = $('#provinces option:selected').text();
		var City = $('#city option:selected').text();
		var Address = $('#LoginAd').val();
		if(Accout == "") {
			alert("请输入用户账号！");
			return false;
		} 
		else{
			if(Name == "") {
				alert("请输入用户昵称！");
				return false;
			}
			else{
				if(Pwd == "") {
					alert("请输入用户密码！");
					return false;
				}
				else{
					if(RePwd == "") {
						alert("请确认密码！");
						return false;
					}
					else{
						if(RePwd != Pwd) {
							alert("确认密码与用户密码不一致！");
							return false;
						}
						else{
							if(Phone == "") {
								alert("请输入用户电话！");
								return false;
							}
							else{
								if(Provinces == "--选择省份--") {
									alert("请选择省份！");
									return false;
								}
								else{
									if(City == "--选择市区--") {
										alert("请选择市区！");
										return false;
									}
									else{
										if(Address == "") {
											alert("请输入详细地址！");
											return false;
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return true;
	});
});

$(function(){
	$('#ReBtn').click(function(){
		var LoginPwd = $('#LoginPwd').val();
		var LoginRePwd = $('#LoginRePwd').val();
		if(LoginPwd == "") {
			alert("请输入新密码！");
			return false;
		} 
		else{
			if(LoginRePwd == "") {
				alert("请确认密码！");
				return false;
			}
			else{
				if(LoginPwd != LoginRePwd){
					alert("确认密码与新密码不一致！");
					return false;
				}
			}
		}
		return true;
	});
});

$(function(){
	$('#ComRegBtn').click(function(){
		var Name = $('#Name').val();
		var Accout = $('#Acc').val();
		var Pwd = $('#Pwd').val();
		var RePwd = $('#RP').val();
		var Provinces = $('#provinces option:selected').text();
		var City = $('#city option:selected').text();
		var Address = $('#Ad').val();
		var Phone = $('#Ph').val();
		if(Name == "") {
			alert("请输入公司名！");
			return false;
		} 
		else{
			if(Accout == "") {
				alert("请输入公司账号！");
				return false;
			}
			else{
				if(Pwd == "") {
					alert("请输入公司密码！");
					return false;
				}
				else{
					if(RePwd == "") {
						alert("请确认密码！");
						return false;
					}
					else{
						if(RePwd != Pwd) {
							alert("确认密码与公司密码不一致！");
							return false;
						}
						else{
							if(Provinces == "--选择省份--") {
								alert("请选择省份！");
								return false;
							}
							else{
								if(City == "--选择市区--") {
									alert("请选择市区！");
									return false;
								}
								else{
									if(Address == "") {
										alert("请输入详细地址！");
										return false;
									}
									else{
										if(Phone == "") {
											alert("请输入公司电话！");
											return false;
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return true;
	});
});

$(function(){
	$('#AddBtn').click(function(){
		var Name = $('#Name').val();
		var Explain = $('#Explain').val();
		var Price = $('#Price').val();
		if(Name == "") {
			alert("请输入服务名称！");
			return false;
		} 
		else{
			if(Explain == "") {
				alert("请输入服务简介！");
				return false;
			}
			else{
				if(Price == "") {
					alert("请输入服务价格！");
					return false;
				}
			}
		}
		return true;
	});
});

$(function(){
	$('#send').click(function(){
		var title = $('#title').val();
		var mess = $('#mess').val();
		if(title == "") {
			alert("请输入消息标题！");
			return false;
		} 
		else{
			if(mess == "") {
				alert("请输入消息内容！");
				return false;
			}
		}
		return true;
	});
});

$(function(){
	$('#updateService').click(function(){
		var Name = $('#Name').val();
		var Explain = $('#Explain').val();
		var Price = $('#Price').val();
		var doc = $('#doc').val();
		if(Name == "") {
			alert("请输入服务名称！");
			return false;
		} 
		else{
			if(Explain == "") {
				alert("请输入服务简介！");
				return false;
			}
			else{
				if(Price == "") {
					alert("请输入服务价格！");
					return false;
				}
				else{
					if(doc == "") {
						alert("请上传服务图片！");
						return false;
					}
				}
			}
		}
		return true;
	});
});