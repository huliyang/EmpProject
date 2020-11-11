package cn.hly.test;

import cn.hly.dbc.DatabaseConnection;

public class Test {
	public static void main(String[] args) {
		DatabaseConnection dbc = new DatabaseConnection();
		System.out.println(dbc.getConnection());
	}
}
