From: ameer armaly <ameer@charter.net>
Subject: processing arguments
Date: Fri, 23 Apr 2004 17:44:53 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0404231743080.1006@debian>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi all.
Let's say that I have the following c++ code:
#include <iostream>
int main(int argc, char *argv[])
{
if(argv[1]=="hello")
cout <<"Hello World!";
return 0;
}


When I try that, and I type:
./a.out hello

It doesn't give me any output.
Can someone explain how to process args properly?
Thanks,


Ameer

