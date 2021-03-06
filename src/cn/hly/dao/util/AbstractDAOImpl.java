package cn.hly.dao.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.Set;
/**
 * 完成数据删除操作的工具类
 * @author 胡立阳
 *
 */
public abstract class AbstractDAOImpl {
	protected Connection conn = null;

	public AbstractDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean removeHandle(Set<?> ids,String tableName,String idName) throws Exception {
		if(ids.size() == 0) {
			return false;
		}
		StringBuffer sql = new StringBuffer();
		sql.append("DELETE FROM ").append(tableName).append(" WHERE ").append(idName)
				.append(" IN(");
		Iterator<?> iter = ids.iterator();
		while (iter.hasNext()) {
			sql.append(iter.next()).append(",");
		}
		sql.delete(sql.length() - 1, sql.length()).append(")");
		PreparedStatement pstmt = this.conn.prepareStatement(sql.toString());
		return pstmt.executeUpdate() == ids.size();
	}

	public Integer conuntHandle(String tableName,String column,String keyWord) throws Exception{
		String sql = "SELECT COUNT(*) FROM "+ tableName +" WHERE "+ column + " LIKE ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + keyWord + "%");
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		} else {
			return 0;
		}
		
	}
}
