package com.hhit.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TbManageuser;

/**
 * A data access object (DAO) providing persistence and search support for
 * TbManageuser entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.hhit.entity.TbManageuser
 * @author MyEclipse Persistence Tools
 */
public class TbManageuserDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TbManageuserDAO.class);
	// property constants
	public static final String USER_NAME = "userName";
	public static final String PASSWORD = "password";
	public static final String USER_TYPE = "userType";

	protected void initDao() {
		// do nothing
	}

	public void save(TbManageuser transientInstance) {
		log.debug("saving TbManageuser instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TbManageuser persistentInstance) {
		log.debug("deleting TbManageuser instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TbManageuser findById(java.lang.Integer id) {
		log.debug("getting TbManageuser instance with id: " + id);
		try {
			TbManageuser instance = (TbManageuser) getHibernateTemplate().get(
					"com.hhit.entity.TbManageuser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TbManageuser instance) {
		log.debug("finding TbManageuser instance by example");
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
		log.debug("finding TbManageuser instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from TbManageuser as model where model."
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

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByUserType(Object userType) {
		return findByProperty(USER_TYPE, userType);
	}

	public List findAll() {
		log.debug("finding all TbManageuser instances");
		try {
			String queryString = "from TbManageuser";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TbManageuser merge(TbManageuser detachedInstance) {
		log.debug("merging TbManageuser instance");
		try {
			TbManageuser result = (TbManageuser) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TbManageuser instance) {
		log.debug("attaching dirty TbManageuser instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TbManageuser instance) {
		log.debug("attaching clean TbManageuser instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TbManageuserDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (TbManageuserDAO) ctx.getBean("TbManageuserDAO");
	}
	//查找登录用户
	public TbManageuser findByUNameAndPwd(String userName, String password2) {
		log.debug("findByUNameAndPwd instances");
		try {
			String queryString = "from TbManageuser where UserName=? and Password=?";
			List<TbManageuser> users= getHibernateTemplate().find(queryString,userName,password2);
			if(users.size()>0)
				return users.get(0);
			return null;
		} catch (RuntimeException re) {
			log.error("findByUNameAndPwd failed", re);
			throw re;
		}
	}
	//删除用户
	public void deleteById(int id) {
		log.debug("deleteById instances");
		try {
			String queryString = "delete from TbManageuser where Id=?";
			getSession().createQuery(queryString)//
			.setParameter(0, id)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("deleteById failed", re);
			throw re;
		}
	}

	public void initPwd(int id, String md5Digest) {
		log.debug("initPwd instances");
		try {
			String queryString = "update TbManageuser set Password=? where Id=?";
			getSession().createQuery(queryString)//
			.setParameter(0, md5Digest)//
			.setParameter(1, id)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("initPwd failed", re);
			throw re;
		}
	}
}