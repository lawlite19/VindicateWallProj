package com.hhit.dao;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TbPrivilege;

/**
 * A data access object (DAO) providing persistence and search support for
 * TbPrivilege entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.hhit.entity.TbPrivilege
 * @author MyEclipse Persistence Tools
 */
public class TbPrivilegeDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TbPrivilegeDAO.class);
	// property constants
	public static final String URL = "url";
	public static final String NAME = "name";

	protected void initDao() {
		// do nothing
	}

	public void save(TbPrivilege transientInstance) {
		log.debug("saving TbPrivilege instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TbPrivilege persistentInstance) {
		log.debug("deleting TbPrivilege instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TbPrivilege findById(java.lang.Integer id) {
		log.debug("getting TbPrivilege instance with id: " + id);
		try {
			TbPrivilege instance = (TbPrivilege) getHibernateTemplate().get(
					"com.hhit.entity.TbPrivilege", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TbPrivilege instance) {
		log.debug("finding TbPrivilege instance by example");
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
		log.debug("finding TbPrivilege instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TbPrivilege as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUrl(Object url) {
		return findByProperty(URL, url);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all TbPrivilege instances");
		try {
			String queryString = "from TbPrivilege";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TbPrivilege merge(TbPrivilege detachedInstance) {
		log.debug("merging TbPrivilege instance");
		try {
			TbPrivilege result = (TbPrivilege) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TbPrivilege instance) {
		log.debug("attaching dirty TbPrivilege instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TbPrivilege instance) {
		log.debug("attaching clean TbPrivilege instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TbPrivilegeDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (TbPrivilegeDAO) ctx.getBean("TbPrivilegeDAO");
	}
	//查找顶级菜单
	public List<TbPrivilege> findTopList() {
		log.debug("findTopList instances");
		try {
			String queryString = "from TbPrivilege where ParentId IS NULL";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("findTopList failed", re);
			throw re;
		}
	}
	//查找所有权限的url
	public Collection<String> findAllUrls() {
		log.debug("findAllUrls instances");
		try {
			String queryString = "select DISTINCT url from TbPrivilege where url IS NOT NULL";
			return getSession().createQuery(queryString).list();
		} catch (RuntimeException re) {
			log.error("findAllUrls failed", re);
			throw re;
		}
	}
	//根据Id数组查找
	@SuppressWarnings("unchecked")
	public List<TbPrivilege> getByIds(Integer[] privilegeIds) {
		log.debug("getByIds instances");
		try {
			if(privilegeIds == null || privilegeIds.length == 0){
				return Collections.EMPTY_LIST;
			}
			String queryString = "from TbPrivilege where Id IN (:ids)";
			return getSession().createQuery(queryString)//
					.setParameterList("ids", privilegeIds)//
					.list();
		} catch (RuntimeException re) {
			log.error("getByIds failed", re);
			throw re;
		}
	}
}