package com.myproject.crudapp.auth.dao;

import com.myproject.crudapp.auth.model.Users;
import com.myproject.crudapp.exception.BookDAOException;
import com.myproject.crudapp.utils.HibernateUtils;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAOImpl implements UserDAO {

    @Override
    public void register(Users user) {
        Transaction tx = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            // ✅ FIX #1: Hash the password with BCrypt before storing
            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
            user.setPassword(hashedPassword);

            session.persist(user);
            tx.commit();

        } catch (HibernateException he) {
            if (tx != null) tx.rollback();
            throw new BookDAOException("Registration Failed", he);
        }
    }

    @Override
    public Users login(String username, String password) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {

            // ✅ FIX #1: Fetch user by username only, then verify password with BCrypt
            // Never compare hashed passwords directly in the query
            String hql = "FROM Users u WHERE u.username = :username";
            Users user = session.createQuery(hql, Users.class)
                    .setParameter("username", username)
                    .uniqueResult();

            if (user == null) return null;

            // BCrypt.checkpw safely compares the raw password against the stored hash
            boolean passwordMatches = BCrypt.checkpw(password, user.getPassword());
            return passwordMatches ? user : null;

        } catch (HibernateException he) {
            throw new BookDAOException("Login Failed", he);
        }
    }

    @Override
    public boolean exists(String username) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            String hql = "FROM Users u WHERE u.username = :username";
            Query<Users> query = session.createQuery(hql, Users.class)
                    .setParameter("username", username);
            return query.uniqueResult() != null;
        } catch (HibernateException he) {
            throw new BookDAOException("Verification Failed", he);
        }
    }
}