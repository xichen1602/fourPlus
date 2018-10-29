
<%@ page import="static myjavaclass.operation4.inttopic" %>
<%@ page import="javax.websocket.Session" %><%--
  Created by IntelliJ IDEA.
  User: Light_Spirit3
  Date: 2018/10/22
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="ca" class="myjavaclass.checkAns" scope="page"/>
<jsp:useBean id="person" class="test.Person" scope="page"/>
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
        .box7 {

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

    </style>
    <title>Title</title>
    <script type="text/javascript" language="javascript">
        var second=<%=request.getParameter("time")%>;
        function remaintime(){
            var s=second%60;
            var mi=(second-s)/60%60;
            str="答题剩余时间还有："+mi+"分"+s+"秒";
            document.getElementById("mytime").innerText=str.toString();
            if(s==20){
                alert("距离答题结束还有20秒！");
            }
            if(mi==0&&s==0){

                window.location("checkAns.jsp");

            }
            second--;
        }
        setInterval("remaintime()",1000);
    </script>

    <script Language="JavaScript">
        function Change_red() {
            var Red = document.getElementById("change_style");
            Red.style.backgroundImage = "url('c.jpg')";
        }

        function Change_blue() {
            var Blue = document.getElementById("change_style");
            Blue.style.backgroundImage = "url('b.jpg')";
        }

        function Change_green() {
            var Green = document.getElementById("change_style");

            Green.style.backgroundImage = "url('a.jpg')";
        }
        function timeCount()
        {
            document.getElementById("txt").innerHTML=num1-c;
            c=c+1;
            t=setTimeout("timeCount()",1000);
            if(num1==c-1)
            {
                clearTimeout(t);
                alert("时间到了！");
                load();
            }
        }
        function load(){
            document.getElementById("anniu").click();
        }
        window.onload =function(){
            timeCount();//onload 事件会在页面或图像加载完成后立即发生。
        };

        function checkAnsTs() {

            var score =0;
            for(var i=0;i<6;i++){

                <%--if(<%=ca.check(as ,s1[0][6])%>){--%>
                <%--score++;alert(score+"途中");--%>
                <%--}else {alert(answer1)}--%>
                <%--}else--%>
                <%--{alert(answer1)}--%>
                <%--document.getElementById("score").value = score;--%>
                <%--alert(score+"结果");--%>
            }
        }
    </script>

</head>
<body >
<td style="font-family:华文新魏;font-size:1em;width:500px" align="right">倒计时：</td>
<p id = "txt"></p>
<div id="gjdiv" class="gjc">
    <input id="count" type="text" name="count " value="0" placeholder="请输入题目数目"/>
    <input id="sub1" type="submit" value="提交" name="sub1" onclick="actt()"/>
</div>

<div class="box7" id="change_style">
    <span id="mytime"></span>
    <input type='hidden' name='s1ValueT' id='s1ValueT' value=''>

    <input type="button" value="变为红色" onclick="Change_red()">
    <input type="button" value="变为蓝色" onclick="Change_blue()">
    <input type="button" value="变为绿色" onclick="Change_green()">

    <form name="form1" method="post" action="checkAns.jsp">
        <input type="text" name="topic1"  id = "topic1" value="<%=request.getParameter("topic1")%>" ><input type="text" name="answer1"  id = "answer1" value="23123213" placeholder="请填写答案"><br>
        <input type="text" name="topic2"  id = "topic2" value="<%=request.getParameter("topic2")%>" ><input type="text" name="answer2"  id = "answer2" value="" placeholder="请填写答案"><br>
        <input type="text" name="topic3"  id = "topic3" value="<%=request.getParameter("topic3")%>" ><input type="text" name="answer3"  id = "answer3" value="" placeholder="请填写答案"><br>
        <input type="text" name="topic4"  id = "topic4" value="<%=request.getParameter("topic4")%>" ><input type="text" name="answer4"  id = "answer4" value="" placeholder="请填写答案"><br>
        <input type="text" name="topic5"  id = "topic5" value="<%=request.getParameter("topic5")%>" ><input type="text" name="answer5"  id = "answer5" value="" placeholder="请填写答案"><br>
    </form>

    <a href="checkAns.jsp">
        <input type="submit" nmae="submit1" id="anniu"  value="提交答案"/>
    </a>
</div>

<%--<input type='hidden' name='s1Value' id='s1Value' value=''>//题目数组--%>
<%--<input type="text" name="score" id ="score" value="">--%>

<script>
    <%=request.getParameter("topic1")%><br>
    <% String[][] s1 = new String[100][7];
          String[][] s1Values = (String[][]) session.getAttribute("s1Value");
          s1= s1Values;

          String as1 =request.getParameter("answer1");
          String as2 =request.getParameter("answer2");
          String as3 =request.getParameter("answer3");
          String as4 =request.getParameter("answer4");
          String as5 =request.getParameter("answer5");
          %>
    <%
        session.setAttribute("s1Value",s1);
    %>

    var s1valueT =<%=s1[0][6]%>;
    alert(s1valueT);
</script>
</body>
</html>
<script>
    <%
//            String  asd =  (String) session.getAttribute("answer1");
            session.setAttribute("as1",request.getParameter("answer1"));

            out.print("<br/>");
            String as1T=(String) session.getAttribute("as1");
            out.print(as1T);
            as1= request.getParameter("answer1");
            as2= request.getParameter("topic1");
            request.setAttribute("answer1",as1);
            request.setAttribute("answer2",as2);
            request.setAttribute("answer3",as3);
            request.setAttribute("answer4",as4);
            request.setAttribute("answer5",as5);

    %>
</script>