$(function(){
	checkboxSelectAll($("#selall"),$("input[id='deptno']"));
	validateInsertForm();
});

//增加部门信息的表单验证规则
function validateInsertForm(){
	$("#insertForm").validate({
		submitHandler : function(form){
			form.submit();
		},
		errorPlacement : function(error,element){
	           $("#" + element.attr("id") + "Msg").append(error);
	    },
	    errorClass : "text-danger",
		rules : {
			"deptno" : {
				required : true,
				digits : true,
				remote : {	//异步验证
					url : "pages/back/admin/dept/DeptServlet/checkDeptno", //提交路径
					type : "post",
					dataType : "text", //返回数据的类型
					data : { //要传递到Servlet的数据
						"deptno" : function(){
							return $("#deptno").val();
						},
					},
					dataFilter : function(data,type){ //Servlet的返回结果
						if(data.trim() == "true"){
							return true;
						} else {
							return false;
						}
					}
				},
				maxlength : 4
			},
			"dname" : {
				required : true
			},
			"loc" : {
				required : true
			}
		},
	});
}
