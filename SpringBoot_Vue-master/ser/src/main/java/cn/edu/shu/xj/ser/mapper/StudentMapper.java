package cn.edu.shu.xj.ser.mapper;


import cn.edu.shu.xj.ser.entity.Student;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface StudentMapper extends BaseMapper<Student> {

    /**
     * @param sid
     * @return
     */
    @Select("select * from student where id =#{sid}")
    Student findOneStudent(@Param("sid") Integer sid);

    @Select("select age from student where name =#{name}")
    Integer queryStudentAge(@Param("name") String name);
}
