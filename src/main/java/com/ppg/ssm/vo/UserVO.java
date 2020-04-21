package com.ppg.ssm.vo;

import com.ppg.ssm.entity.OrderSetting;
import com.ppg.ssm.entity.User;

import java.util.List;

public class UserVO extends User {
    //默认存第一页开始
    private Integer offset=0;
    //默认每页10条数据
    private Integer limit=10;
    //排序字段及排序规则
    private List<OrderSetting> orders;

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public List<OrderSetting> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderSetting> orders) {
        this.orders = orders;
    }
}
