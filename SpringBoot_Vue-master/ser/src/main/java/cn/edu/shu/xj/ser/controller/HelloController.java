package cn.edu.shu.xj.ser.controller;


import cn.edu.shu.xj.ser.entity.Student;
import cn.edu.shu.xj.ser.entity.User;
import cn.edu.shu.xj.ser.service.impl.StudentService;
import cn.edu.shu.xj.ser.service.impl.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "测试接口")
@RestController
public class HelloController {

    @Autowired
    StudentService studentService;

    @Autowired
    UserService userService;

    //以上是助教的调试代码
    @ApiOperation(value = "查询学生")
    @GetMapping("/query")
    public Student queryStudent(Integer sid){
        Student oneStudent = studentService.findOneStudent(sid);
        return oneStudent;
    }

    @ApiOperation(value = "查询学生年龄")
    @GetMapping("/queryAge")
    public Integer queryStudentAge(String name){
        Integer age = studentService.queryStudentAge(name);
        return age;
    }

    @ApiOperation(value = "获取学生列表")
    @GetMapping("/query/StuList")
    public List<Student> queryStudentList(String name){
        return studentService.list();
    }

    @ApiOperation(value = "获取用户列表")
    @GetMapping("/query/UserList")
    public List<User> queryUserList(){
        return userService.list();
    }
}
