package myjavaclass;

public class arithmetic {
    public int []answer;//答案
    public int shumu;//出题数目
    public String []suanshi;//算式
    public void setsuanshi(String []suanshi)
    {
        this.suanshi=suanshi;
    }

    public String [] biaodashi(int n)
    {
        shumu=n;
        answer=new int[n];
        int a,b,c,d1 = 0,d,d2=0;
        int []mixture=new int[2];
        String []biaodashi=new String[n];

        for(int i=0;i<n;i++)
        {
            a=(int)(Math.random()*100)+1;//1-100
            b=(int)(Math.random()*100)+1;
            c=(int)(Math.random()*5)+1;//随机生成一个1-5的整数，4表示加法，1表示减法，2表示乘法，3表示除法,5表示混合
            if(c==5)//混合运算
            {
                do
                {
                    for(int m=0;m<2;m++)
                    {
                        mixture[m]=(int)(Math.random()*2);//0-1
                    }//控制运算符

                    a=(int)(Math.random()*100)+1;
                    b=(int)(Math.random()*100)+1;
                    d=(int)(Math.random()*100)+1;//生成三个数
                    if(mixture[0]==0&&mixture[1]==0)
                    {
                        biaodashi[i]=a+"+"+b+"+"+d+" = ";
                        d1=a+b+d;
                    }
                    if(mixture[0]==1&&mixture[1]==1)
                    {
                        biaodashi[i]=a+"-"+b+"-"+d+" = ";
                        d2=a-b;
                        d1=a-b-d;
                    }
                    if(mixture[0]==0&&mixture[1]==1)
                    {
                        biaodashi[i]=a+"+"+b+"-"+d+" = ";
                        d1=a+b-d;
                    }
                    if(mixture[0]==1&&mixture[1]==0)
                    {
                        biaodashi[i]=a+"-"+b+"+"+d+" = ";
                        d2=a-b;
                        d1=a-b+d;
                    }
                }	while(d2<0||d1<0);
                answer[i]=d1;
            }
            if(c==4)//单加法
            {
                d1=a+b;
                biaodashi[i]=a+"+"+b+" = ";
                while(d1>100)
                {
                    a=(int)(Math.random()*100)+1;
                    b=(int)(Math.random()*100)+1;//1-100 包括1和100 不加1 表示0-99
                    d1=a+b;
                }
                biaodashi[i]=a+"+"+b+" = ";
                answer[i]=d1;
                System.out.print(a+"+"+b+"= ");
            }
            if(c==1)//单减法
            {
                d1=a-b;
                while(d1<0)
                {
                    a=(int)(Math.random()*100)+1;
                    b=(int)(Math.random()*100)+1;
                    d1=a-b;
                }
                biaodashi[i]=a+"-"+b+" = ";
                answer[i]=d1;
                System.out.print(a+"-"+b+"= ");
            }
            if(c==2)//乘法
            {
                a=(int)(Math.random()*10);//0-9
                b=(int)(Math.random()*10);//1-100 包括1和100 不加1 表示0-99
                d1=a*b;
                while(a<1||b<1||d1>81)
                {
                    a=(int)(Math.random()*10);//0-9
                    b=(int)(Math.random()*10);//1-100 包括1和100 不加1 表示0-99
                }
                d1=a*b;
                biaodashi[i]=a+"*"+b+" = ";
                answer[i]=d1;
                System.out.print(a+"*"+b+"= ");
            }
            if(c==3)//除法
            {
                d1=a/b;
                while(a%b!=0||a/b>9||(a<=81&&b>=10)||(a>9&&a==b)||(a>81))
                {
                    a=(int)(Math.random()*100)+1;
                    b=(int)(Math.random()*100)+1;//1-100 包括1和100 不加1 表示0-99
                }
                d1=a/b;
                biaodashi[i]=a+"÷"+b+" = ";
                answer[i]=d1;
                System.out.print(a+"÷"+b+"= ");
            }

//查重
            for(int k=i-1;k>=0;k--)
            {
                while(biaodashi[i].equals(biaodashi[k]))
                {
                    a=(int)(Math.random()*100)+1;//1-100
                    b=(int)(Math.random()*100)+1;
                    c=(int)(Math.random()*5)+1;//随机生成一个1-5的整数，4表示加法，1表示减法，2表示乘法，3表示除法,5表示混合
                    if(c==5)
                    {
                        do//混合运算
                        {
                            for(int m=0;m<2;m++)
                            {
                                mixture[m]=(int)(Math.random()*2);//0-1
                            }//控制运算符

                            a=(int)(Math.random()*100)+1;
                            b=(int)(Math.random()*100)+1;
                            d=(int)(Math.random()*100)+1;//生成三个数
                            if(mixture[0]==0&&mixture[1]==0)
                            {
                                biaodashi[i]=a+"+"+b+"+"+d+" = ";
                                d1=a+b+d;
                            }
                            if(mixture[0]==1&&mixture[1]==1)
                            {
                                biaodashi[i]=a+"-"+b+"-"+d+" = ";
                                d2=a-b;
                                d1=a-b-d;
                            }
                            if(mixture[0]==0&&mixture[1]==1)
                            {
                                biaodashi[i]=a+"+"+b+"-"+d+" = ";
                                d1=a+b-d;
                            }
                            if(mixture[0]==1&&mixture[1]==0)
                            {
                                biaodashi[i]=a+"-"+b+"+"+d+" = ";
                                d2=a-b;
                                d1=a-b+d;
                            }
                        }while(d2<0||d1<0);
                        answer[i]=d1;
                    }
                    if(c==4)
                    {
                        d1=a+b;
                        biaodashi[i]=a+"+"+b+" = ";
                        while(d1>100)
                        {
                            a=(int)(Math.random()*100)+1;
                            b=(int)(Math.random()*100)+1;//1-100 包括1和100 不加1 表示0-99
                            d1=a+b;
                        }
                        biaodashi[i]=a+"+"+b+" = ";
                        answer[i]=d1;
                        System.out.print(a+"+"+b+"= ");
                    }
                    if(c==1)
                    {
                        d1=a-b;
                        while(d1<0)
                        {
                            a=(int)(Math.random()*100)+1;
                            b=(int)(Math.random()*100)+1;
                            d1=a-b;
                        }
                        biaodashi[i]=a+"-"+b+" = ";
                        answer[i]=d1;
                        System.out.print(a+"-"+b+"= ");
                    }
                    if(c==2)
                    {
                        a=(int)(Math.random()*10);//0-9
                        b=(int)(Math.random()*10);//1-100 包括1和100 不加1 表示0-99
                        d1=a*b;
                        while(a<1||b<1||d1>81)
                        {
                            a=(int)(Math.random()*10);//0-9
                            b=(int)(Math.random()*10);//1-100 包括1和100 不加1 表示0-99
                        }
                        d1=a*b;
                        biaodashi[i]=a+"*"+b+" = ";
                        answer[i]=d1;
                        System.out.print(a+"*"+b+"= ");
                    }
                    if(c==3)
                    {
                        while(a%b!=0)
                        {
                            a=(int)(Math.random()*100)+1;
                            b=(int)(Math.random()*100)+1;//1-100 包括1和100 不加1 表示0-99
                        }
                        d1=a/b;
                        biaodashi[i]=a+"÷"+b+" = ";
                        answer[i]=d1;
                        System.out.print(a+"÷"+b+"= ");
                    }
                }
            }
        }
        return biaodashi;
    }

}