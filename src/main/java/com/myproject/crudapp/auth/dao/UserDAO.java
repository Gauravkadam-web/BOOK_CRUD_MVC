package com.myproject.crudapp.auth.dao;

import com.myproject.crudapp.auth.model.Users;

public interface UserDAO {
    void register(Users user);
    Users login(String username, String password);
    boolean exists(String username);

}
