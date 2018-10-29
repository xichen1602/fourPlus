<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/28 0028
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<html>
<head>
    <title>查看答案</title>

    <style>
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
</head>
<body>
<div class="box7" id="change_style">
    <%
        String solution[]=new String[100];
        String[] yoursolution=new String[5];
        //接收客户端传递过来的参数
        String[][] s1Values = (String[][]) session.getAttribute("s1Value");//用于接收题目
        String[] as =new String[]{};
        int tNum=5;
        String[] outputTopic =new String[]{"","","","",""};
        String[] outputans =new String[]{"","","","",""};
        String output = "";
        String output1 = "";
        out.print("正确答案：");out.println("<br/>");
        for (int numj = 0; numj < tNum; numj++) {
            for (int numi = 0; numi < 6; numi++) {
                output = s1Values[numj][numi];
                outputTopic[numj] += output;
                out.println();
            }
            output = s1Values[numj][6];
            outputans[numj] += String.format("%.2f",Float.parseFloat(output));
            out.println(outputTopic[numj]);
            out.println(outputans[numj]);
            out.println();
            out.print("<br/>");
        }
        yoursolution[0] = (String) request.getParameter("answer1");
        yoursolution[1] = (String) request.getParameter("answer2");
        yoursolution[2] = (String) request.getParameter("answer3");
        yoursolution[3] = (String) request.getParameter("answer4");
        yoursolution[4] = (String) request.getParameter("answer5");

        String []asT = new String[5];


        out.print("你的答案");out.println("<br/>");
        out.println("（1）"+yoursolution[0]);out.println("<br/>");
        out.println("（2）"+yoursolution[1]);out.println("<br/>");
        out.println("（3）"+yoursolution[2]);out.println("<br/>");
        out.println("（4）"+yoursolution[3]);out.println("<br/>");
        out.println("（5）"+yoursolution[4]);out.println("<br/>");
    %>


    <%
        //接收客户端传递过来的参数

        int sumright=0,sumerror=0,empty=0;
        for(int i=0;i<5;i++)
        {
    %>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%
        String num1="";
        int x=1;
        for(int m=0;m<yoursolution[i].length();m++)
        {
            num1=yoursolution[i];
            x*=10;
        }//字符串类型的数字转换为整型 用于和正确答案比较 因为从出题界面接受的答案是字符串类型
        if(yoursolution[i].equals(""))
        {
            out.println("第"+(i+1)+"题你没有回答哦！");
            empty++;
        }
        else if(num1.equals(outputans[i]))
        {
            sumright++;
//            out.println("恭喜你！回答正确！");
        }
        else
        {
            sumerror++;
//            out.println("回答错误，再接再厉！");
        }
        out.println("<br/>");//换行
        }
        out.println("回答正确了"+sumright+"道题！");
        out.println("<br/>");//换行
        out.println("回答错误了"+sumerror+"道题！");
        out.println("<br/>");//换行
        if (empty!=0){
            out.println("没有回答"+empty+"道题！");
            out.println("<br/>");//换行
        }
        out.print("得"+sumright*20+"分");
        out.println("(每题"+yoursolution.length/100+"分)");
    %>
</div>
</body>
</html>
