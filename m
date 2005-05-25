From: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
Subject: Issue "address of local variable returned"
Date: Wed, 25 May 2005 12:57:12 +0530
Message-ID: <013a01c560fb$37b16e80$9736a8c0@ispl091>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi All,
    I am facing following issue
(g++ compiler  "g++ (GCC) 3.2.3 20030502 (Red Hat Linux 3.2.3-20)" is being
used for compilation.)

Following piece of code gives warning: "address of local variable `op'
returned"
#################################
#include<iostream>
using namespace std;

struct s {
    char op[24];
    int j;
};

char* fun()
{
    struct s op;
    strcpy(op.op, "898898898\0");
    return op.op;
}

int main()
{
    cout << fun() << endl;
    return 0;
}
#################################
But when the structure is change no warning is issued
Following is the new structure
#################################
struct s {
        int j;
        char op[24];
};
#################################

Obviously I know that "op.op" should not be returned.

g++ compiler  "g++ (GCC) 3.2.3 20030502 (Red Hat Linux 3.2.3-20)" is being
used for compilation.

Thanks in advance,
Amit Dang

