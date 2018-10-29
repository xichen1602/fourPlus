package myjavaclass;

import java.util.Scanner;

public class operation4 {
    private static String[][] topic = new String[100][7];  //二维数组存储题目。
        private static int[] operate = new int[2];  //存储运算符。
        private static int[] number = new int[3];  //储存数字。

    public static void main(String arg[]) {
        int num;

        while (true) {
            System.out.print("请输入题目数目：");
            Scanner scanner = new Scanner(System.in);
            num = scanner.nextInt();  //题目题数



            if (num <1) {
                System.out.println("输入的题目数不能小于1，请重新输入！");
            } else if (num>=5){
                System.out.println("做那么多干嘛?");
            }
            else {
                break;
            }
        }
       inttopic(num);Answer(num);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
    //生成数字
    public static void ramNum() {
        for (int jnum = 0; jnum < 3; jnum++) {
            int randomNum = (int) (1 + Math.random() * 100);
            number[jnum] = randomNum;
        }
        for (int jop = 0; jop < 2; jop++) {
            int randomop = (int) (Math.random() * 4);
            operate[jop] = randomop;
        }

    }
    //随机生成符号
    public static String radomOs(int rOs) {
        if (rOs== 0) {
            return "+";
        }
        if (rOs == 1) {
            return "-";
        }
        if (rOs == 2) {
            return "*";
        }
        if (rOs == 3) {
            return "/";
        }
        return "";
    }
    //四则运算。
    public static double operation(int opNum, double a, double b) {
        if (opNum == 0) {
            return a + b;
        }
        if (opNum == 1) {
            return a - b;
        }
        if (opNum == 2) {
            return a * b;
        }
        if (opNum == 3) {
            return a / b;
        }
        return 0;
    }
    //得出运算结果。
    public static double getResult() {
        //利用valueOf方法直接计算式子
        if (operate[1] >= 2) {

            double result = operation(operate[1], number[1], number[2]);
            result = operation(operate[0], number[0], result);
            result=Double.valueOf(result);
            return result;

        }
        else {  double result = operation(operate[0], number[0], number[1]);
            result = operation(operate[1], result, number[2]);
            result=Double.valueOf(result);
            return result;
        }
    }
    //生成题目
    public static String[][] inttopic(int  Onum){
        double score=0;
        String[][] s =new  String[8][8];
        for(int i=0;i< Onum;i++){
            int cnum=i+1;


            ramNum();
            for (int jnum = 0; jnum < 3; jnum++) {
                //topic[i][j]i为题号，j储存题目
                topic[i][2 * jnum] = String.valueOf(number[jnum]);
            }
            for (int jop = 0; jop < 2; jop++) {
                topic[i][2 * jop + 1] = radomOs(operate[jop]);
            }
            topic[i][5] = "=";
            //
            topic[i][6] = String.valueOf(getResult());


            if(getResult()>0){
                int j = 0;
                System.out.print("("+cnum+")");
                for (j = 0; j < 5; j++) {
                    System.out.print(topic[i][j]);
                }
                System.out.print(topic[i][5]);
                Scanner in = new Scanner(System.in);
//                double inputNum = in.nextDouble();

                while(in.hasNext()){

                    double inputNum = in.nextDouble();
                    if (!topic[i][6].equals(String.valueOf(inputNum))) {
                        System.out.println("答错了！");
                    } else {
                        score =score +100 / Onum ;
                    }
                }

            }else {i--;}
        }
        for(int i1=0;i1<Onum;i1++){
            s[i1] =topic[i1];
        }
        System.out.println("您的总分是"+score+"分。(每小题"+ (100/Onum)+"分，总分100分)");
        return s;
        }
        //答案条目。
    public static void Answer (int Onum){
        System.out.println("正确答案是：");
        for(int i=0;i<Onum;i++){
            System.out.print("("+(i+1)+")");
            System.out.print(topic[i][6]+"\n");
        }
    }
}