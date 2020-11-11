package cn.hly.factory;

import java.sql.Connection;

import cn.hly.dao.IDeptDAO;
import cn.hly.dao.IEmpDAO;
import cn.hly.dao.impl.DeptDAOImpl;
import cn.hly.dao.impl.EmpDAOImpl;

public class DAOFactory {
	public static IDeptDAO getIDeptDAOInstance(Connection conn) {
		return new DeptDAOImpl(conn);
	}

	public static IEmpDAO getIEmpDAOInstance(Connection conn) {
		return new EmpDAOImpl(conn);
	}
}
