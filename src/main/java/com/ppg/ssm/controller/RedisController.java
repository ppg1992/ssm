package com.ppg.ssm.controller;

import com.ppg.ssm.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping(value = "redis",produces = "text/plain;charset=utf-8")
public class RedisController {
    @Resource
    private RedisService redisService;

    @Resource
    private RedisTemplate redisTemplate;

    @GetMapping(value = "getByKey")
    public Object getByKey(@RequestParam("key") String key){
        Object s = redisService.get(key);
        if (s==null){
            return null;
        }
        return s;
    }

}
