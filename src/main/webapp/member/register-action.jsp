<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ezen.member.service.MemberService" %>
<%@ page import="com.ezen.member.dto.Member" %>
<%@ page import="com.ezen.member.dao.MemberDao" %>

<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.ezen.mall.web.common.validate.Validator" %>


<%request.setCharacterEncoding("utf-8");%>
<%--bean 생성--%>
<jsp:useBean id="member" class="com.ezen.member.dto.Member" scope="session"/>
<jsp:setProperty name="member" property="*"/>
<%--<jsp:setProperty name="member" property="picture" value="defalut.jpg"/>--%>


<%
   // 입력 데이터 데이터 유효성 검증 추가
   Map<String , String> errors = new HashMap<>();
   if (Validator.isEmpty(member.getId())){
      errors.put("id","[서버] 아이디는 필수 입력 사항입니다.");
   }
   if (Validator.isEmpty(member.getName())){
      errors.put("name","[서버] 이름은 필수 입력 사항입니다.");
   }
   if (Validator.isEmpty(member.getEmail())){
      errors.put("email","[서버] 이메일은 필수 입력 사항입니다.");
   }
   if (Validator.isEmpty(member.getPasswd())){
      errors.put("passwd","[서버] 비밀번호는 필수 입력 사항입니다.");
   }

   if (Validator.isEmpty(member.getPhoneNum())){
      errors.put("phone","[서버] 핸드폰 번호는 필수 입력 사항입니다.");
   }


//   if (!errors.isEmpty()){
//      request.setAttribute("errors",errors);
//      request.getRequestDispatcher("../member/register.jsp").forward(request,response);
//   }

   MemberService memberService = new MemberService();
   Member registerMember = memberService.registerMember(member);
   session.setAttribute("member", registerMember);
%>
<c:redirect url="/member/result.jsp"/>

