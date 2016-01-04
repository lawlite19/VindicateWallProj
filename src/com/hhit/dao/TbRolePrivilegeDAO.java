package com.hhit.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TbPrivilege;
import com.hhit.entity.TbRole;
import com.hhit.entity.TbRolePrivilege;
import com.hhit.entity.TbRolePrivilegeId;

/**
 * A data access object (DAO) providing persistence and search support for
 * TbRolePrivilege entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.hhit.entity.TbRolePrivilege
 * @author MyEclipse Persistence Tools
 */
public class TbRolePrivilegeDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TbRolePrivilegeDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(TbRolePrivilege transientInstance) {
		log.debug("saving TbRolePrivilege instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TbRolePrivilege persistentInstance) {
		log.debug("deleting TbRolePrivilege instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TbRolePrivilege findById(com.hhit.entity.TbRolePrivilegeId id) {
		log.debug("getting TbRolePrivilege instance with id: " + id);
		try {
			TbRolePrivilege instance = (TbRolePrivilege) getHibernateTemplate()
					.get("com.hhit.entity.TbRolePrivilege", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TbRolePrivilege instance) {
		log.debug("finding TbRolePrivilege instance by example");
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
		log.debug("finding TbRolePrivilege instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from TbRolePrivilege as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all TbRolePrivilege instances");
		try {
			String queryString = "from TbRolePrivilege";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TbRolePrivilege merge(TbRolePrivilege detachedInstance) {
		log.debug("merging TbRolePrivilege instance");
		try {
			TbRolePrivilege result = (TbRolePrivilege) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TbRolePrivilege instance) {
		log.debug("attaching dirty TbRolePrivilege instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TbRolePrivilege instance) {
		log.debug("attaching clean TbRolePrivilege instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TbRolePrivilegeDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (TbRolePrivilegeDAO) ctx.getBean("TbRolePrivilegeDAO");
	}

	public List<TbPrivilege> findByRoleId(TbRole id) {
		log.debug("findByRoleId instances");
		try {
			String queryString = "from TbRolePrivilegeId where tbRole=?";
			return (List<TbPrivilege>) getSession().createQuery(queryString).setParameter(0, id);
		} catch (RuntimeException re) {
			log.error("findByRoleId failed", re);
			throw re;
		}
	}
}