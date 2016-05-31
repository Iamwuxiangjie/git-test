function checkall(ev,m){
		var obj= document.getElementsByTagName('input');
		if(ev.checked==true)
		{
			for(var i=0;i<obj.length;i++)
			{
				if(obj[i].className == m)
				{
					obj[i].checked=true;
				}
			}
		}
		else if(ev.checked==false)
		{
			for(var i=0;i<obj.length;i++)
			{
				if(obj[i].className == m)
				{
					obj[i].checked=false;
				}
			}
		}
	}
	
	function check(m){
		var obj= document.getElementsByTagName('input');
		if(m == "message1"){
			var count = obj.length;
			var flag = 0;
			for(var i=0;i<obj.length;i++)
			{
				flag++;
				if(obj[i].className == m)
				{
					if(obj[i].checked==false)
					{
						document.getElementById("all1").checked=false;
						break;
					}
				}
			}
			if(flag==count)
			{
				document.getElementById("all1").checked=true;
			}
		}else{
			var count = obj.length;
			var flag = 0;
			for(var i=0;i<obj.length;i++)
			{
				flag++;
				if(obj[i].className == m)
				{
					if(obj[i].checked==false)
					{
						document.getElementById("all2").checked=false;
						break;
					}
				}
			}
			if(flag==count)
			{
				document.getElementById("all2").checked=true;
			}
		}
	}
	
	function pd(ev){
	var form1=document.getElementById('form1');
		if(ev.value=='批量删除')
			form1.action='<%=path%>/admin/Message_deleteMessage.action?page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>';
		else if(ev.value=='批量已读')
			form1.action='<%=path%>/admin/Message_readMessage.action?page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>';
	}