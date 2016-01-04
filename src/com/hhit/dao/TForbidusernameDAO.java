package com.hhit.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TForbidusername;

/**
 * A data access object (DAO) providing persistence and search support for
 * TForbidusername entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.hhit.entity.TForbidusername
 * @author MyEclipse Persistence Tools
 */
public class TForbidusernameDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TForbidusernameDAO.class);
	// property constants
	public static final String FORBID_USER_NAME = "forbidUserName";

	protected void initDao() {
		// do nothing
	}

	public void save(TForbidusername transientInstance) {
		log.debug("saving TForbidusername instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TForbidusername persistentInstance) {
		log.debug("deleting TForbidusername instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TForbidusername findById(java.lang.Long id) {
		log.debug("getting TForbidusername instance with id: " + id);
		try {
			TForbidusername instance = (TForbidusername) getHibernateTemplate()
					.get("com.hhit.entity.TForbidusername", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TForbidusername instance) {
		log.debug("finding TForbidusername instance by example");
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
		log.debug("finding TForbidusername instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from TForbidusername as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByForbidUserName(Object forbidUserName) {
		return findByProperty(FORBID_USER_NAME, forbidUserName);
	}

	public List findAll() {
		log.debug("finding all TForbidusername instances");
		try {
			String queryString = "from TForbidusername";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TForbidusername merge(TForbidusername detachedInstance) {
		log.debug("merging TForbidusername instance");
		try {
			TForbidusername result = (TForbidusername) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TForbidusername instance) {
		log.debug("attaching dirty TForbidusername instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TForbidusername instance) {
		log.debug("attaching clean TForbidusername instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TForbidusernameDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (TForbidusernameDAO) ctx.getBean("TForbidusernameDAO");
	}

	public boolean findByUName(String userName) {
		log.debug("findByUName instances");
		try {
			String queryString = "from TForbidusername where ForbidUserName=?";
			List<TForbidusername> forbids=getHibernateTemplate().find(queryString,userName);
			if(forbids.size()>0)
				return true;
			return false;
		} catch (RuntimeException re) {
			log.error("findByUName failed", re);
			throw re;
		}
	}
}