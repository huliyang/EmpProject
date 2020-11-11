package cn.hly.dao;

import java.util.List;
import java.util.Set;

import cn.hly.vo.Emp;

public interface IEmpDAO extends IDAO<Integer, Emp> {
	/**
	 * 根据部门编号删除所有的雇员信息
	 * 
	 * @param deptno 部门编号
	 * @throws Exception SQL执行异常
	 */
	public void doRemoveByDeptno(Integer deptno) throws Exception;

	/**
	 * 查询雇员的详细信息，包括雇员的领导信息(编号、姓名)，以及所在的部门信息
	 * 
	 * @param id 要查询的雇员编号
	 * @return 所有的数据以VO对象返回，如果没有则返回null
	 * @throws Exception SQL执行异常
	 */
	public Emp findByIdDetails(Integer id) throws Exception;

	/**
	 * 分页查询雇员的完整信息，包括雇员的领导信息(编号、姓名)，以及所在的部门信息
	 * 
	 * @param currentPage 当前所在的页
	 * @param lineSize    每页显示的数据行数
	 * @param column      要进行模糊查询的数据列
	 * @param keyWord     模糊查询的关键字
	 * @return 如果表中有数据，则所有的数据会封装为VO对象而后利用List集合返回，<br>
	 * @throws Exception SQL执行异常
	 */
	public List<Emp> findAllSplitDetails(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception;

	/**
	 * 根据部门编号查询出该部门中所有的雇员
	 * 
	 * @param deptno      部门编号
	 * @param currentPage 当前页
	 * @param lineSize    每页显示记录数
	 * @param column      模糊查询列
	 * @param keyWord     模糊查询关键字
	 * @return 返回一个部门中所有的雇员，如果某个部门没有雇员，则返回的集合长度为0
	 * @throws Exception
	 */
	public List<Emp> findAllByDeptno(Integer deptno, Integer currentPage, Integer lineSize, String column,
			String keyWord) throws Exception;

	/**
	 * 取得指定部门的所有雇员的照片
	 * 
	 * @param deptno 部门编号
	 * @return 返回雇员照片信息，使用Set集合避免重复照片
	 * @throws Exception
	 */
	public Set<String> findAllPhotoByDeptno(Set<Integer> deptno) throws Exception;

}
