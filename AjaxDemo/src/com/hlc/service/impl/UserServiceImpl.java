package com.hlc.service.impl;

import com.hlc.dao.UserDao;
import com.hlc.dao.impl.UserDaoImpl;
import com.hlc.ov.User;
import com.hlc.service.UserService;

public class UserServiceImpl implements UserService {
	// 获取dao层对象
	UserDao ud = new UserDaoImpl();

	public User getUserInfoService(String name) {
		User u = ud.getUserInfoDao(name);
		return u;
	}

}
