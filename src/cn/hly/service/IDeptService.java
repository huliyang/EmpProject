package cn.hly.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.hly.vo.Dept;

public interface IDeptService {
	public boolean insert(Dept vo) throws Exception;

	public boolean update(Dept vo) throws Exception;

	/**
	 * 根据编号查看部门信息
	 * @param deptno 部门编号
	 * @return 以VO对象返回查询到的数据，否则返回null
	 * @throws Exception
	 */
	public Dept show (Integer deptno) throws Exception;
	
	/**
	 * <li>检查部门编号是否重复，由前端Ajax使用</li>
	 * <li>调用数据层的findById()方法</li>
	 * 
	 * @param deptno 部门编号
	 * @return 如果返回true表示该部门编号可以使用；返回false则表示该编号已经存在，不能使用
	 * @throws Exception
	 */
	public boolean checkDeptno(Integer deptno) throws Exception;

	/**
	 * 批量删除部门数据，此操作执行三个操作：
	 * <li>根据要删除的部门编号，找到对应的雇员照片，调用IEmpDAO中的findAllPhotoByDeptno()方法
	 * <li>首先删除部门的雇员数据：调用IEmpDAO接口中的doRemoveByDeptno()方法
	 * <li>删除部门数据：调用IEmpDAO接口中的doRemoveBatch()方法
	 * 
	 * @param ids 要删除的部门编号
	 * @return 返回操作成功或失败的标记，以及所有已删除的雇员照片，以Map集合返回，返回结果包含：<br>
	 *         <li>key = flag,value = 删除成功或失败的标记；
	 *         <li>key = allPhotos,value = 要删除部门的所有雇员的照片；
	 * @throws Exception
	 */
	public Map<String, Object> delete(Set<Integer> ids) throws Exception;

	public List<Dept> list() throws Exception;

	/**
	 * 数据更新前的查询操作，与之前的get方法类似
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Dept updatePre(Integer id) throws Exception;

	/**
	 * 列出所有部门的详细信息，调用的是IDeptDAO.findAllByStat()方法
	 * 
	 * @return 以List集合返回部门详细信息
	 * @throws Exception
	 */
	public List<Dept> listDetails() throws Exception;

	/**
	 * 查看一个部门完整信息，调用IDeptDAO.findByIdDetails()方法
	 * 
	 * @param id 部门编号
	 * @return 如果查询到部门信息以VO对象返回，否则返回null
	 * @throws Exception
	 */
	public Dept show(Integer id, int currentPage, int lineSize, String column, String keyWord) throws Exception;

}
