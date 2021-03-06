package com.scitmaster.easycodingu.person.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scitmaster.easycodingu.person.vo.Person;

@Repository
public class PersonDAO {
   
   private static final Logger logger = LoggerFactory.getLogger(PersonDAO.class);

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
    * Login
    * @param id 사용자가 입력한 ID
    * @return Person ID로 SELECT 해 온 Person 한 명의 모든 정보
    * */ 
   public Person selectPerson(String id){
      logger.info("selectPerson START");
      System.out.println("ID : "+id);
      PersonMapper mapper = sqlSession.getMapper(PersonMapper.class);
      Person person = mapper.selectPerson(id);
      System.out.println("Person : " + person);
      logger.info("selectPerson END");
      return person;
   }
   
   
   /**
    * ID 찾기
    * @param Email 사용자가 ID를 찾기 위해 입력한 email
    * @return Person Email로 SELECT 해 온 Person 한 명의 모든 정보
    * */
   public Person selectId(String email){
      logger.info("selectId START");
      System.out.println("email : " + email);
      
      PersonMapper mapper = sqlSession.getMapper(PersonMapper.class);
      Person person = mapper.selectId(email);
      
      System.out.println("Person : " + person);
      logger.info("selectId END");
      return person;
   }
   
   
   
   /**
    * 180328 회원가입 (주 지호)
    * 회원가입
    * @param person 회원정보를 넘겨주고 가입을 하고 싶다
    * @return int 회원가입 여부를 숫자로 받아오고 싶다
    * */
      public int insertJoin(Person person) {
         PersonMapper mapper = sqlSession.getMapper(PersonMapper.class);
         
         //내용을 채우시오
         int result = 0;
         
         try{
            result = mapper.insertJoin(person);
         }catch(Exception e){
            e.printStackTrace();
         }
         return result;
      }
      
      
      
      /**
      * Pw 찾기
      * @param Id 사용자가 Pw를 찾기 위해 입력한 id
      * @return Person Id로 SELECT 해 온 Person 한 명의 모든 정보
      * */
     public Person selectPw(String id){
        logger.info("selectPw START");
        System.out.println("Id"+id);
        
        PersonMapper mapper = sqlSession.getMapper(PersonMapper.class);
        Person person = mapper.selectPw(id);
        
        System.out.println("Person:"+person);
        logger.info("selectPw END");
        return person;
     }
     
     /**
      * Pw 재설정
      * @param Person PersonRestController의 resetPw에서 select해 온 person정보 
      * */
     public int updatePw(Person person){
        logger.info("updatePw START");
        System.out.println(person);
        PersonMapper mapper = sqlSession.getMapper(PersonMapper.class);
        
        try {
           mapper.updatePw(person);
        } catch (Exception e) {
           e.printStackTrace();
           return 0;
        }
        logger.info("updatePw END");
        return 1;
     }
     
     
     /**
      * 마이페이지 정보수정
      * @param Person PersonRestController의 resetPw에서 select해 온 person정보 
      * */
	public int updateUser(Person person){
		logger.info("updateUser START");
		int result = 0;
		
		PersonMapper mapper = sqlSession.getMapper(PersonMapper.class);
		
		try {
		  result = mapper.updateUser(person);
		} catch (Exception e) {
		   e.printStackTrace();
		   
		}
		logger.info("updateUser END");
		    return result;
	}
   
         	
         	 
     /**
      * 마이페이지 정보수정
      * @param Person PersonRestController의 resetPw에서 select해 온 person정보 
      * */
	public int updateProfile(Person person){
		logger.info("updateProfile START");
		int result = 0;
		
		PersonMapper mapper = sqlSession.getMapper(PersonMapper.class);
		
		try {
		  result = mapper.updateProfile(person);
		} catch (Exception e) {
		   e.printStackTrace();
		   
		}
		logger.info("updateUser END");
		    return result;
	}	 
     	
    /**
     * 레벨업
     * @param 로그인한 아이디
     */
	public void updateGrade(String id){
		logger.info("레벨업 시작");
		PersonMapper mapper = sqlSession.getMapper(PersonMapper.class);
		 
		try{
			mapper.updateGrade(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("레벨업 종료");
	}

}