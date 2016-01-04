package com.hhit.entity;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 	* A data access object (DAO) providing persistence and search support for TMessage entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.hhit.entity.TMessage
  * @author MyEclipse Persistence Tools 
 */
public class TMessageDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(TMessageDAO.class);
		//property constants
	public static final String RECEIVE_REAL_NAME = "receiveRealName";
	public static final String MSG_CONTENT = "msgContent";
	public static final String MSG_TYPE = "msgType";



	protected void initDao() {
		//do nothing
	}
    
    public void save(TMessage transientInstance) {
        log.debug("saving TMessage instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(TMessage persistentInstance) {
        log.debug("deleting TMessage instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public TMessage findById( java.lang.Long id) {
        log.debug("getting TMessage instance with id: " + id);
        try {
            TMessage instance = (TMessage) getHibernateTemplate()
                    .get("com.hhit.entity.TMessage", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(TMessage instance) {
        log.debug("finding TMessage instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding TMessage instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from TMessage as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByReceiveRealName(Object receiveRealName
	) {
		return findByProperty(RECEIVE_REAL_NAME, receiveRealName
		);
	}
	
	public List findByMsgContent(Object msgContent
	) {
		return findByProperty(MSG_CONTENT, msgContent
		);
	}
	
	public List findByMsgType(Object msgType
	) {
		return findByProperty(MSG_TYPE, msgType
		);
	}
	

	public List findAll() {
		log.debug("finding all TMessage instances");
		try {
			String queryString = "from TMessage";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public TMessage merge(TMessage detachedInstance) {
        log.debug("merging TMessage instance");
        try {
            TMessage result = (TMessage) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(TMessage instance) {
        log.debug("attaching dirty TMessage instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(TMessage instance) {
        log.debug("attaching clean TMessage instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static TMessageDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (TMessageDAO) ctx.getBean("TMessageDAO");
	}
}