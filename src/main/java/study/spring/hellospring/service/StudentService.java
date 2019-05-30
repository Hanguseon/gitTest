package study.spring.hellospring.service;

import java.util.List;



import study.spring.hellospring.model.Student;


public interface StudentService {
	/**
	 * 학생 등록하기
	 * @param professor 저장할 정보를 담고있는 Beans
	 * @throws Exception
	 */
	public void addStudent(Student student) throws Exception;
	
	
	/**
	 * 학생 수정하기
	 * @param professor 수정할 정보를 담고있는 Beans
	 * @throws Exception
	 */
	public void editStudent(Student student) throws Exception;
	
	/**
	 * 학생 삭제하기
	 * @param professor 삭제할 교수의 일련번호를 담고있는 Beans
	 * @throws Exception
	 */
	public void deleteStudent(Student student) throws Exception;
	
	/**
	 * 학생 상제 조회
	 * @param professor 조회할 교수의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Student getStudentItem(Student student) throws Exception;
	
	/**
	 * 학생 목록조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Student> getStudentList(Student student) throws Exception;
	
	
}
