package com.ezen.member.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * 회원 관련 정보 저장
 */
public class Member {
    private String id;
    private String passwd;
    private String name;
    private String email;
    private String phoneNum;
    private String defaultAddress;
    private String detailAddress;
    private String postNum;
    private String regdate;
    private List<Order> orders;

    public Member(){}

    public Member(String id, String passwd, String name, String email, String phoneNum) {
        this.id = id;
        this.passwd = passwd;
        this.name = name;
        this.email = email;
        this.phoneNum = phoneNum;
    }


    public Member(String id, String passwd, String name, String email, String phoneNum, String defaultAddress, String detailAddress, String postNum, String regdate) {
        this.id = id;
        this.passwd = passwd;
        this.name = name;
        this.email = email;
        this.phoneNum = phoneNum;
        this.defaultAddress = defaultAddress;
        this.detailAddress = detailAddress;
        this.postNum = postNum;
        this.regdate = regdate;
    }

    public Member(String id, List<Order> orders) {
        this.id = id;
        this.orders = orders;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getDefaultAddress() {
        return defaultAddress;
    }

    public void setDefaultAddress(String defaultAddress) {
        this.defaultAddress = defaultAddress;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getPostNum() {
        return postNum;
    }

    public void setPostNum(String postNum) {
        this.postNum = postNum;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id='" + id + '\'' +
                ", passwd='" + passwd + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", defaultAddress='" + defaultAddress + '\'' +
                ", detailAddress='" + detailAddress + '\'' +
                ", postNum='" + postNum + '\'' +
                ", regdate='" + regdate + '\'' +
                ", orders=" + orders +
                '}';
    }

    public static void main(String[] args) {
        // Order 객체 생성 및 설정
        Order order1 = new Order();
        order1.setOrderId("1");
        order1.setOrderDate("2024-04-12");
        order1.setOrderNum(1);
        order1.setTotalPrice("10000");
        order1.setItemName("상품1");

        Order order2 = new Order();
        order2.setOrderId("2");
        order2.setOrderDate("2024-04-12");
        order2.setOrderNum(2);
        order2.setTotalPrice("20000");
        order2.setItemName("상품2");

// Order 객체들을 리스트에 추가
        List<Order> orders = new ArrayList<>();
        orders.add(order1);
        orders.add(order2);
// 추가적인 Order 객체들을 리스트에 추가할 수 있음

// Member 객체에 주문 리스트 설정
        Member member = new Member();
        member.setId("member1");
// member에 대한 추가적인 설정을 계속...
        member.setOrders(orders); // 여기에서 주문 리스트를 Member 객체에 설정

        for (Order order : member.getOrders()) {
            System.out.println(order.toString());
        }
    }
}
