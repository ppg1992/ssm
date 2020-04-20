package com.ppg.ssm.controller;

import com.ppg.ssm.entity.User;
import com.ppg.ssm.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
    public User selectOne(Integer id) {
        return this.userService.queryById(id);
    }


    @GetMapping("userInfo")
    public String userInfo() {
        return "userInfo";
    }

}