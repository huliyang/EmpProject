package cn.hly.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.hly.dbc.DatabaseConnection;
import cn.hly.factory.DAOFactory;
import cn.hly.service.IDeptService;
import cn.hly.vo.Dept;

public class DeptServiceImpl implements IDeptService {
	private DatabaseConnection dbc = new DatabaseConnection();
	@Override
	public boolean insert(Dept vo) throws Exception {
		try {
			if(DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).findById(vo.getDeptno()) == null) {
				return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).doCreate(vo);
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
	public boolean update(Dept vo) throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).doUpdate(vo);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public Map<String,Object> delete(Set<Integer> ids) throws Exception {
		try {
			Map<String,Object> map = new HashMap<>();
			//查询出该部门下所有雇员的照片
			Set<String> photos = DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findAllPhotoByDeptno(ids);
			//1.取消事务的自动提交
			this.dbc.getConnection().setAutoCommit(false);
			boolean flag = false;//操作是否成功的标记
			//2.删除所有雇员
			Iterator<Integer> iter = ids.iterator();//取出每个要删除的部门编号
			while(iter.hasNext()) {
				//根据部门编号删除该部门下的所有雇员信息
				DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).doRemoveByDeptno(iter.next());
			}
			//3.删除部门信息
			flag = DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).doRemoveBatch(ids);
			map.put("flag", flag);
			if(flag) { //表示数据正常删除
				map.put("allPhotos", photos);
			}
			this.dbc.getConnection().commit();
			return map;
		} catch (Exception e) {
			this.dbc.getConnection().rollback();
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public List<Dept> list() throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).findAll();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public Dept updatePre(Integer id) throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public List<Dept> listDetails() throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).findAllByStat();
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
	}

	@Override
	public Dept show(Integer id,int currentPage,int lineSize,String column,String keyWord) throws Exception {
		try {
			Dept dept = DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).findByIdDetails(id);
			if(dept != null) {
				dept.setEmps(DAOFactory.getIEmpDAOInstance(this.dbc.getConnection()).findAllByDeptno(id, currentPage, lineSize, column, keyWord));
			}
			return dept;
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
	}

	@Override
	public boolean checkDeptno(Integer deptno) throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).findById(deptno) == null;
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
	}

	@Override
	public Dept show(Integer deptno) throws Exception {
		try {
			return DAOFactory.getIDeptDAOInstance(this.dbc.getConnection()).findById(deptno);
		}catch(Exception e) {
			throw e;
		}finally {
			this.dbc.close();
		}
	}

}
