From: Chuck Winters <chuckw@ieee.org>
Subject: Re: processing arguments
Date: Fri, 23 Apr 2004 19:40:51 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1082767251.3606.2.camel@whatever.local>
References: <Pine.LNX.4.58.0404231743080.1006@debian>
Reply-To: chuckw@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0404231743080.1006@debian>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Ameer,
  Your if stmt:
    if(argv[1] == "hello")
  is only comparing the pointer values in memory.  You need
  to use strncmp(3) to do comparison on strings.

Chuck

On Fri, 2004-04-23 at 16:44, ameer armaly wrote:
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

     -
     To unsubscribe from this list: send the line "unsubscribe linux-c-
     programming" in
     the body of a message to majordomo@vger.kernel.org
     More majordomo info at  http://vger.kernel.org/majordomo-info.html

