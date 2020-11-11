package cn.hly.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.hly.vo.Emp;

public interface IEmpService {
	public boolean insert(Emp vo) throws Exception;

	public boolean update(Emp vo) throws Exception;

	public boolean delete(Set<Integer> ids) throws Exception;

	public List<Emp> list() throws Exception;

	public Map<String, Object> list(int currentPage, int lineSize, String column, String keyWord) throws Exception;	
	/**
	 * 根据编号查看雇员信息
	 * @param id 雇员编号
	 * @return 以VO对象返回查询到的数据，否则返回null
	 * @throws Exception
	 */
	public Emp show(int id) throws Exception;
	/**
	 * 增加雇员前的准备操作，因为增加雇员前需要查询出所有的雇员与部门信息，来设置关系
	 * @return 返回两组信息：全部的雇员信息，全部的部门信息<br>
	 * <li>key=allEmps,value=IEmpDAO.findAll()查询出所有的雇员
	 * @throws Exception
	 */
	public Map<String,Object> insertPre() throws Exception;
	/**
	 * 修改雇员信息前的准备操作，因为增加雇员前需要查询出所有的雇员与部门信息，来设置关系
	 * @return 返回三组信息：<br>
	 * <li>key=allEmps,value=IEmpDAO.findAll()查询出所有的雇员
	 * <li>key=emp,value=IEmpDAO.findByIdDetails()查询雇员完整信息
	 * @throws Exception
	 */
	public Map<String,Object> updatePre(int id) throws Exception;
	/**
	 * 使用详细列表的形式列出雇员的完整信息，要执行如下操作:<br>
	 * <li>调用IEmpDAO.findAllSplitDetails()方法详细雇员信息
	 * <li>调用IEmpDAO.getAllCount()获得雇员人数，主要用于分页操作
	 * @param currentPage
	 * @param lineSize
	 * @param column
	 * @param keyWord
	 * @return 以Map结合的形式返回:
	 * <li>key=allEmps,value=IEmpDAO.findAllSplitDetails()，分页的详细信息
	 * <li>key=empCount,value = IEmpDAO.getAllCount(),获得全部记录数
	 * @throws Exception
	 */
	public Map<String,Object> listDetails(int currentPage,int lineSize,String column,String keyWord) throws Exception;

}
