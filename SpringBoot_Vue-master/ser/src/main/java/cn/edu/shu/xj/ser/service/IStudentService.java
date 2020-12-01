package cn.edu.shu.xj.ser.service;

import cn.edu.shu.xj.ser.entity.Student;
import com.baomidou.mybatisplus.extension.service.IService;

//方法 入参 回参
//接口写在这里
public interface IStudentService extends IService<Student> {
    //找到该ID的学生信息
    public Student findOneStudent(Integer sid);
    //找到该ID的学生年龄
    public Integer queryStudentAge(String name);
}
