package com.nagarro.training.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.nagarro.hibernate.util.*;
import com.nagarro.hibernate.util.HibernateUtil;
import com.nagarro.training.model.Records;
import com.nagarro.training.model.User;
/** Author HenaFatima*/

public class UserDao {
//	Configuration con = new Configuration().configure().addAnnotatedClass(User.class);
//SessionFactory sf = con.buildSessionFactory();

    public void saveUser(User user) {
        Transaction transaction = null;
      try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(user);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @SuppressWarnings("deprecation")
	public boolean validate(String userName, String password) {

        Transaction transaction = null;
        User user = null;
       try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
        //try(Session session = sf.openSession()){
        transaction = session.beginTransaction();
            // get an user object
            user = (User) session.createQuery("FROM User U WHERE U.username = :userName").setParameter("userName", userName)
                .uniqueResult();

            if (user != null && user.getPassword().equals(password)) {
                return true;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
    
    public List<User> getUsers(){
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// try(Session session = sf.openSession()){
			// start a transaction
			transaction = session.beginTransaction();
			List <User> userList= session.createQuery("from User").list();
			transaction.commit();
			session.close();
			for (User u:userList) {
				System.out.println(u.getUsername());

			}
			return userList;
		}catch(HibernateException e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

}