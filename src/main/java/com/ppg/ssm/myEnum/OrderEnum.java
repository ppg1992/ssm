package com.ppg.ssm.myEnum;

/**
 * 排序选择
 */
public enum OrderEnum {
    ASC,DESC;

    public static void main(String[] args) {
        System.out.println("ASC".equals(OrderEnum.ASC.name()));
        System.out.println(OrderEnum.DESC.name());
    }
}
