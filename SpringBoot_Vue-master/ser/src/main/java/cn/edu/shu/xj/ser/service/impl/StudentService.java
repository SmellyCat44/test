package cn.edu.shu.xj.ser.service.impl;


import cn.edu.shu.xj.ser.entity.Student;
import cn.edu.shu.xj.ser.mapper.StudentMapper;
import cn.edu.shu.xj.ser.service.IStudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class StudentService extends ServiceImpl<StudentMapper,Student> implements IStudentService {

    @Autowired
    StudentMapper studentMapper;

    //找到该ID的学生信息
    public Student findOneStudent(Integer sid){
        return studentMapper.findOneStudent(sid);
    }

    public Integer queryStudentAge(String name){
        return studentMapper.queryStudentAge(name);
    }

    //获取学生列表

}
//具体实现方法写在此类中