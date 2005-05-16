From: Anand Chug <anand.chug@gmail.com>
Subject: throw()...Clarification
Date: Tue, 17 May 2005 00:28:48 +0530
Message-ID: <ed9edacc05051611583f3cd958@mail.gmail.com>
Reply-To: Anand Chug <anand.chug@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi

void f();
means that any type of exception may be thrown from the function. If you say
void f() throw();
it means that no exceptions are thrown from a function

So suppose i write a code like this

#include<iostream>
using namespace std;

class A
{
public:
    A(int x1,int y1):x(x1),y(y1){} ;
    int calc () throw();
   
private:
    int x,y;
};


int A::calc ()
{
    int temp;
    temp=x-y;
    if(temp<0)
        throw 0;
    return temp;
}
int main()
{
    A a(4,5);
    try{
        a.calc ();
    }catch(...)
    {
        cout<<"Exception"<<endl;
    }
    return 0;
}

According to the definition of throw()
calc() function should not throw any exception.
But while executing the above code in am getting "Exception" as output..
Any ideas...???
