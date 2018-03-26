package com.scitmaster.easycodingu.person.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scitmaster.easycodingu.person.vo.Person;

@Repository
public class PersonDAO {

	@Autowired
	SqlSession sqlSession;

	public void insertPerson(Person person){
		PersonMapper mapper = sqlSession.getMapper(PersonMapper.class);
		
		try{
			mapper.insertPerson(person);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 회원 가입 처리
	 * @param member 사용자가 입력한 가입 정보
	 */
	/*public int insertMember(Member member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		//내용을 채우시오
		int result = 0;
		
		try{
			result = mapper.insertMember(member);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}*/
}
