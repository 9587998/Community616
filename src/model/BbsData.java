package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import util.DBUtil;

public class BbsData {
	private DBUtil db;

	public BbsData() {
		db = new DBUtil();
	}
	// ��ȡ������Ϣ
		public List<Map<String, String>> showBbs(){
			String sql = "select * from bbsData order by id desc ";
			return db.getList(sql);
		}
		
		// ��ȡ������Ϣ������������
		public List<Map<String, String>> showBbs2(){
			String sql = "select * from bbsData order by id desc limit 0 ,3 ";
			return db.getList(sql);
		}
	    //��������
		public int putBbs(String nn,String bss){
			Date date=new Date();    
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String time=format.format(date);
			String sql = "insert into bbsdata values(null,?,?,?)"; 
			String[]params = new String[]{bss,nn,time};		
			return db.update(sql,params);
		}
	 //��ȡ��������
		public String getCount(){
			String sql = "select count(*) cc from bbsdata ";
			String aa = "";
			for(String cc:db.getMap(sql).values()){
				aa=cc;
			}	
			return aa;	
		}
		// ɾ������
		public int bbsDel(String id) {
			// TODO Auto-generated method stub
			String sql = "delete from bbsdata where id= ? ";
			return db.update(sql, new String[] { id });
		}

}
