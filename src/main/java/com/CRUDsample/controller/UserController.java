package com.CRUDsample.controller;

import com.CRUDsample.entity.User;
import com.CRUDsample.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService userService;
    private String search = "";
    private PagedListHolder pagedListHolder;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("user") User user, BindingResult result) {
        userService.saveUser(user);
        pagedListHolder.setSource(userService.listUsers(search));
        return "redirect:/users/listUsers";
    }

    @RequestMapping(value = {"/", "/listUsers"})
    public String listUsers(Map<String, Object> map) {
        if (pagedListHolder == null) {
            pagedListHolder = new PagedListHolder(userService.listUsers(search));
            pagedListHolder.setPage(0);
            pagedListHolder.setPageSize(5);
        }
        map.put("user", new User());
        map.put("userList", pagedListHolder);
        map.put("search", search);
        return "/users/listUsers";
    }

    @RequestMapping(value = "/get/{userId}")
    public String getUser(@PathVariable Long userId, Map<String, Object> map) {
        User user = userService.getUser(userId);
        map.put("user", user);
        return "/users/userForm";
    }

    @RequestMapping(value = "/delete/{userId}")
    public String deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        pagedListHolder.setSource(userService.listUsers(search));
        return "redirect:/users/listUsers";
    }

    @RequestMapping(value = "/search")
    public String searchUsers(@RequestParam(required= false, defaultValue="") String name) {
        search = name.trim();
        pagedListHolder.setSource(userService.listUsers(search));
        return "redirect:/users/listUsers";
    }

    @RequestMapping(value = "/page/{action}")
    public String pageActions(@PathVariable String action) {
        switch (action) {
            case "first":pagedListHolder.setPage(0);
                break;
            case "prev":pagedListHolder.previousPage();
                break;
            case "next":pagedListHolder.nextPage();
                break;
            case "last":pagedListHolder.setPage(pagedListHolder.getPageCount());
                break;
        }
        return "redirect:/users/listUsers";
    }
}
