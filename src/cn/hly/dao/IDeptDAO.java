package cn.hly.dao;

import java.util.List;

import cn.hly.vo.Dept;

public interface IDeptDAO extends IDAO<Integer, Dept> {
	/**
	 * 实现全部部门完整信息的查询操作，包括:<br>
	 * <li>基本信息：deptno,dname,loc
	 * <li>部门统计信息：人数、平均工资、最高工资、最低工资、总工资
	 * @return 以List集合的形式返回，没有数据集合长度为0
	 * @throws Exception
	 */
	public List<Dept> findAllByStat() throws Exception;
	/**
	 * 查询单个部门的完整信息
	 * <li>基本信息：deptno,dname,loc
	 * <li>部门统计信息：人数、平均工资、最高工资、最低工资、总工资
	 * @param id 部门编号
	 * @return 以Dept对象的形式返回查询到的信息，否则返回null
	 * @throws Exception
	 */
	public Dept findByIdDetails(Integer id) throws Exception;
	
}
