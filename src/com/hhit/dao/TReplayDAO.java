package com.hhit.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TReplay;

/**
 * A data access object (DAO) providing persistence and search support for
 * TReplay entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.hhit.entity.TReplay
 * @author MyEclipse Persistence Tools
 */
public class TReplayDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(TReplayDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String FACE_ICON = "faceIcon";
	public static final String IP_ADDRESS = "ipAddress";
	public static final String IS_DELETE = "isDelete";

	protected void initDao() {
		// do nothing
	}

	public void save(TReplay transientInstance) {
		log.debug("saving TReplay instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Long replayId) {
		log.debug("deleting TReplay instance");
		try {
			getHibernateTemplate().delete(replayId);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TReplay findById(java.lang.Long id) {
		log.debug("getting TReplay instance with id: " + id);
		try {
			TReplay instance = (TReplay) getHibernateTemplate().get(
					"com.hhit.entity.TReplay", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TReplay instance) {
		log.debug("finding TReplay instance by example");
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
		log.debug("finding TReplay instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TReplay as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByFaceIcon(Object faceIcon) {
		return findByProperty(FACE_ICON, faceIcon);
	}

	public List findByIpAddress(Object ipAddress) {
		return findByProperty(IP_ADDRESS, ipAddress);
	}

	public List findByIsDelete(Object isDelete) {
		return findByProperty(IS_DELETE, isDelete);
	}

	public List findAll() {
		log.debug("finding all TReplay instances");
		try {
			String queryString = "from TReplay";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TReplay merge(TReplay detachedInstance) {
		log.debug("merging TReplay instance");
		try {
			TReplay result = (TReplay) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TReplay instance) {
		log.debug("attaching dirty TReplay instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TReplay instance) {
		log.debug("attaching clean TReplay instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TReplayDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TReplayDAO) ctx.getBean("TReplayDAO");
	}

	// 查找某表白内容所有的回复者
	public List<TReplay> findByTopicId(Long id) {
		log.debug("findByTopicId instances");
		try {
			String queryString = "from TReplay where TopicId=?";
			return getHibernateTemplate().find(queryString, id);
		} catch (RuntimeException re) {
			log.error("findByTopicId failed", re);
			throw re;
		}
	}

	public List findReplayPageList(int pageNum, int pageSize, long releaseInfoId) {
		log.debug("findCount instances");
		try {
			String queryString = "from TReplay where TopicId=?";
			return getSession().createQuery(queryString)//
			.setParameter(0, releaseInfoId)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findCount failed", re);
			throw re;
		}
	}

	public Long findReplayCount(long releaseInfoId) {
		log.debug("findCount instances");
		try {
			String queryString = "select count(*) from TReplay where TopicId=?";
			
			return (Long)getSession().createQuery(queryString).setParameter(0, releaseInfoId).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findCount failed", re);
			throw re;
		}
	}
	//查找所有回复分页
	public List findReplayPage(int pageNum, int pageSize) {
		log.debug("findReplayPage instances");
		try {
			String queryString = "from TReplay";
			return getSession().createQuery(queryString)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findReplayPage failed", re);
			throw re;
		}
	}
	//查找所有回复条数
	public Long findCount() {
		log.debug("findCount instances");
		try {
			String queryString = "select count(*) from TReplay";
			
			return (Long)getSession().createQuery(queryString).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findCount failed", re);
			throw re;
		}
	}
	//假删除回复
	public void deleteVirtual(Long replayId) {
		log.debug("deleteVirtual instances");
		try {
			String queryString = "update TReplay set IsDelete=? where Id=?";
			
			getSession().createQuery(queryString)//
			.setParameter(0, 1)//
			.setParameter(1, replayId)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("deleteVirtual failed", re);
			throw re;
		}
	}

	public void returnBefore(Long replayId) {
		log.debug("deleteVirtual instances");
		try {
			String queryString = "update TReplay set IsDelete=? where Id=?";
			
			getSession().createQuery(queryString)//
			.setParameter(0, 0)//
			.setParameter(1, replayId)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("deleteVirtual failed", re);
			throw re;
		}
	}
	//条件查询
	public List findReplayCondition(int pageNum, int pageSize, String hql) {
		log.debug("findReplayCondition instances");
		try {
			String queryString = "from TReplay"+hql;
			return getSession().createQuery(queryString)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findReplayCondition failed", re);
			throw re;
		}
	}

	public Long findCountCondition(String hql) {
		log.debug("findCountCondition instances");
		try {
			String queryString = "select count(*) from TReplay"+hql;
			
			return (Long)getSession().createQuery(queryString).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findCountCondition failed", re);
			throw re;
		}
	}
}