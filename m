From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: timer->result
Date: Tue, 28 Sep 2004 19:12:36 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040928181236.52374.qmail@web52904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

hi

 #include<stdio.h>
 #include<sys/time.h>
 #include<time.h>

 int main(void)
 {
         struct timeval t1,t2,result;
         gettimeofday(&t1,NULL);
         usleep(500);
         gettimeofday(&t2,NULL);
         timersub(&t2,&t1,&result);
         printf("%ld",result.tv_usec);
}
now technically i feel it should display 500
microsecond even not accurate then also it should show
near by 500 or less than 600 microsecond atleast.

on my system it shows 40000 microsecond....
whats the reason? if i remove usleep then it shows 2
or 1 microsecond.....

whats wonrg here?

thanks

ankit

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
