package cn.hly.factory;

import cn.hly.service.IDeptService;
import cn.hly.service.IEmpService;
import cn.hly.service.impl.DeptServiceImpl;
import cn.hly.service.impl.EmpServiceImpl;

public class ServiceFactory {
	public static IDeptService getIDeptServiceInstance() {
		return new DeptServiceImpl();
	}

	public static IEmpService getIEmpServiceInstance() {
		return new EmpServiceImpl();
	}
}
