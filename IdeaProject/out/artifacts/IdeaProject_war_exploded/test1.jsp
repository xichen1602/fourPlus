
<%@ page import="static myjavaclass.operation4.inttopic" %><%--
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

    <title>做题</title>
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
        }
            //利用request.serAttribute方法传递输入的答案到chaekAns界面
            <% String[][] s1 = new String[100][7];
            String[][] s1Values = (String[][]) session.getAttribute("s1Value");
            s1= s1Values;
            String as1 ="";String as2 ="";String as3 ="";String as4 ="";String as5 ="";
            request.setAttribute("answer1",as1);
            request.setAttribute("answer2",as2);
            request.setAttribute("answer3",as3);
            request.setAttribute("answer4",as4);
            request.setAttribute("answer5",as5);
            %>



    </script>

</head>
<body>
<span f id="mytime"></span>
<p id = "txt"></p>
<form name="form1" method="post" action="checkAns.jsp" >
    <!--题目答案框-->

    <div  class="box7" id="change_style">
<input class="jj" type="text" name="topic1"  id = "topic1" readonly="value"  value="<%=request.getParameter("topic1")%>" ><input type="text" name="answer1"  id = "answer1"><br>
<input type="text" name="topic2"  id = "topic2" value="<%=request.getParameter("topic2")%>" ><input type="text" name="answer2"  id = "answer2"><br>
<input type="text" name="topic3"  id = "topic3" value="<%=request.getParameter("topic3")%>" ><input type="text" name="answer3"  id = "answer3"><br>
<input type="text" name="topic4"  id = "topic4" value="<%=request.getParameter("topic4")%>" ><input type="text" name="answer4"  id = "answer4"><br>
<input type="text" name="topic5"  id = "topic5" value="<%=request.getParameter("topic5")%>" ><input type="text" name="answer5"  id = "answer5"><br>
        <a href="checkAns.jsp">
            <input type="submit" nmae="submit1" id="anniu"  value="提交答案"/>
        </a>
    </div>
</form>
<%--<%--%>
    <%--session.setAttribute("s1Value",s1);--%>
<%--%>--%>

</body>
</html>