package com.hhit.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TAttend;

/**
 * A data access object (DAO) providing persistence and search support for
 * TAttend entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.hhit.entity.TAttend
 * @author MyEclipse Persistence Tools
 */
public class TAttendDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(TAttendDAO.class);
	// property constants
	public static final String SCORE = "score";
	public static final String ATTEND_COUNT = "attendCount";

	protected void initDao() {
		// do nothing
	}

	public void save(TAttend transientInstance) {
		log.debug("saving TAttend instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TAttend persistentInstance) {
		log.debug("deleting TAttend instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TAttend findById(java.lang.Long id) {
		log.debug("getting TAttend instance with id: " + id);
		try {
			TAttend instance = (TAttend) getHibernateTemplate().get(
					"com.hhit.entity.TAttend", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TAttend instance) {
		log.debug("finding TAttend instance by example");
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
		log.debug("finding TAttend instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TAttend as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByScore(Object score) {
		return findByProperty(SCORE, score);
	}

	public List findByAttendCount(Object attendCount) {
		return findByProperty(ATTEND_COUNT, attendCount);
	}

	public List findAll() {
		log.debug("finding all TAttend instances");
		try {
			String queryString = "from TAttend";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TAttend merge(TAttend detachedInstance) {
		log.debug("merging TAttend instance");
		try {
			TAttend result = (TAttend) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TAttend instance) {
		log.debug("attaching dirty TAttend instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TAttend instance) {
		log.debug("attaching clean TAttend instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TAttendDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TAttendDAO) ctx.getBean("TAttendDAO");
	}

	//更新签到信息
	public void updateAttend(Long userSessionId) {
		log.debug("updateAttend instances");
		try {
			String queryString = "update TAttend set LastAttend=curdate(),Score=Score+20,AttendCount=AttendCount+1 where UserId=?";
			getSession().createQuery(queryString)//
			.setParameter(0, userSessionId)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("updateAttend failed", re);
			throw re;
		}
	}
	//根据用户Id查找
	public TAttend findByUserId(Long userSessionId) {
		log.debug("findByUserId instances");
		try {
			String queryString = "from TAttend where UserId=?";
			return (TAttend)getSession().createQuery(queryString)//
			.setParameter(0, userSessionId)//
			.uniqueResult();
		} catch (RuntimeException re) {
			log.error("findByUserId failed", re);
			throw re;
		}
	}
	//判断是否签到了
	public boolean isAttend(Long id) {
		log.debug("isAttend instances");
		try {
			String queryString = "from TAttend where UserId=? and LastAttend=curdate()";
			 Object attend=getSession().createQuery(queryString)//
			.setParameter(0, id)//
			.uniqueResult();
			 if(attend!=null)
				 return true;
			 return false;
		} catch (RuntimeException re) {
			log.error("isAttend failed", re);
			throw re;
		}
	}
}