package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;

public class WebData {
	private DBUtil db;

	public WebData() {
		db = new DBUtil();
	}
	// 读取网站信息
		public List<Map<String, String>> showWeb(){
			String sql = "select * from webData ";
			return db.getList(sql);
		}
		// 倒叙读取网站信息
		public List<Map<String, String>> showWeb2(){
			String sql = "select * from webData  order by id desc ";
			return db.getList(sql);
		}
	    //插入网站
		public int putWebs(String webName,String webAuthor,String webPs,String webUrl,String webIcon){

			String sql = "insert into webData values(null,?,?,?,?,?)"; 
			String[]params = new String[]{webName,webAuthor,webPs,webUrl,webIcon};		
			return db.update(sql,params);
		}
		
		// 删除网站
		public int webDel(String id) {
			// TODO Auto-generated method stub
			String sql = "delete from webData where id= ? ";
			return db.update(sql, new String[] { id });
		}
		// 根据id读取网站信息
		public Map<String, String> getWebByid(String id) {
			String sql = "select * from webData where id=?";
			String[] params = new String[] { id };
			return db.getMap(sql, params);

		}
         //更新网站信息
		public int editWeb(String webName, String webAuthor, String webPs, String webUrl, String webIcon,String id) {
			// TODO Auto-generated method stub
		     	String sql = "update webData set webName=?, webAuthor=?, webPs=?, webUrl=?, webIcon=? where id=?";
				String[] params = new String[] { webName,webAuthor,webPs,webUrl,webIcon,id};
			return db.update(sql, params);
		}
		

}
