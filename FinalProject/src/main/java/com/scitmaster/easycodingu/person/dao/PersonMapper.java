package com.scitmaster.easycodingu.person.dao;

import com.scitmaster.easycodingu.person.vo.Person;

public interface PersonMapper {

   /**
    * insertPerson
    * 회원가입
    * @param person 
    * */
   public void insertPerson(Person person);
   
   /**
    * selectPerson
    * Login에 사용
    * @param id 
    * @return Person
    * */
   public Person selectPerson(String id);
   
   /**
    * selectId
    * ID찾기
    * @param email 
    * @return Person
    * */
   public Person selectId(String email);
   
   
   /**
    * 180328 회원가입 (주 지호)
    * insertJoin
    * 회원가입
    * @param person 
    * @return int
    * */
   public int insertJoin(Person person);
   
   
      /**
       * selectPw
       * Pw찾기
       * @param id
       * @return Person
       * */
      public Person selectPw(String id);
      
      
      /**
       * updatePw
       * Pw재설정
       * @param person
       * */
      public int updatePw(Person person);
      
      
      /**
       * updateUser
       * 마이페이지 개인정보 수정
       * @param person
       * */
      public int updateUser(Person person);
      
      
      /**
       * updateUser
       * 마이페이지 이미지 수정
       * @param person
       * */
      public int updateProfile(Person person);
      
      /**
       * updateGrade
       * 레벨업
       * @param id
       */
      public void updateGrade(String id);

      
   
}