package com.hhit.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TDailyvindicate;

/**
 * A data access object (DAO) providing persistence and search support for
 * TDailyvindicate entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.hhit.entity.TDailyvindicate
 * @author MyEclipse Persistence Tools
 */
public class TDailyvindicateDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TDailyvindicateDAO.class);
	// property constants
	public static final String VINDICATOR = "vindicator";
	public static final String BOY_NAME = "boyName";
	public static final String GIRL_NAME = "girlName";
	public static final String CONTENT = "content";
	public static final String COMMENTS = "comments";
	public static final String YEAR = "year";
	public static final String MONTH = "month";
	public static final String DAY = "day";

	protected void initDao() {
		// do nothing
	}

	public void save(TDailyvindicate transientInstance) {
		log.debug("saving TDailyvindicate instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TDailyvindicate persistentInstance) {
		log.debug("deleting TDailyvindicate instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TDailyvindicate findById(java.lang.Long id) {
		log.debug("getting TDailyvindicate instance with id: " + id);
		try {
			TDailyvindicate instance = (TDailyvindicate) getHibernateTemplate()
					.get("com.hhit.entity.TDailyvindicate", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TDailyvindicate instance) {
		log.debug("finding TDailyvindicate instance by example");
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
		log.debug("finding TDailyvindicate instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from TDailyvindicate as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByVindicator(Object vindicator) {
		return findByProperty(VINDICATOR, vindicator);
	}

	public List findByBoyName(Object boyName) {
		return findByProperty(BOY_NAME, boyName);
	}

	public List findByGirlName(Object girlName) {
		return findByProperty(GIRL_NAME, girlName);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByComments(Object comments) {
		return findByProperty(COMMENTS, comments);
	}

	public List findByYear(Object year) {
		return findByProperty(YEAR, year);
	}

	public List findByMonth(Object month) {
		return findByProperty(MONTH, month);
	}

	public List findByDay(Object day) {
		return findByProperty(DAY, day);
	}

	public List findAll() {
		log.debug("finding all TDailyvindicate instances");
		try {
			String queryString = "from TDailyvindicate";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TDailyvindicate merge(TDailyvindicate detachedInstance) {
		log.debug("merging TDailyvindicate instance");
		try {
			TDailyvindicate result = (TDailyvindicate) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TDailyvindicate instance) {
		log.debug("attaching dirty TDailyvindicate instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TDailyvindicate instance) {
		log.debug("attaching clean TDailyvindicate instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TDailyvindicateDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (TDailyvindicateDAO) ctx.getBean("TDailyvindicateDAO");
	}
	//查找当天
		public TDailyvindicate findToday() {
			log.debug("findToday instances");
			try {
				String queryString = "from TDailyvindicate where releaseDate=curdate()";
				return (TDailyvindicate) getSession().createQuery(queryString)//
					   .uniqueResult();
			} catch (RuntimeException re) {
				log.error("findToday failed", re);
				throw re;
			}
		}
		//根据日期查找
		public TDailyvindicate findByDate(String releaseDate) {
			log.debug("findByDate instances");
			try {
				String queryString = "from TDailyvindicate where ReleaseDate=?";
				return (TDailyvindicate) getSession().createQuery(queryString)//
					    .setParameter(0, releaseDate)
					    .uniqueResult();
			} catch (RuntimeException re) {
				log.error("findByDate failed", re);
				throw re;
			}
		}
		//查询分页记录
		public List findDailyVinPage(int pageNum, int pageSize) {
			log.debug("findDailyVinPage instances");
			try {
				String queryString = "from TDailyvindicate order by id desc";
				return getSession().createQuery(queryString)//
				.setFirstResult((pageNum - 1) * pageSize)//
				.setMaxResults(pageSize)//
				.list();
				
			} catch (RuntimeException re) {
				log.error("findDailyVinPage failed", re);
				throw re;
			}
		}
		//查找记录总数
		public Long findDailyVinCount() {
			log.debug("findDailyVinCount instances");
			try {
				String queryString = "select count(*) from TDailyvindicate";
				
				return (Long)getSession().createQuery(queryString).uniqueResult();
			} catch (RuntimeException re) {
				log.error("findDailyVinCount failed", re);
				throw re;
			}
		}
		//删除
		public void deleteById(Long dailyVinId) {
			log.debug("deleteById instances");
			try {
				String queryString = "delete from TDailyvindicate where id=?";
				getSession().createQuery(queryString)//
				.setParameter(0, dailyVinId)//
				.executeUpdate();
			} catch (RuntimeException re) {
				log.error("deleteById failed", re);
				throw re;
			}
		}
		//条件查找记录
		public List findUserByCondition(int pageNum, int pageSize, String hql) {
			log.debug("findDailyVinPage instances");
			try {
				String queryString = "from TDailyvindicate"+hql;
				return getSession().createQuery(queryString)//
				.setFirstResult((pageNum - 1) * pageSize)//
				.setMaxResults(pageSize)//
				.list();
				
			} catch (RuntimeException re) {
				log.error("findDailyVinPage failed", re);
				throw re;
			}
		}
		//条件查找记录总数
		public Long findCountByCondition(String hql) {
			log.debug("findDailyVinCount instances");
			try {
				String queryString = "select count(*) from TDailyvindicate"+hql;
				
				return (Long)getSession().createQuery(queryString).uniqueResult();
			} catch (RuntimeException re) {
				log.error("findDailyVinCount failed", re);
				throw re;
			}
		}
}