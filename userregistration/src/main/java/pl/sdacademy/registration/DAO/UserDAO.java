package pl.sdacademy.registration.DAO;

import pl.sdacademy.registration.model.User;

import javax.inject.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.Collection;
import java.util.Vector;

@Singleton
public class UserDAO {
    @PersistenceContext(unitName = "testPersistenceUnit")
    private EntityManager entityManager;

    @Transactional
    public void saveUser(User user) {
        entityManager.persist(user);
    }

    @Transactional
    public void updateUser(User user) {
        entityManager.merge(user);
    }

    @Transactional
    public void deleteUser(User user) {
        User merged = entityManager.merge(user);
        entityManager.remove(merged);
    }

    public Collection<User> getUsers() {
        Query query = entityManager.createQuery("SELECT u FROM Users u");
        Object obj = query.getResultList();

        Collection<User> resultList = new Vector<>();
        Collection<?> tempList;
        if (obj != null) {
            tempList = (Vector) obj;
            for (Object user : tempList) {
                resultList.add((User) user);
            }
        }
        return resultList;
    }

    public User findById(Long userId) {
        return entityManager.find(User.class, userId);
    }
}
