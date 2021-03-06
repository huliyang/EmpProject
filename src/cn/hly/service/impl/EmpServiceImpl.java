package cn.hly.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.hly.dbc.DatabaseConnection;
import cn.hly.factory.DAOFactory;
import cn.hly.service.IEmpService;
import cn.hly.vo.Emp;

public class EmpServiceImpl implements IEmpService {
	private DatabaseConnection dbc = new DatabaseConnection();

	@Override
	public boolean insert(Emp vo) throws Exception {
		try {
			if (DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findById(vo.getEmpno()) == null) {
				return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).doCreate(vo);
			} else {
				return false;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public boolean update(Emp vo) throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).doUpdate(vo);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public boolean delete(Set<Integer> ids) throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).doRemoveBatch(ids);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public List<Emp> list() throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findAll();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public Map<String, Object> list(int currentPage, int lineSize, String column, String keyWord) throws Exception {
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("allEmps", DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findAllSplit(currentPage, lineSize, column, keyWord));
			map.put("empCount", DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).getAllCount(column, keyWord));
			return map;
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public Emp show(int id) throws Exception {
		try {
			return DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findByIdDetails(id);
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
	}

	@Override
	public Map<String, Object> insertPre() throws Exception {
		try {
			Map<String,Object> map = new HashMap<>();
			map.put("allEmps", DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findAll());
			map.put("allDepts", DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).findAll());
			return map;
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
	}

	@Override
	public Map<String, Object> updatePre(int id) throws Exception {
		try {
			Map<String,Object> map = new HashMap<>();
			map.put("allEmps", DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findAll());
			map.put("emp", DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findByIdDetails(id));
			map.put("allDepts", DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).findAll());
			return map;
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public Map<String, Object> listDetails(int currentPage, int lineSize, String column, String keyWord)
			throws Exception {
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("allEmps", DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findAllSplitDetails(currentPage, lineSize, column, keyWord));
			map.put("empCount", DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).getAllCount(column, keyWord));
			return map;
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
	}

}
