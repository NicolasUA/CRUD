package com.CRUDsample.service;

import com.CRUDsample.dao.UserDAO;
import com.CRUDsample.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;

    @Transactional
    public void saveUser(User user) {
        userDAO.saveUser(user);
    }

    @Transactional(readOnly = true)
    public List<User> listUsers(String search, int page) {
        return userDAO.listUsers(search, page);
    }

    @Transactional(readOnly = true)
    public User getUser(Long id) {
        return userDAO.getUser(id);
    }

    @Transactional
    public void deleteUser(Long id) {
        userDAO.deleteUser(id);
    }
}
