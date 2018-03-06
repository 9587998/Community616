package model;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import util.DBUtil;

//完成和用户相关的功能（业务逻辑）
//登录，注册，读取，修改信息，删除等（功能）
public class User {

	private DBUtil db;

	public User() {
		db = new DBUtil();
	}

	// 登录
	public String login(String un, String pw) {
		String r = "-1"; // -1代表登录失败，否则r中储存ident的值
		String sql = "select * from user where userName=? and passWord=?";
		String[] params = new String[] { un, pw };
		Map<String, String> u = db.getMap(sql, params);
		if (u != null) {
			r = u.get("ident");
		}
		return r;
	}

	// 注册
	public int register(String un, String pw, String nn) {
		String sql = "insert into user values(null,?,?,?,0)";
		String[] params = new String[] { un, pw, nn };
		return db.update(sql, params);
	}

	// 查询用户名是否存在
	public Map<String, String> SUN(String userName) {
		String sql = "select count(*) cc from user where userName= ? ";
		String[] params = new String[] { userName };
		return db.getMap(sql, params);
	}

	// 查询昵称是否存在
	public Map<String, String> SNN(String ninkname) {
		String sql = "select count(*) cc from user where ninkname= ? ";
		String[] params = new String[] { ninkname };
		return db.getMap(sql, params);
	}

	// 根据用户名获得昵称
	public String getNinkName(String userName) {
		String sql = "select ninkname from user where userName=? ";
		String[] params = new String[] { userName };
		return db.getMap(sql, params).get("ninkname");
	}

	// 根据用户名读取用户信息
	public Map<String, String> getUsers(String un) {
		String sql = "select * from user where userName= ? ";
		String[] params = new String[] { un };
		return db.getMap(sql, params);
	}

	// 修改密码
	public int upUser(String un, String npw) {
		// TODO Auto-generated method stub
		String sql = "update user set passWord = ? where userName=? ";
		String[] params = new String[] { npw, un };
		return db.update(sql, params);
	}

	// 读取用户信息
	public List<Map<String, String>> showwUser() {
		String sql = "select * from user order by id desc ";
		return db.getList(sql);
	}

	// 删除用户
	public int userDel(String id) {
		// TODO Auto-generated method stub
		String sql = "delete from user where id=? ";
		return db.update(sql, new String[] { id });
	}

}
