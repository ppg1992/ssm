package com.ppg.ssm.controller;

import com.ppg.ssm.entity.User;
import com.ppg.ssm.service.UserService;
import com.ppg.ssm.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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
    public User selectOne(Integer id,HttpServletRequest request,HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies!=null&&cookies.length>0){
            for (int i = 0; i < cookies.length; i++) {
                System.out.println(cookies[i].getName()+":"+cookies[i].getValue()+"=="+cookies[i].getDomain());
            }
        }
//        response.setHeader("P3P","CP=\"NON DSP COR CURa ADMa DEVa TAIa PSAa PSDa IVAa IVDa CONa HISa TELa OTPa OUR UNRa IND UNI COM NAV INT DEM CNT PRE LOC\"");
        response.addHeader("P3P", "CP=CAO PSA OUR");
        Cookie cookie = new Cookie("token", "theKEY");
        response.addCookie(cookie);
        return this.userService.queryById(id);
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOneName")
    @ResponseBody
    public String selectOneName(Integer id,HttpServletRequest request) {
        return this.userService.queryById(id).getName();
    }

    /**
     * 页面显示数据
     * @param response
     * @return
     */
    @GetMapping("userInfo")
    public String userInfo(HttpServletResponse response) {
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

    @PostMapping("queryAllPlus")
    @ResponseBody
    public List<User> queryAllPlus(@RequestBody UserVO userVO){
        List<User> users = userService.queryAllPlus(userVO);
        return users;
    }
}