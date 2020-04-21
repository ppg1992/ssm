package com.ppg.ssm.controller;

import com.ppg.ssm.entity.User;
import com.ppg.ssm.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * (User)表控制层
 *
 * @author makejava
 * @since 2020-04-17 14:00:11
 */
@Controller
@RequestMapping("user")
@Slf4j
public class UserController {
    /**
     * 服务对象
     */
    @Resource
    private UserService userService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    @ResponseBody
    public User selectOne(Integer id,HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies!=null&&cookies.length>0){
            for (int i = 0; i < cookies.length; i++) {
                System.out.println(cookies[i].getName()+":"+cookies[i].getValue());
            }
        }
        return this.userService.queryById(id);
    }

    /**
     * 页面显示数据
     * @param response
     * @return
     */
    @GetMapping("userInfo")
    public String userInfo(HttpServletResponse response) {
        response.addCookie(new Cookie("token","theKEY"));
        return "userInfo";
    }

    /**
     * 插入一条数据
     * @param user
     * @return
     */
    @PostMapping("insertOne")
    @ResponseBody
    public User insertOne(@RequestBody User user){
        user = userService.insert(user);
        return user;
    }

}