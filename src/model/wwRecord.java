package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;

public class wwRecord {
	private DBUtil db;

	public wwRecord() {
		db = new DBUtil();
	}

	// ��ȡ������Ϣ
	public List<Map<String, String>> showwR() {
		String sql = "select * from wwRecord order by id desc limit 0 ,8 ";
		return db.getList(sql);
	}

	// ��ȡ������Ϣ
	public List<Map<String, String>> showwRR() {
		String sql = "select * from wwRecord order by id desc";
		return db.getList(sql);
	}

	// ����������Ϣ
	public int putRecord(String wwNN, String wwName, String wwAuthor, String wwPs, String wwBz) {
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		String sql = "insert into wwrecord values(null,?,?,?,?,?,?,'δ��','info')";
		String[] params = new String[] { wwNN, wwName, wwAuthor, wwPs, wwBz, time };
		return db.update(sql, params);
	}

	// ͨ������
	public int biu_Yes(String id) {
		// TODO Auto-generated method stub
		String sql = "update wwrecord set wwState = 'ͨ��', wwColor = 'success'  where id=? ";
		String[] params = new String[] { id };
		return db.update(sql, params);
	}
	// ��������
		public int biu_No(String id) {
			// TODO Auto-generated method stub
			String sql = "update wwrecord set wwState = 'δͨ��', wwColor = 'warning'  where id=? ";
			String[] params = new String[] { id };
			return db.update(sql, params);
		}
		// ɾ������
		public int biu_Del(String id) {
			// TODO Auto-generated method stub
			String sql = "delete from wwrecord where id=? ";
			return db.update(sql, new String[]{id});
		}



}
