package com.CRUDsample.controller;

import com.CRUDsample.entity.User;
import com.CRUDsample.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    private int page = 0;
    private int pageMax = 0;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("user") User user, BindingResult result) {
        userService.saveUser(user);
        return "redirect:listUsers";
    }

    @RequestMapping(value = {"/", "/listUsers"})
    public String listUsers(Map<String, Object> map) {
        map.put("user", new User());
        map.put("userList", userService.listUsers(page));
        map.put("page", page + 1);
        return "/user/listUsers";
    }

    @RequestMapping(value = "/get/{userId}")
    public String getUser(@PathVariable Long userId, Map<String, Object> map) {
        User user = userService.getUser(userId);
        map.put("user", user);
        return "/user/userForm";
    }

    @RequestMapping(value = "/delete/{userId}")
    public String deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        return "redirect:/user/listUsers";
    }

    @RequestMapping(value = "/prev")
    public String prevUsers(Map<String, Object> map) {
        if (page > 0) {
            page--;
        }
        return "redirect:listUsers";
    }

    @RequestMapping(value = "/next")
    public String nextUsers(Map<String, Object> map) {
        if (!userService.listUsers(page + 1).isEmpty()) {
            page++;
        }
        return "redirect:listUsers";
    }
}
