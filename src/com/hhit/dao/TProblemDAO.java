package com.hhit.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TProblem;

/**
 * A data access object (DAO) providing persistence and search support for
 * TProblem entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.hhit.entity.TProblem
 * @author MyEclipse Persistence Tools
 */
public class TProblemDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TProblemDAO.class);
	// property constants
	public static final String EMAIL = "email";
	public static final String DESCRIPTION = "description";
	public static final String IS_SOLVE = "isSolve";
	public static final String IS_USABLE = "isUsable";

	protected void initDao() {
		// do nothing
	}

	public void save(TProblem transientInstance) {
		log.debug("saving TProblem instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TProblem persistentInstance) {
		log.debug("deleting TProblem instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TProblem findById(java.lang.Long id) {
		log.debug("getting TProblem instance with id: " + id);
		try {
			TProblem instance = (TProblem) getHibernateTemplate().get(
					"com.hhit.entity.TProblem", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TProblem instance) {
		log.debug("finding TProblem instance by example");
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
		log.debug("finding TProblem instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TProblem as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByDescription(Object description) {
		return findByProperty(DESCRIPTION, description);
	}

	public List findByIsSolve(Object isSolve) {
		return findByProperty(IS_SOLVE, isSolve);
	}

	public List findByIsUsable(Object isUsable) {
		return findByProperty(IS_USABLE, isUsable);
	}

	public List findAll() {
		log.debug("finding all TProblem instances");
		try {
			String queryString = "from TProblem";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TProblem merge(TProblem detachedInstance) {
		log.debug("merging TProblem instance");
		try {
			TProblem result = (TProblem) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TProblem instance) {
		log.debug("attaching dirty TProblem instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TProblem instance) {
		log.debug("attaching clean TProblem instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TProblemDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TProblemDAO) ctx.getBean("TProblemDAO");
	}

	//列表分页
	public List findProblemPage(int pageNum, int pageSize) {
		log.debug("findProblemPage instances");
		try {
			String queryString = "from TProblem";
			return getSession().createQuery(queryString)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findProblemPage failed", re);
			throw re;
		}
	}
	//查询总记录数
	public Long findCount() {
		log.debug("findCount instances");
		try {
			String queryString = "select count(*) from TProblem";
			
			return (Long)getSession().createQuery(queryString).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findCount failed", re);
			throw re;
		}
	}
	//将问题置为未解决
	public void updateIsUnSolved(Long id) {
		log.debug("updateIsUnSolved instances");
		try {
			String queryString = "update TProblem set IsSolve=? where Id=?";
			getSession().createQuery(queryString)//
			.setParameter(0, "否")//
			.setParameter(1, id)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("updateIsUnSolved failed", re);
			throw re;
		}
	}
	//将问题置为解决
	public void updateIsSolved(Long id) {
		log.debug("updateIsUnSolved instances");
		try {
			String queryString = "update TProblem set IsSolve=? where Id=?";
			getSession().createQuery(queryString)//
			.setParameter(0, "是")//
			.setParameter(1, id)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("updateIsUnSolved failed", re);
			throw re;
		}
	}
	//置为无用
	public void updateisUseLess(Long id) {
		log.debug("updateIsUnSolved instances");
		try {
			String queryString = "update TProblem set IsUsable=? where Id=?";
			getSession().createQuery(queryString)//
			.setParameter(0, "否")//
			.setParameter(1, id)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("updateIsUnSolved failed", re);
			throw re;
		}
	}
	//置为有用
	public void updateisUseful(Long id) {
		log.debug("updateIsUnSolved instances");
		try {
			String queryString = "update TProblem set IsUsable=? where Id=?";
			getSession().createQuery(queryString)//
			.setParameter(0, "是")//
			.setParameter(1, id)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("updateIsUnSolved failed", re);
			throw re;
		}
	}
	//删除
	public void deleteById(Long id) {
		log.debug("deleteById instances");
		try {
			String queryString = "delete from TProblem where Id=?";
			getSession().createQuery(queryString)//
			.setParameter(0, id)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	//条件查询
	public List findVinByCondition(int pageNum, int pageSize, String hql) {
		log.debug("findVinByCondition instances");
		try {
			String queryString = "from TProblem"+hql;
			return getSession().createQuery(queryString)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findVinByCondition failed", re);
			throw re;
		}
	}
	//条件筛选总条数
	public Long findCountByCondition(String hql) {
		log.debug("findCountByCondition instances");
		try {
			String queryString = "select count(*) from TProblem"+hql;
			
			return (Long)getSession().createQuery(queryString).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findCountByCondition failed", re);
			throw re;
		}
	}
}