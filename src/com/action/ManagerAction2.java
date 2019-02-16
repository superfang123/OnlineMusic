package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.ManagerDAO;
import com.dao.ManagerDAO2;
import com.model.ManagerForm;
import com.model.VipForm;

public class ManagerAction2  extends Action{

	
	

	private ManagerDAO managerDAO = null;

	
	
	public ManagerAction2() {
		
		this.managerDAO = new ManagerDAO();

	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		if ("login".equals(action)) {
			return login(mapping, form, request, response); // ����Ա��¼
		} 		 
		else {
			request.setAttribute("error", "����ʧ�ܣ�");
			return mapping.findForward("error");
		}
	}
public ActionForward login(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response){
       ManagerForm managerForm = (ManagerForm) form;
        int ret = managerDAO.login(managerForm);
        System.out.print("��֤���ret��ֵ:" + ret);
        if (ret == 1) {
            HttpSession session=request.getSession();
            session.setAttribute("manager",managerForm.getManager());
            return mapping.findForward("managerLoginok");
        } else {
            request.setAttribute("error","������Ĺ���Ա���ƻ��������");
            return mapping.findForward("error");
	        }
	}
}
