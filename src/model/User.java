package model;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import util.DBUtil;

//��ɺ��û���صĹ��ܣ�ҵ���߼���
//��¼��ע�ᣬ��ȡ���޸���Ϣ��ɾ���ȣ����ܣ�
public class User {

	private DBUtil db;

	public User() {
		db = new DBUtil();
	}

	// ��¼
	public String login(String un, String pw) {
		String r = "-1"; // -1�����¼ʧ�ܣ�����r�д���ident��ֵ
		String sql = "select * from user where userName=? and passWord=?";
		String[] params = new String[] { un, pw };
		Map<String, String> u = db.getMap(sql, params);
		if (u != null) {
			r = u.get("ident");
		}
		return r;
	}

	// ע��
	public int register(String un, String pw, String nn) {
		String sql = "insert into user values(null,?,?,?,0)";
		String[] params = new String[] { un, pw, nn };
		return db.update(sql, params);
	}

	// ��ѯ�û����Ƿ����
	public Map<String, String> SUN(String userName) {
		String sql = "select count(*) cc from user where userName= ? ";
		String[] params = new String[] { userName };
		return db.getMap(sql, params);
	}

	// ��ѯ�ǳ��Ƿ����
	public Map<String, String> SNN(String ninkname) {
		String sql = "select count(*) cc from user where ninkname= ? ";
		String[] params = new String[] { ninkname };
		return db.getMap(sql, params);
	}

	// �����û�������ǳ�
	public String getNinkName(String userName) {
		String sql = "select ninkname from user where userName=? ";
		String[] params = new String[] { userName };
		return db.getMap(sql, params).get("ninkname");
	}

	// �����û�����ȡ�û���Ϣ
	public Map<String, String> getUsers(String un) {
		String sql = "select * from user where userName= ? ";
		String[] params = new String[] { un };
		return db.getMap(sql, params);
	}

	// �޸�����
	public int upUser(String un, String npw) {
		// TODO Auto-generated method stub
		String sql = "update user set passWord = ? where userName=? ";
		String[] params = new String[] { npw, un };
		return db.update(sql, params);
	}

	// ��ȡ�û���Ϣ
	public List<Map<String, String>> showwUser() {
		String sql = "select * from user order by id desc ";
		return db.getList(sql);
	}

	// ɾ���û�
	public int userDel(String id) {
		// TODO Auto-generated method stub
		String sql = "delete from user where id=? ";
		return db.update(sql, new String[] { id });
	}

}
