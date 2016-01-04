package com.hhit.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TReleasecontent;
import com.hhit.entity.TUser;

/**
 * A data access object (DAO) providing persistence and search support for
 * TReleasecontent entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.hhit.entity.TReleasecontent
 * @author MyEclipse Persistence Tools
 */
public class TReleasecontentDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(TReleasecontentDAO.class);
	// property constants
	public static final String RELEASE_CONTENT = "releaseContent";
	public static final String REAL_NAME = "realName";
	public static final String BACKGROUND = "background";
	public static final String IS_RECOMMAND = "isRecommand";
	public static final String IP_ADDRESS = "ipAddress";
	public static final String VIEW_COUNT = "viewCount";
	public static final String COMMENT_COUNT = "commentCount";

	protected void initDao() {
		// do nothing
	}

	public void save(TReleasecontent transientInstance) {
		log.debug("saving TReleasecontent instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TReleasecontent persistentInstance) {
		log.debug("deleting TReleasecontent instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TReleasecontent findById(java.lang.Long id) {
		log.debug("getting TReleasecontent instance with id: " + id);
		try {
			TReleasecontent instance = (TReleasecontent) getHibernateTemplate()
					.get("com.hhit.entity.TReleasecontent", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TReleasecontent instance) {
		log.debug("finding TReleasecontent instance by example");
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
		log.debug("finding TReleasecontent instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from TReleasecontent as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByReleaseContent(Object releaseContent) {
		return findByProperty(RELEASE_CONTENT, releaseContent);
	}

	public List findByRealName(Object realName) {
		return findByProperty(REAL_NAME, realName);
	}

	public List findByBackground(Object background) {
		return findByProperty(BACKGROUND, background);
	}

	public List findByIsRecommand(Object isRecommand) {
		return findByProperty(IS_RECOMMAND, isRecommand);
	}

	public List findByIpAddress(Object ipAddress) {
		return findByProperty(IP_ADDRESS, ipAddress);
	}

	public List findByViewCount(Object viewCount) {
		return findByProperty(VIEW_COUNT, viewCount);
	}

	public List findByCommentCount(Object commentCount) {
		return findByProperty(COMMENT_COUNT, commentCount);
	}

	public List findAll() {
		log.debug("finding all TReleasecontent instances");
		try {
			String queryString = "from TReleasecontent";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TReleasecontent merge(TReleasecontent detachedInstance) {
		log.debug("merging TReleasecontent instance");
		try {
			TReleasecontent result = (TReleasecontent) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TReleasecontent instance) {
		log.debug("attaching dirty TReleasecontent instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TReleasecontent instance) {
		log.debug("attaching clean TReleasecontent instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TReleasecontentDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (TReleasecontentDAO) ctx.getBean("TReleasecontentDAO");
	}
	public List<TReleasecontent> findVindicationByUId(Long id) {
		log.debug("findVindicationByUId instances");
		try {
			String queryString = "from TReleasecontent where UserId=?";
			return getHibernateTemplate().find(queryString,id);
		} catch (RuntimeException re) {
			log.error("findVindicationByUId failed", re);
			throw re;
		}
	}

	public List<TReleasecontent> findRecommendVindicate() {
		log.debug("findRecommendVindicate instances");
		try {
			String queryString = "from TReleasecontent where IsRecommand=?";
			return getHibernateTemplate().find(queryString,1);
			//1代表推荐的表白内容
		} catch (RuntimeException re) {
			log.error("findRecommendVindicate failed", re);
			throw re;
		}
	}

	//删除表白内容
	public void deleteById(long releaseInfoId) {
		log.debug("deleteById instances");
		try {
			String queryString = "delete from TReleasecontent where Id=?";
			getSession().createQuery(queryString)//
			.setParameter(0, releaseInfoId)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("deleteById failed", re);
			throw re;
		}
	}

	public void deleteMyVindicate(Long releaseInfoId, Long id) {
		log.debug("deleteMyVindicate instances");
		try {
			String queryString = "delete from TReleasecontent where Id=? and UserId=?";
			getSession().createQuery(queryString)//
			.setParameter(0, releaseInfoId)//
			.setParameter(1,id)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("deleteMyVindicate failed", re);
			throw re;
		}
	}
	//查找所有并降序
	public List findAllOrder() {
		log.debug("findAllOrder all TReleasecontent instances");
		try {
			String queryString = "from TReleasecontent ORDER BY id DESC";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("findAllOrder all failed", re);
			throw re;
		}
	}

	public List findVinPageList(int pageNum, int pageSize) {
		log.debug("findCount instances");
		try {
			String queryString = "from TReleasecontent ORDER BY id DESC";
			return getSession().createQuery(queryString)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findCount failed", re);
			throw re;
		}
	}

	public Long findCount() {
		log.debug("findCount instances");
		try {
			String queryString = "select count(*) from TReleasecontent";
			
			return (Long)getSession().createQuery(queryString).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findCount failed", re);
			throw re;
		}
	}

	public List findMyVinPageList(int pageNum, int pageSize, Long id) {
		log.debug("findMyVinPageList instances");
		try {
			String queryString = "from TReleasecontent where UserId=? ORDER BY id DESC";
			return getSession().createQuery(queryString)//
			.setParameter(0, id)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findMyVinPageList failed", re);
			throw re;
		}
	}

	public Long findMyVinCount(Long id) {
		log.debug("findMyVinCount instances");
		try {
			String queryString = "select count(*) from TReleasecontent where UserId=?";
			
			return (Long)getSession().createQuery(queryString).setParameter(0, id).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findMyVinCount failed", re);
			throw re;
		}
	}

	public void updateViewCount(long releaseInfoId) {
		log.debug("updateViewCount instances");
		try {
			String queryString = "update TReleasecontent set ViewCount=ViewCount+1 where Id=?";
			getSession().createQuery(queryString).setParameter(0, releaseInfoId).executeUpdate();
		} catch (RuntimeException re) {
			log.error("updateViewCount failed", re);
			throw re;
		}
	}

	public void updateCommentCount(long releaseInfoId) {
		log.debug("updateCommentCount instances");
		try {
			String queryString = "update TReleasecontent set CommentCount=CommentCount+1 where Id=?";
			getSession().createQuery(queryString).setParameter(0, releaseInfoId).executeUpdate();
		} catch (RuntimeException re) {
			log.error("updateCommentCount failed", re);
			throw re;
		}
	}
	//推荐表白
	public void recommand(Long vindicateId) {
		log.debug("recommand instances");
		try {
			String queryString = "update TReleasecontent set IsRecommand=? where Id=?";
			
			getSession().createQuery(queryString)//
			.setParameter(0, 1)//
			.setParameter(1, vindicateId)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("recommand failed", re);
			throw re;
		}
	}
	//还原表白
	public void returnBefore(Long vindicateId) {
		log.debug("recommand instances");
		try {
			String queryString = "update TReleasecontent set IsRecommand=? where Id=?";
			
			getSession().createQuery(queryString)//
			.setParameter(0, 0)//
			.setParameter(1, vindicateId)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("recommand failed", re);
			throw re;
		}
	}
	//条件查询分页
	public List findVinByCondition(int pageNum, int pageSize, String hql) {
		log.debug("findVinByCondition instances");
		try {
			String queryString = "from TReleasecontent"+hql;
			return getSession().createQuery(queryString)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findVinByCondition failed", re);
			throw re;
		}
	}
	//条件查询总条数
	public Long findCountByCondition(String hql) {
		log.debug("findCountByCondition instances");
		try {
			String queryString = "select count(*) from TReleasecontent"+hql;
			
			return (Long)getSession().createQuery(queryString).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findCountByCondition failed", re);
			throw re;
		}
	}
	//设置背景图片
	public void setBackground(Long vindicateId, String background2) {
		log.debug("setBackground instances");
		try {
			String queryString = "update TReleasecontent set Background=? where Id=?";
			getSession().createQuery(queryString)//
			.setParameter(0, background2)//
			.setParameter(1, vindicateId)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("setBackground failed", re);
			throw re;
		}
	}

	public TReleasecontent findUserById(long releaseInfoId) {
		log.debug("findUserById instances");
		try {
			String queryString = "from TReleasecontent where Id=?";
			List<TReleasecontent> release= getHibernateTemplate().find(queryString,releaseInfoId);
			if(release.size()>0)
				return release.get(0);
			return null;
		} catch (RuntimeException re) {
			log.error("findVindicationByUId failed", re);
			throw re;
		}
	}
}