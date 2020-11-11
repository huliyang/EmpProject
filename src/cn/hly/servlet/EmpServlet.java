package cn.hly.servlet;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import com.jspsmart.upload.SmartUpload;

import cn.hly.factory.ServiceFactory;
import cn.hly.util.servlet.DispatcherServlet;
import cn.hly.vo.Dept;
import cn.hly.vo.Emp;

@SuppressWarnings("serial")
public class EmpServlet extends DispatcherServlet {
	public String insertPre(){
		try {
			Map<String,Object> map = ServiceFactory.getIEmpServiceInstance().insertPre();
			request.setAttribute("allEmps", map.get("allEmps"));;
			request.setAttribute("allDepts", map.get("allDepts"));;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/emp/emp_insert.jsp";
	}
	public String insert(){
		SmartUpload smart = new SmartUpload();
		try {
			smart.initialize(super.getServletConfig(), request, response);
			smart.upload();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		Emp vo = new Emp();
		vo.setEmpno(Integer.parseInt(smart.getRequest().getParameter("empno")));
		vo.setEname(smart.getRequest().getParameter("ename"));
		vo.setJob(smart.getRequest().getParameter("job"));
		try {
			vo.setHiredate(new SimpleDateFormat("yyyy-MM-dd").parse(smart.getRequest().getParameter("hiredate")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vo.setSal(Double.parseDouble(smart.getRequest().getParameter("sal")));
		vo.setComm(Double.parseDouble(smart.getRequest().getParameter("comm")));
		int tempMgr = Integer.parseInt(smart.getRequest().getParameter("mgr"));
		if(tempMgr != 0){ //有领导
			Emp mgr = new Emp();
			mgr.setEmpno(tempMgr);
			vo.setMgr(mgr);
		}
		int tempDeptno = Integer.parseInt(smart.getRequest().getParameter("deptno"));
		if(tempDeptno != 0){ //有部门
			Dept dept = new Dept();
			dept.setDeptno(tempDeptno);
			vo.setDept(dept);
		}
		String fileName = "nophoto.jpg";
		if(smart.getFiles().getFile(0).getSize() > 0){ //有文件上传
			if(smart.getFiles().getFile(0).getContentType().contains("image")){ //确保上传的文件是图片
				fileName = UUID.randomUUID() + "." + smart.getFiles().getFile(0).getFileExt();
			}
		}
		vo.setPhoto(fileName);
		vo.setNote(smart.getRequest().getParameter("note"));
		String msg = "雇员信息增加失败！";
		try {
			if(ServiceFactory.getIEmpServiceInstance().insert(vo)){
				if(smart.getFiles().getFile(0).getSize() > 0){
					if(smart.getFiles().getFile(0).getContentType().contains("image")){
						String filePath = getServletContext().getRealPath("/upload/") + fileName;
						smart.getFiles().getFile(0).saveAs(filePath);
					}
				}
				msg = "雇员信息增加成功！";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("msg", msg);
		request.setAttribute("url", "/pages/back/admin/emp/EmpServlet/insertPre");
		return "/pages/forward.jsp";
	}
	public String list(){
		try {
			super.request.setAttribute("allEmps", ServiceFactory.getIEmpServiceInstance().list());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/emp/emp_list.jsp";
	}
	public String listSplit(){
		String url = "/pages/back/admin/emp/EmpServlet/listSplit";
		int currentPage = 1;
		int lineSize = 5;
		String keyWord = "";
		String column = "ename";//定义默认的查询列
		String columnData = "雇员编号:empno|雇员姓名:ename|雇员职位:job";
		//负责接收数据
		try {
			//如果接收不到cp参数的值，那么就出现NumberFormatException
			currentPage = Integer.parseInt(request.getParameter("cp"));
		} catch (Exception e) {
		}
		try {
			lineSize = Integer.parseInt(request.getParameter("ls"));
		} catch (Exception e) {
		}
		if (request.getParameter("kw") != null) {
			keyWord = request.getParameter("kw");
		}
		if (request.getParameter("col") != null) {
			column = request.getParameter("col");
		}
		try {
			Map<String,Object> map = ServiceFactory.getIEmpServiceInstance().list(currentPage, lineSize, column, keyWord);
			request.setAttribute("allEmps", map.get("allEmps"));
			request.setAttribute("allRecorders", map.get("empCount"));
		} catch (Exception e) {
			e.printStackTrace();
		}		
		request.setAttribute("columnData",columnData);
		request.setAttribute("column",column);
		request.setAttribute("keyWord",keyWord);
		request.setAttribute("currentPage",currentPage);
		request.setAttribute("lineSize",lineSize);
		request.setAttribute("url",url);
		return "/pages/back/admin/emp/emp_list_split.jsp";
	}
	public String listDetails(){
		String url = "/pages/back/admin/emp/EmpServlet/listDetails";
		int currentPage = 1;
		int lineSize = 5;
		String keyWord = "";
		String column = "ename";//定义默认的查询列
		String columnData = "雇员编号:empno|雇员姓名:ename|雇员职位:job";
		try {
			//如果接收不到cp参数的值，那么就出现NumberFormatException
			currentPage = Integer.parseInt(request.getParameter("cp"));
		} catch (Exception e) {
		}
		try {
			lineSize = Integer.parseInt(request.getParameter("ls"));
		} catch (Exception e) {
		}
		if (request.getParameter("kw") != null) {
			keyWord = request.getParameter("kw");
		}
		if (request.getParameter("col") != null) {
			column = request.getParameter("col");
		}
		try {
			Map<String,Object> map = ServiceFactory.getIEmpServiceInstance().listDetails(currentPage, lineSize, column, keyWord);
			request.setAttribute("allEmps", map.get("allEmps"));
			request.setAttribute("allRecorders", map.get("empCount"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("columnData",columnData);
		request.setAttribute("column",column);
		request.setAttribute("keyWord",keyWord);
		request.setAttribute("currentPage",currentPage);
		request.setAttribute("lineSize",lineSize);
		request.setAttribute("url",url);
		return "/pages/back/admin/emp/emp_list_details.jsp";
	}
	public String updatePre(){
		int empno = Integer.parseInt(request.getParameter("empno"));
		try {
			Map<String, Object> map = ServiceFactory.getIEmpServiceInstance().updatePre(empno);
			request.setAttribute("emp", map.get("emp"));
			request.setAttribute("allEmps", map.get("allEmps"));
			request.setAttribute("allDepts", map.get("allDepts"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/emp/emp_update.jsp";
	}
	public String update(){
		SmartUpload smart = new SmartUpload();
		try {
			smart.initialize(super.getServletConfig(), request, response);
			smart.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Emp vo = new Emp();
		vo.setEmpno(Integer.parseInt(smart.getRequest().getParameter("empno")));
		vo.setEname(smart.getRequest().getParameter("ename"));
		vo.setJob(smart.getRequest().getParameter("job"));
		try {
			vo.setHiredate(new SimpleDateFormat("yyyy-MM-dd").parse(smart.getRequest().getParameter("hiredate")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vo.setSal(Double.parseDouble(smart.getRequest().getParameter("sal")));
		vo.setComm(Double.parseDouble(smart.getRequest().getParameter("comm")));
		int tempMgr = Integer.parseInt(smart.getRequest().getParameter("mgr"));
		if(tempMgr != 0){ //有领导
			Emp mgr = new Emp();
			mgr.setEmpno(tempMgr);
			vo.setMgr(mgr);
		}
		int tempDeptno = Integer.parseInt(smart.getRequest().getParameter("deptno"));
		if(tempDeptno != 0){ //有部门
			Dept dept = new Dept();
			dept.setDeptno(tempDeptno);
			vo.setDept(dept);
		}
		vo.setNote(smart.getRequest().getParameter("note"));
		//原始的图片名称
		String fileName = smart.getRequest().getParameter("oldpic");
		try {
			if(smart.getFiles().getSize() > 0){
				if(smart.getFiles().getFile(0).getContentType().contains("image")){
					if("nophoto.jpg".equals(fileName)){ //原来没有图片
						fileName = UUID.randomUUID() + "." + smart.getFiles().getFile(0).getFileExt();
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		vo.setPhoto(fileName);
		String msg = "雇员信息修改失败！";
		try {
			if(ServiceFactory.getIEmpServiceInstance().update(vo)){
				if(smart.getFiles().getFile(0).getContentType().contains("image")){
					String filePath = getServletContext().getRealPath("/upload/") + fileName;
					smart.getFiles().getFile(0).saveAs(filePath);
				}
				msg = "雇员信息修改成功！";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		StringBuffer buf = new StringBuffer();
		buf.append(smart.getRequest().getParameter("backurl")).append("?");
		buf.append("cp=").append(smart.getRequest().getParameter("cp")).append("&");
		buf.append("ls=").append(smart.getRequest().getParameter("ls")).append("&");
		buf.append("col=").append(smart.getRequest().getParameter("col")).append("&");
		buf.append("kw=").append(smart.getRequest().getParameter("kw")).append("&");
		buf.append("deptno=").append(smart.getRequest().getParameter("backdeptno"));
		request.setAttribute("msg", msg);
		request.setAttribute("url", buf.toString());
		return "/pages/forward.jsp";
	}
	public String delete(){
		String empno = request.getParameter("empno"); //数据之间使用“|”分割
		String msg = "雇员信息删除失败！";
		Set<String> photos = new HashSet<>();
		if(!(empno == null || "".equals(empno))){
			String result[] = empno.split("\\|");
			Set<Integer> ids = new HashSet<Integer>();
			for(int i=0;i<result.length;i++){
				String[] temp = result[i].split(":");
				ids.add(Integer.parseInt(temp[0]));
				if(!"nophoto.jpg".equals(temp[1])){
					photos.add(temp[1]);
				}
			}
		try {
			if(ServiceFactory.getIEmpServiceInstance().delete(ids)){
				Iterator<String> iter = photos.iterator();
				while(iter.hasNext()){
					String photo = iter.next();
					if(!"nophoto.jpg".equals(photo)){
						String filePath = getServletContext().getRealPath("/upload/") + photo;
						File file = new File(filePath);
						if(file.exists()){
							file.delete();
						}
					}
				}
				msg = "雇员信息删除成功！";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		StringBuffer buf = new StringBuffer();
		buf.append(request.getParameter("backurl")).append("?");
		buf.append("cp=").append(request.getParameter("cp")).append("&");
		buf.append("ls=").append(request.getParameter("ls")).append("&");
		buf.append("col=").append(request.getParameter("col")).append("&");
		buf.append("kw=").append(request.getParameter("kw")).append("&");
		buf.append("deptno=").append(request.getParameter("backdeptno"));
		request.setAttribute("msg", msg);
		request.setAttribute("url", buf.toString());
		return "/pages/forward.jsp";
	}
	public String show(){
		int empno = Integer.parseInt(request.getParameter("empno"));
		try {
			request.setAttribute("emp", ServiceFactory.getIEmpServiceInstance().show(empno));;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/emp/emp_show.jsp";
	}
	@Override
	public String getTitle() {
		return "";
	}
}

