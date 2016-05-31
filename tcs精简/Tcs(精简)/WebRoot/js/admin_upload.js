//校验图片
function setImagePreview() {
	var docObj = document.getElementById("doc");
	var imgObjPreview = document.getElementById("preview");
	if (docObj.files && docObj.files[0]) {
		//imgObjPreview.src = docObj.files[0].getAsDataURL();  
		//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式          
		imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
	} else {
		//IE下，使用滤镜                          
		docObj.select();
		var imgSrc = document.selection.createRange().text;
		var localImagId = document.getElementById("localImag");
		//必须设置初始大小                          
		localImagId.style.width = "200px";
		localImagId.style.height = "200px";
		//图片异常的捕捉，防止用户修改后缀来伪造图片  
		try {
			localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			localImagId.filters
			.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		} catch (e) {
			alert("您上传的图片格式不正确，请重新选择!");
			return false;
		}
		imgObjPreview.style.display = 'none';
		document.selection.empty();
	}
	return true;
}

//校验地址
function setUpload(){
	var doc=document.getElementById('doc').value;
	var localError=document.getElementById('localError');
	if(doc!=null&&doc!='')
		return true;
	else {
		localError.style.opacity=1;
		return false;
	}		
}
