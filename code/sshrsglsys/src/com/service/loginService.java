package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.SysuserDAO;
import com.model.Sysuser;

public class loginService
{
	private SysuserDAO sysuserDAO;
	public SysuserDAO getSysuserDAO() {
		return sysuserDAO;
	}

	public void setSysuserDAO(SysuserDAO sysuserDAO) {
		this.sysuserDAO = sysuserDAO;
	}

	public String login(String uname,String upass)
	{
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String result="no";
		

			String sql="from Sysuser where uname=? and upass=?";
     

			Object[] con={uname,upass};
			List userList=sysuserDAO.getHibernateTemplate().find(sql,con);
			if(userList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 Sysuser user=(Sysuser)userList.get(0);
	             session.setAttribute("user", user);
	             result="yes";
			}
		
		
		return result;
	}

    public String userPwEdit(String upass)
    {
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		Sysuser user=(Sysuser)session.getAttribute("user");
		user.setUpass(upass);
		sysuserDAO.getHibernateTemplate().update(user);
		session.setAttribute("user", user);
		return "yes";
    }
	

}
