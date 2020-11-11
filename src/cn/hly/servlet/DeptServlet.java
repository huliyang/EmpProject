package cn.hly.servlet;

import java.io.File;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import cn.hly.factory.ServiceFactory;
import cn.hly.util.servlet.DispatcherServlet;
import cn.hly.vo.Dept;

@SuppressWarnings("serial")
public class DeptServlet extends DispatcherServlet {

	public String insert() {
		Dept vo = new Dept();
		vo.setDeptno(Integer.parseInt(super.request.getParameter("deptno")));
		vo.setDname(super.request.getParameter("dname"));
		vo.setLoc(super.request.getParameter("loc"));
		String msg = super.getMsg("insert.failure.msg");
		try {
			if(ServiceFactory.getIDeptServiceInstance().insert(vo)){
				msg = super.getMsg("insert.success.msg");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.request.setAttribute("msg", msg); //forward.jsp页面进行信息提示
		super.request.setAttribute("url", "/pages/back/admin/dept/dept_insert.jsp");
		return "/pages/forward.jsp";
	}

	public String list() {
		try {
			super.request.setAttribute("allDepts", ServiceFactory.getIDeptServiceInstance().list());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/dept/dept_list.jsp";
	}

	public String updatePre() {
		//接收地址重写传递而来的部门编号
		int deptno = Integer.parseInt(super.request.getParameter("deptno"));
		//查询已有的部门信息
		try {
			super.request.setAttribute("dept", ServiceFactory.getIDeptServiceInstance().updatePre(deptno));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/dept/dept_update.jsp";
	}

	public String update() {
		Dept vo = new Dept();
		vo.setDeptno(Integer.parseInt(super.request.getParameter("deptno")));
		vo.setDname(super.request.getParameter("dname"));
		vo.setLoc(super.request.getParameter("loc"));
		String msg = "部门信息修改失败！";
		try {
			if(ServiceFactory.getIDeptServiceInstance().update(vo)){
				msg = "部门信息修改成功！";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.request.setAttribute("msg", msg); //forward.jsp页面进行信息提示
		super.request.setAttribute("url", "/pages/back/admin/dept/DeptServlet/list");
		return "/pages/forward.jsp";
	}

	@SuppressWarnings("unchecked")
	public String delete() {
		String deptno = super.request.getParameter("deptno"); // 数据之间使用“|”分割
		String msg = "部门信息删除失败！";
		if (!(deptno == null || "".equals(deptno))) {
			String result[] = deptno.split("\\|");
			Set<Integer> ids = new HashSet<Integer>();
			for (int i = 0; i < result.length; i++) {
				ids.add(Integer.parseInt(result[i]));
			}
			Map<String, Object> map = null;
			try {
				map = ServiceFactory.getIDeptServiceInstance().delete(ids);
				boolean flag = (Boolean) map.get("flag");
				if (flag) {
					msg = "部门信息删除成功！";
					Set<String> photos = (Set<String>) map.get("allPhotos");
					Iterator<String> iter = photos.iterator();
					while (iter.hasNext()) {
						String photo = iter.next();
						if (!"nophoto.jpg".equals(photo)) {
							String filePath = getServletContext().getRealPath("/upload/") + photo;
							File file = new File(filePath);
							if (file.exists()) {
								file.delete();
							}
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		super.request.setAttribute("msg", msg);
		super.request.setAttribute("url", "/pages/back/admin/dept/DeptServlet/list");
		return "/pages/forward.jsp";
	}

	public String listDetails() {
		try {
			super.request.setAttribute("allDepts", ServiceFactory.getIDeptServiceInstance().listDetails());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/dept/dept_list_details.jsp";
	}

	public void checkDeptno() {
		String deptno = super.request.getParameter("deptno");
		try {
			if(deptno == null || "".equals(deptno)) {
				super.response.getWriter().print(false);
			} else {
				super.response.getWriter().print(ServiceFactory.getIDeptServiceInstance().checkDeptno(Integer.parseInt(deptno)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String show() {
		int deptno = Integer.parseInt(super.request.getParameter("deptno"));
		try {
			super.request.setAttribute("dept", ServiceFactory.getIDeptServiceInstance().show(deptno));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "/pages/back/admin/dept/show.jsp";
	}
	
	@Override
	public String getTitle() {
		return "部门";
	}

}
