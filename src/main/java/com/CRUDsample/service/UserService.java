package com.CRUDsample.service;

import com.CRUDsample.entity.User;

import java.util.List;

public interface UserService {
    public void saveUser(User user); // create and update

    public List<User> listUsers(String search); // read all users
    public User getUser(Long id); // read one user

    public void deleteUser(Long id); // delete user
}
