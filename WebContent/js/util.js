function validateEmpty(eleName){
	var obj = document.getElementById(eleName);
	var msg = document.getElementById(eleName + "Msg");
	if(obj.value != ""){
		obj.className = "right";
		if(msg != null){
			msg.innerHTML = "<font color='green'>输入正确</font>";
		}
		return true;
	} else {
		obj.className = "wrong";
		if(msg != null){
			msg.innerHTML = "<font color='red'>输入不允许为空</font>";
		}
		return false;
	}
}

function validateRegex(eleName,regex){
	var obj = document.getElementById(eleName);
	var msg = document.getElementById(eleName + "Msg");
	if(regex.test(obj.value)){
		obj.className = "right";
		if(msg != null){
			msg.innerHTML = "<font color='green'>输入正确</font>";
		}
		return true;
	} else {
		obj.className = "wrong";
		if(msg != null){
			msg.innerHTML = "<font color='red'>输入内容错误</font>";
		}
		return false;
	}
}

function changeColor(obj,color){
	obj.bgColor = color;
}
//实现复选框全选操作
//triggerComp：触发全选的组件
//component：实现全选操作的组件
function checkboxSelectAll(triggerComp,component){
	triggerComp.on("click",function(){
		component.each(function(){
			this.checked = triggerComp.prop("checked");
		});
	});
}
//url:表示要删除的操作路径
//paramName:表示要删除的参数名称
//eleName:表示要取得数据的ID名称
function deleteAll(url,paramName,eleName){
	var data = "";//保存要删除的数据编号
	//但是数据有可能是数组，有可能只有一个
	var item = document.all(eleName);
	var count = 0;//保存删除的数据个数
	//判断是否有要删除的数据
	if(item.length == undefined){ //表示只有一个元素，不是数字
		if(document.getElementById(eleName).checked == true){ //数据选中
			data += document.getElementById(eleName).value;
			count ++;
		}
	} else {
		for(var x=0;x<item.length;x++){
			if(item[x].checked == true){
				count ++;
				data += item[x].value + "|";
			}
		}
	}
	if(count > 0){  //有要删除的数据
		if(window.confirm("确定删除数据吗？")){
			//console.log(url + "?" + paramName +"=" + data);
			window.location = url + "&" + paramName +"=" + data;
		}
	} else {
		alert("请选择要删除的数据！");
	}
}
function openPage(url){
	window.open(url,"查看详细信息","width=600;height=400;scrollable=yes");
}
function closePage(){
	window.close();
}
function changeCode(obj){
	obj.src = "pages/image.jsp?tm=" + Math.random();
}
function preview(file){
	var preDiv = document.getElementById("preview");
	if(file.files && file.files[0]){
		var reader = new FileReader();
		reader.onload = function(evt){
			preDiv.innerHTML = '<img src="'+evt.target.result+'"/>';
		}
		reader.readAsDataURL(file.files[0]);
	}else{
		preDiv.innerHTML = '<div class="img" syle="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\''+file.value+'\'"></div>';
	}
}