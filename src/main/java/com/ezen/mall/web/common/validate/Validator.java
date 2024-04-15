package com.ezen.mall.web.common.validate;

/**
 * 데이터 유효성 검증을 위한 유틸리티 클래스
 */
public class Validator {
    /**
     * 데이터 입력 여부 검증
     * @param value 검증하고자 하는 문자열
     * @return 값이 있을 경우 true, 없을 경우 false
     */
    public static boolean isEmpty(String value){
        if(value == null || value.trim().length() == 0){
            return true;
        }
        return false;
    }

    /**
     * 이메일 형식 검증
     * @param email 검증하고자 하는 이메일 문자열
     * @return 형식에 맞을 경우 true, 아닐 경우 false
     */
    public static boolean isEmail(String email) {
        String emailV = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
        return email.matches(emailV);
    }


    public static void main(String[] args) {
        System.out.println(isEmpty(null));
        System.out.println(isEmpty(""));
        System.out.println(isEmpty(" "));
    }


}
