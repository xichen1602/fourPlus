<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/28 0028
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
<html>
<head>
    <title>Title</title>
</head>
<body bgcolor=#FFE4C4>
<h1 style="font-family:宋体;font-size:5em">正确答案</h1>
<%
    String solution[]=new String[100];
    String yoursolution[]={};
    //接收客户端传递过来的参数
    String[][] s1Values = (String[][]) session.getAttribute("s1Value");//用于接收题目

    for(int i=0 ; i<6;i++) {

       solution[i] = String.valueOf(s1Values[i][6]);//接收传过来的答案
    }
    int sumright=0,sumerror=0,empty=0;
    for(int i=0;i<s1Values.length;i++)
    {
        request.setCharacterEncoding("UTF-8");
        for(int j=0;j<s1Values.length-1;j++)
        {
        out.print(s1Values[i][j]);//正确的算式
        yoursolution[i] = request.getParameter("answer1");//你的答案
        out.println(yoursolution[i]);
%>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<%
    out.println("正确答案是： ");
    out.println(s1Values[i][6]);//正确的答案
%>

&nbsp;&nbsp;&nbsp;&nbsp;

<%
        int num1=0;
        int x=1;
        for(int m=0;m<yoursolution[i].length();m++)
        {
            num1+=(yoursolution[i].charAt(yoursolution[i].length()-m-1)-'0')*x;
            x*=10;
        }//字符串类型的数字转换为整型 用于和正确答案比较 因为从出题界面接受的答案是字符串类型
        if(yoursolution[i].equals(""))
        {
            out.println("你没有回答哦！");
            empty++;
        }
        else if(yoursolution[i].equals(s1Values[i][6]))
        {
            sumright++;
            out.println("恭喜你！回答正确！");
        }
        else
        {
            sumerror++;
            out.println("回答错误，再接再厉！");
        }
        out.println("<br/>");//换行
    }
    out.println("回答正确了"+sumright+"道题！");
    out.println("<br/>");//换行
    out.println("回答错误了"+sumerror+"道题！");
    out.println("<br/>");//换行
    out.println("没有回答"+empty+"道题！");
    out.println("<br/>");//换行
%>
<%
    //接收客户端传递过来的参数
    arithmetic newdemo=new arithmetic();
    newdemo=(arithmetic)session.getAttribute("jieshou");//用于接收CHUti界面传过来的数 （对象）
    String []yoursolution=new String[newdemo.shumu];//接收传过来的文本框的答案
    int sumright=0,sumerror=0,empty=0;
    for(int i=0;i<newdemo.shumu;i++)
    {
        request.setCharacterEncoding("UTF-8");
        out.print(newdemo.suanshi[i]);//正确的算式
        yoursolution[i] = request.getParameter("result["+i+"]");//你的答案
        out.println(yoursolution[i]);
%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
    out.println("正确答案是： ");
    out.println(newdemo.answer[i]);//正确的答案
%>
&nbsp;&nbsp;&nbsp;&nbsp;
<%
        int num1=0;
        int x=1;
        for(int m=0;m<yoursolution[i].length();m++)
        {
            num1+=(yoursolution[i].charAt(yoursolution[i].length()-m-1)-'0')*x;
            x*=10;
        }//字符串类型的数字转换为整型 用于和正确答案比较 因为从出题界面接受的答案是字符串类型
        if(yoursolution[i].equals(""))
        {
            out.println("你没有回答哦！");
            empty++;
        }
        else if(num1==newdemo.answer[i])
        {
            sumright++;
            out.println("恭喜你！回答正确！");
        }
        else
        {
            sumerror++;
            out.println("回答错误，再接再厉！");
        }
        out.println("<br/>");//换行
    }
    out.println("回答正确了"+sumright+"道题！");
    out.println("<br/>");//换行
    out.println("回答错误了"+sumerror+"道题！");
    out.println("<br/>");//换行
    out.println("没有回答"+empty+"道题！");
    out.println("<br/>");//换行
%>

<a href="chutishumu.jsp">退出</a>
</body>
</html>