package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.model.ManagerForm;
import com.model.SongForm;
import com.model.VipForm;

import com.dao.ManagerDAO;
import com.dao.ManagerDAO2;
import com.tools.MyPagination;

public class ManagerAction extends Action {
	private ManagerDAO2 managerDAO2 = null;
	private MyPagination<VipForm> pagination=null;

	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	
	public ManagerAction() {
		this.managerDAO2 = new ManagerDAO2();
	
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		
		if ("Vdelete".equals(action)) {
			return Vdelete(mapping, form, request, response); // 管理员登录
		}else if ("Vlist".equals(action)) {
			return Vlist(mapping, form, request, response); // 管理员登录
		}else if ("Vlogin".equals(action)) {
			return Vlogin(mapping, form, request, response); // 管理员登录
		}else if ("Vregister".equals(action)) {
			return Vregister(mapping, form, request, response); // 管理员登录
		}else if ("check".equals(action)) {
			return check(mapping, form, request, response); // 管理员登录
		} {
			request.setAttribute("error", "操作失败！");
			return mapping.findForward("error");
		}
	}
private ActionForward Vdelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	   
	 VipForm vipForm = (VipForm) form;
	 
	 System.err.println("delete");
	 int id = vipForm.getId();
	 managerDAO2.delete(id);
	 System.err.println("delete");
	 
	 
	 return mapping.findForward("vip_del");
	}

private ActionForward Vlist(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
	List<VipForm> list = managerDAO2.getAll();
	
	
	String strPage = (String) request.getParameter("Page");

	int Page = 1;
	
	if (strPage == null) {
		pagination = new MyPagination<VipForm>();		
		int pagesize = 5; // 指定每页显示的记录数
		list = pagination.getInitPage(list, Page, pagesize); // 初始化分页信息
		request.getSession().setAttribute("pagination", pagination);
	} else {
		pagination = (MyPagination<VipForm>) request.getSession().getAttribute(
				"pagination");
		Page = pagination.getPage(strPage);
		list = pagination.getAppointPage(Page); // 获取指定页数据
	}
	
	request.setAttribute("vips",list);// 保存当前页的歌曲信息	
	request.setAttribute("Page", Page); // 保存的当前页码
	return mapping.findForward("vip_list");
	}

private ActionForward check(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	try {
		PrintWriter writer = response.getWriter();
		
		String format = (String) request.getSession().getAttribute("CHECKNUM");
		String uri="${pageContext.request.contextPath}/images/MsgError.gif";
		if(checkcode.equals(format))
		{
			uri="${pageContext.request.contextPath}/images/MsgSent.gif";
		}
		writer.write(uri);
		writer.flush();
		writer.close();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return null;
	}


public ActionForward Vlogin(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response){
       VipForm vipForm = (VipForm) form;
        int ret = managerDAO2.login(vipForm);
        System.out.print("验证结果ret的值:" + ret);
        if (ret == 1) {
        	
            HttpSession session=request.getSession();
            session.setAttribute("vipname",vipForm.getName());
            return mapping.findForward("viplogin");
        } else {
        	System.out.println("3333");
            request.setAttribute("error","您输入的用户名称或密码错误！");
            return mapping.findForward("error");
	        }
	}
public ActionForward Vregister(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response){
       VipForm vipForm = (VipForm) form;
       System.out.println("111111");
       
       System.out.println(vipForm.getPwd()+"="+vipForm.getName());
        int ret;
		try {
			System.out.println("222222");
			ret = managerDAO2.register(vipForm);
			System.out.print("验证结果ret的值:" + ret);
	        if (ret == 1) {
	        	System.out.println("3333");
	            return mapping.findForward("vipregister");
	        } else {
	        	System.out.println("4444");
	            request.setAttribute("error","您输入的管理员名称或密码错误！");
	            return mapping.findForward("error");
		        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		throw new RuntimeException(e);
		}
        
	}
}
