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
      errors.put("id","아이디");
   }
   if (Validator.isEmpty(member.getName())){
      errors.put("name","이름");
   }
   if (Validator.isEmpty(member.getEmail()) || !Validator.isEmail(member.getEmail())){
      errors.put("email","이메일");
   }

   if (Validator.isEmpty(member.getPasswd())){
      errors.put("passwd","비밀번호");
   }

   if (Validator.isEmpty(member.getPhoneNum())){
      errors.put("phone","핸드폰 번호");
   }

   if (Validator.isEmpty(member.getDefaultAddress()) || Validator.isEmpty(member.getDetailAddress())){
      errors.put("address","주소");
   }

   if (Validator.isEmpty(member.getPostNum())){
      errors.put("pNum","우편번호");
   }



   if (!errors.isEmpty()){
      StringBuilder stringBuilder = new StringBuilder();
      for (String error : errors.values()) {
         stringBuilder.append(error).append("\\n");
      }
      stringBuilder.append("올바르지 않습니다. 다시 확인하여주세요");


%>

<script>
   alert("<%= stringBuilder.toString()%>");
   history.back();
</script>

<%
      return;
   }

   MemberService memberService = new MemberService();
   Member registerMember = memberService.registerMember(member);
   session.setAttribute("member", registerMember);

%>
<c:redirect url="/member/result.jsp"/>

