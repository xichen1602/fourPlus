package myjavaclass;

public class Random {
    public   String randomOperator() {
        String[] operateEle = {"+","-","*","/"};
        return operateEle[(int) (Math.random()*4)];
    }
    public int randomNumber(){
        int randomNumber=20;
        return (int) (Math.random()*randomNumber);
    }
}
