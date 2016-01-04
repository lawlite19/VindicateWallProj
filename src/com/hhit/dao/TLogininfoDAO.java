package com.hhit.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TLogininfo;

/**
 * A data access object (DAO) providing persistence and search support for
 * TLogininfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.hhit.entity.TLogininfo
 * @author MyEclipse Persistence Tools
 */
public class TLogininfoDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TLogininfoDAO.class);
	// property constants
	public static final String LOGIN_PLACE = "loginPlace";
	public static final String IP_ADDRESS = "ipAddress";

	protected void initDao() {
		// do nothing
	}

	public void save(TLogininfo transientInstance) {
		log.debug("saving TLogininfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TLogininfo persistentInstance) {
		log.debug("deleting TLogininfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TLogininfo findById(java.lang.Long id) {
		log.debug("getting TLogininfo instance with id: " + id);
		try {
			TLogininfo instance = (TLogininfo) getHibernateTemplate().get(
					"com.hhit.entity.TLogininfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TLogininfo instance) {
		log.debug("finding TLogininfo instance by example");
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
		log.debug("finding TLogininfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TLogininfo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLoginPlace(Object loginPlace) {
		return findByProperty(LOGIN_PLACE, loginPlace);
	}

	public List findByIpAddress(Object ipAddress) {
		return findByProperty(IP_ADDRESS, ipAddress);
	}

	public List findAll() {
		log.debug("finding all TLogininfo instances");
		try {
			String queryString = "from TLogininfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TLogininfo merge(TLogininfo detachedInstance) {
		log.debug("merging TLogininfo instance");
		try {
			TLogininfo result = (TLogininfo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TLogininfo instance) {
		log.debug("attaching dirty TLogininfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TLogininfo instance) {
		log.debug("attaching clean TLogininfo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TLogininfoDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TLogininfoDAO) ctx.getBean("TLogininfoDAO");
	}
}