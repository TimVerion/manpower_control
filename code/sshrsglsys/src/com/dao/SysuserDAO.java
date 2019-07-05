package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.model.Sysuser;

/**
 * Data access object (DAO) for domain model class Sysuser.
 * 
 * @see com.model.Sysuser
 * @author MyEclipse Persistence Tools
 */

public class SysuserDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(SysuserDAO.class);

	// property constants
	public static final String USER_NAME = "uname";

	public static final String USER_PW = "upass";

	protected void initDao() {
		// do nothing
	}

	public void save(Sysuser transientInstance) {
		log.debug("saving Sysuser instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Sysuser persistentInstance) {
		log.debug("deleting Sysuser instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Sysuser findById(java.lang.Integer id) {
		log.debug("getting Sysuser instance with id: " + id);
		try {
			Sysuser instance = (Sysuser) getHibernateTemplate().get(
					"com.model.Sysuser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Sysuser instance) {
		log.debug("finding Sysuser instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Sysuser instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Sysuser as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByUserPw(Object userPw) {
		return findByProperty(USER_PW, userPw);
	}

	public List findAll() {
		log.debug("finding all Sysuser instances");
		try {
			String queryString = "from Sysuser";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Sysuser merge(Sysuser detachedInstance) {
		log.debug("merging Sysuser instance");
		try {
			Sysuser result = (Sysuser) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Sysuser instance) {
		log.debug("attaching dirty Sysuser instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Sysuser instance) {
		log.debug("attaching clean Sysuser instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public List find(String uname)
	{
		log.debug("finding  Sysuser instances");
		try
		{
			String queryString = "from Sysuser where uname like '%"+uname+"%' order by id desc";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find  failed", re);
			throw re;
		}
	}
	
	public static SysuserDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SysuserDAO) ctx.getBean("SysuserDAO");
	}
}