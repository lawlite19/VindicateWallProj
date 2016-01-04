package com.hhit.dao;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hhit.entity.TUser;

/**
 * A data access object (DAO) providing persistence and search support for TUser
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.hhit.entity.TUser
 * @author MyEclipse Persistence Tools
 */
public class TUserDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(TUserDAO.class);
	// property constants
	public static final String USER_NAME = "userName";
	public static final String PASSWORD = "password";
	public static final String REAL_NAME = "realName";
	public static final String SEX = "sex";
	public static final String EMAIL = "email";
	public static final String TELPHONE = "telphone";
	public static final String QQ = "qq";
	public static final String USER_LEVEL = "userLevel";
	public static final String SAFE_QUESTION = "safeQuestion";
	public static final String SAFE_ANSWER = "safeAnswer";
	public static final String IS_USABLE = "isUsable";
	public static final String MSG_COUNT = "msgCount";
	public static final String FACE_IMAGE = "faceImage";

	protected void initDao() {
		// do nothing
	}

	public void save(TUser transientInstance) {
		log.debug("saving TUser instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TUser persistentInstance) {
		log.debug("deleting TUser instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TUser findById(java.lang.Long id) {
		log.debug("getting TUser instance with id: " + id);
		try {
			TUser instance = (TUser) getHibernateTemplate().get(
					"com.hhit.entity.TUser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TUser instance) {
		log.debug("finding TUser instance by example");
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
		log.debug("finding TUser instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TUser as model where model."
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

	public List findByRealName(Object realName) {
		return findByProperty(REAL_NAME, realName);
	}

	public List findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByTelphone(Object telphone) {
		return findByProperty(TELPHONE, telphone);
	}

	public List findByQq(Object qq) {
		return findByProperty(QQ, qq);
	}

	public List findByUserLevel(Object userLevel) {
		return findByProperty(USER_LEVEL, userLevel);
	}

	public List findBySafeQuestion(Object safeQuestion) {
		return findByProperty(SAFE_QUESTION, safeQuestion);
	}

	public List findBySafeAnswer(Object safeAnswer) {
		return findByProperty(SAFE_ANSWER, safeAnswer);
	}

	public List findByIsUsable(Object isUsable) {
		return findByProperty(IS_USABLE, isUsable);
	}

	public List findByMsgCount(Object msgCount) {
		return findByProperty(MSG_COUNT, msgCount);
	}

	public List findByFaceImage(Object faceImage) {
		return findByProperty(FACE_IMAGE, faceImage);
	}

	public List findAll() {
		log.debug("finding all TUser instances");
		try {
			String queryString = "from TUser";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TUser merge(TUser detachedInstance) {
		log.debug("merging TUser instance");
		try {
			TUser result = (TUser) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TUser instance) {
		log.debug("attaching dirty TUser instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TUser instance) {
		log.debug("attaching clean TUser instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TUserDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TUserDAO) ctx.getBean("TUserDAO");
	}
	public TUser findUserByName(String username) {
		log.debug("findUserByName instances");
		try {
			String queryString = "from TUser where UserName=?";
			
			@SuppressWarnings("unchecked")
			List<TUser> users= getHibernateTemplate().find(queryString,username);
			if(users.size()>0)
				return users.get(0);
			return null;
		} catch (RuntimeException re) {
			log.error("findUserByName failed", re);
			throw re;
		}
	}

	public TUser findByUName(String userName) {
		log.debug("findByUName instances");
		try {
			String queryString = "from TUser where UserName=?";
			
			@SuppressWarnings("unchecked")
			List<TUser> users= getHibernateTemplate().find(queryString,userName);
			if(users.size()>0)
				return users.get(0);
			return null;
		} catch (RuntimeException re) {
			log.error("findByUName failed", re);
			throw re;
		}
	}
	//查找前台用户分页
	public List findUserPageList(int pageNum, int pageSize) {
		log.debug("findUserPageList instances");
		try {
			String queryString = "from TUser order by id DESC";
			return getSession().createQuery(queryString)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findUserPageList failed", re);
			throw re;
		}
	}
	//查找前台用户条数
	public Long findCount() {
		log.debug("findCount instances");
		try {
			String queryString = "select count(*) from TUser";
			
			return (Long)getSession().createQuery(queryString).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findCount failed", re);
			throw re;
		}
	}
	//禁用用户
	public void useLess(Long userId) {
		log.debug("useLess instances");
		try {
			String queryString = "update TUser set IsUsable=? where Id=?";
			
			getSession().createQuery(queryString)//
			.setParameter(0, 0)//
			.setParameter(1, userId)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("useLess failed", re);
			throw re;
		}
	}

	public void usable(Long userId) {
		log.debug("usable instances");
		try {
			String queryString = "update TUser set IsUsable=? where Id=?";
			
			getSession().createQuery(queryString)//
			.setParameter(0, 1)//
			.setParameter(1, userId)//
			.executeUpdate();
		} catch (RuntimeException re) {
			log.error("usable failed", re);
			throw re;
		}
	}
	//条件查询用户
	public List findUserByCondition(int pageNum, int pageSize, String hql) {
		log.debug("findUserByCondition instances");
		try {
			String queryString = "from TUser"+hql;
			return getSession().createQuery(queryString)//
			.setFirstResult((pageNum - 1) * pageSize)//
			.setMaxResults(pageSize)//
			.list();
			
		} catch (RuntimeException re) {
			log.error("findUserByCondition failed", re);
			throw re;
		}
	}
	//条件查找前台用户条数
	public Long findCountByCondition(String hql) {
		log.debug("findCountByCondition instances");
		try {
			String queryString = "select count(*) from TUser"+hql;
			
			return (Long)getSession().createQuery(queryString).uniqueResult();
		} catch (RuntimeException re) {
			log.error("findCountByCondition failed", re);
			throw re;
		}
	}
}