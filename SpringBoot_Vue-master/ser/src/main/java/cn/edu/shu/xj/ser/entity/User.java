package cn.edu.shu.xj.ser.entity;

import lombok.Data;

import java.util.*;

@Data
public class User {
    private String user_id;
    private String user_pwd;
    private String user_name;
    private String sex;
    private String user_tel;
    private String email;
    private String user_city;
    private Date reg_time;
    private String is_vip;
    private Date vip_due_date;
    private Double u_balance;
}
