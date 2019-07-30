package com.hlc.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hlc.dao.UserDao;
import com.hlc.ov.User;

public class UserDaoImpl implements UserDao {

	public User getUserInfoDao(String name) {
		User u =null;
		//声明对象
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs= null;
		//加载驱动
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// 获取连接对象
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login_in?useUnicode=true&characterEncoding=utf-8", "root", "123456");
			// 创建sql命令
			String sql = "select * from hero where uname=?";

			// 创建sql命令对象
			System.out.println("UserDaoimpl的name"+name);
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			//执行sql
			rs= ps.executeQuery();
			while(rs.next()){
				u=new User();
				u.setUname(rs.getString("uname"));
				u.setUid(rs.getInt("uid"));
				u.setPrice(rs.getDouble("price"));
				u.setPostion(rs.getString("postion"));
				u.setSkill(rs.getString("skill"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return u;
	}

}
