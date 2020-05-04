<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
	String todayStr = simple.format(new Date());
%>