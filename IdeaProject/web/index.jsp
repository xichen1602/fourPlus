<%@ page import="test.Person" %>
<%@ page import="java.awt.*" %>
<%@ page import="static myjavaclass.operation4.Answer" %>
<%@ page import="static myjavaclass.operation4.inttopic" %>
<%@ page import="static myjavaclass.operation4.operation" %>
<%@ page contentType="text/html; pageEncoding=gb2312" %>
<%
    request.setCharacterEncoding("gb2312");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8" %>

<%--
  Created by IntelliJ IDEA.
  User: Light_Spirit3
  Date: 2018/10/22
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>

        <jsp:useBean id="ca" class="myjavaclass.checkAns" scope="page"/>
        <jsp:useBean id="person" class="test.Person" scope="page"/>
        <jsp:useBean id="random" class="myjavaclass.Random"/>
        <jsp:useBean id="operationS4" class="myjavaclass.operation4" scope="application"/>

<!DOCTYPE HTML>
<html>
<head>
    <style>

        input {
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left: 5px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
            ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
            .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
        }

        input:focus {
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
            rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
            rgba(102, 175, 233, .6)
        }
    </style>
    <style>
        .big_box {
            width: 40em;
            height: 40em;
            float: left;
            padding: 1em;
            border: 1em solid transparent;
            background: linear-gradient(white, white) padding-box,
            repeating-linear-gradient(-45deg,
                    red 0, red 12.5%,
                    transparent 0, transparent 25%,
                    #58a 0, #58a 37.5%,
                    transparent 0, transparent 50%)
            0 / 5em 5em;
        }
        .big_box input {
            margin-left: 60px;
        }
    </style>
    <title>四则运算升级版</title>
    <script>

        function change1() {
            var Red = document.getElementById("change_style");
            Red.style.backgroundImage = "url('c.jpg')";
        }

        function change2() {
            var Blue = document.getElementById("change_style");
            Blue.style.backgroundImage = "url('b.jpg')";
        }

        function change3() {
            var Green = document.getElementById("change_style");
            Green.style.backgroundImage = "url('a.jpg')";
        }



        function actt() {
            var tNum = document.getElementById("count").value;

            <%
                String[] outputTopic =new String[]{"","","","",""};

//                String[] picpath = (String[])session.getAttribute("s1Value");
                int tNum=0;

            //    	 	out.println("couter="+application.getAttribute("counter"));
            //			application.setAttribute("counter","100000");
                            /*String strnum=null;
                            strnum=application.getAttribute("counter").toString();
                            out.println("couter="+application.getAttribute("counter"));
                            int icount=0;//是用来临时保存Counter的值
                            icount=Integer.valueOf(strnum).intValue();
                            icount++;
                            application.setAttribute("counter",Integer.toString(icount));*/

                    tNum =5;
                    application.setAttribute("counter", tNum);
                    String s1[][] = new String[6][7];
                    int num = tNum;
                    String output = "";
                    s1 = inttopic(num);

                    session.setAttribute("s1Value",s1);

                    for (int numj = 0; numj < tNum; numj++) {
                        for (int numi = 0; numi < 6; numi++) {
                            output = s1[numj][numi];
                            outputTopic[numj] += output;
                        }
                    }

            %>
            //在此段代码设置题目
            var sr1 = "<%=outputTopic[0]%>";
            var sr2 = "<%=outputTopic[1]%>";
            var sr3 = "<%=outputTopic[2]%>";
            var sr4 = "<%=outputTopic[3]%>";
            var sr5 = "<%=outputTopic[4]%>";
            var s1 ="<%=s1%>";
            document.getElementById("topic1").value = sr1;
            document.getElementById("topic2").value = sr2;
            document.getElementById("topic3").value = sr3;
            document.getElementById("topic4").value = sr4;
            document.getElementById("topic5").value = sr5;
            document.getElementById("s1Value").value = s1;
        }
    </script>


</head>
<body>
<%--使用getXxx()方法获取对象的属性值--%>
<%--<%--%>
<%--person.setName("1235");--%>
<%--person.setSex("男");--%>
<%--person.setAge(20);--%>
<%--person.setMarried(false);%>--%>

<%--<h2>姓名：<%=person.getName()%></h2>--%>
<%--<h2>性别：<%=person.getSex()%></h2>--%>
<%--<h2>年龄：<%=person.getAge()%></h2>--%>
<%--<h2>已婚：<%=person.isMarried()%></h2>--%>
<%--<input type="button" value="跳转" onclick = "window.location.href = 'test.jsp'"/>--%>

<form name="form1" method="post" action="test1.jsp" >
    <input type="hidden" name="toTest" value="<%=s1%>"/>
    <div class="big_box" id="change_style">
        <input type='hidden' name='s1Value' id='s1Value' value=''>
        <div class="listcon">
            <ul>
                <li class="c1"><input type="button" value="主题1" onclick="change1()"></li>
                <li class="c2"><input type="button" value="主题2" onclick="change2()"></li>
                <li class="c3"><input type="button" value="主题3" onclick="change3()"></li>
            </ul>
        </div>

        <div id="gjdiv" class="gjc">
            <input id="count" type="text" name="count" value="" placeholder="请输入题目数目"/>
            <input id="time" type="text" name="time" value="" placeholder="请输入答题时间"/>
            <input id="sub1" type="submit" value="提交" name="sub1" onclick="actt()"/>
        </div>
        <input type="hidden" name="topic1"  id = "topic1" value="1" >
        <input type="hidden" name="topic2"  id = "topic2" value="1" >
        <input type="hidden" name="topic3"  id = "topic3" value="1" >
        <input type="hidden" name="topic4"  id = "topic4" value="1" >
        <input type="hidden" name="topic5"  id = "topic5" value="1" >
    </div>
</form>
   &nbsp;
</body>


</html>
