package com.CRUDsample.dao;

import com.CRUDsample.entity.User;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {
    @Autowired
    private SessionFactory sessionFactory;

    public void saveUser(User user) {
        getSession().merge(user);
    }

    public List<User> listUsers(String search, int page) {
        Criteria cr = getSession().createCriteria(User.class);
        cr.setFirstResult(page * 5);
        cr.setMaxResults(5);
        cr.add(Restrictions.ilike("name", "%" + search + "%"));
        return cr.list();
    }

    public User getUser(Long id) {
        return (User) getSession().get(User.class, id);
    }

    public void deleteUser(Long id) {
        User user = getUser(id);
        if (null != user) {
            getSession().delete(user);
        }
    }

    private Session getSession() {
        Session sess = getSessionFactory().getCurrentSession();
        if (sess == null) {
            sess = getSessionFactory().openSession();
        }
        return sess;
    }

    private SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
