package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;

import com.model.ManagerForm;
import com.model.VipForm;

import com.tools.ConnDB;

public class ManagerDAO2 {
	private ConnDB conn;

	public ManagerDAO2() {
		conn = new ConnDB();
	}
	//验证管理员身份的方法，返回为1表示登录成功，否则表示登录失败
	public int login(VipForm v){
        int flag = 0;
        String sql = "SELECT * FROM tb_vip where name='" +
                     v.getName()+ "'";
        ResultSet rs = conn.executeQuery(sql);
        try {
            if (rs.next()) {
            	System.out.println("1111");
                String pwd = v.getPwd();
                if (pwd.equals(rs.getString(3))) {
                    flag = 1;
                    rs.last();
                    int rowSum = rs.getRow();
                    rs.first();
                    if (rowSum != 1) {
                        flag = 0;
                        System.out.print("获取的row的值：" + sql + rowSum);
                    }
                } else {
                    flag = 0;
                }
            }else{
                flag = 0;
            }
        } catch (SQLException ex) {
            flag = 0;
        }
        return flag;
	}
	public int register(VipForm v) throws SQLException{
        int flag = 0;
        String sql = "INSERT INTO  tb_vip  (name,pwd) values('"+
                     v.getName() + "','"+v.getPwd()+"')";
        int rs = conn.executeUpdate(sql);
        if (rs!=0) {		   
		        flag = 1;
	       
		    } else {
		        flag = 0;
		    }
        return flag;
	}
	public List<VipForm> getAll()
	{
		 String sql = "SELECT * FROM tb_vip";
		 ResultSet rs = conn.executeQuery(sql);
		 ArrayList<VipForm> list = new ArrayList<VipForm>();
	        try {
	            while(rs.next()) {
	            	VipForm vip = new VipForm();
	            	vip.setId(Integer.parseInt(rs.getString("id")));
	            	vip.setName(rs.getString("name"));
	            	vip.setPwd(rs.getString("pwd"));
	                 
	                list.add(vip);
	                }
		
		return list;
	}catch (Exception e) {
		// TODO: handle exception
		throw new RuntimeException(e);
	}
}
	public void delete(int id)
	{
		
		 String sql = "delete  FROM tb_vip where id="+id;
		 
	        try {
	        	
	        	conn.executeUpdate(sql);
				           
				}catch (Exception e) {
					// TODO: handle exception
					throw new RuntimeException(e);
				}
		
	}
}
