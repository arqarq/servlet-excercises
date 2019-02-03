package pl.sdacademy.registration.DAO;

import pl.sdacademy.registration.User;

import javax.inject.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.Collection;

@Singleton
public class UserDAO {
    @PersistenceContext(unitName = "testPersistenceUnit")
    private EntityManager entityManager;

    @Transactional
    public void saveUser(User user) {
        entityManager.persist(user);
    }

    public Collection<User> getUsers() {
        Query query = entityManager.createQuery("SELECT u FROM User u");
        return query.getResultList();
    }
}
