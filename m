From: "Marius Cosma" <marius.cosma@computaris.com>
Subject: RE: Macro exercise
Date: Fri, 18 Aug 2006 12:12:10 +0300
Message-ID: <01b501c6c2a6$62fdfcd0$b361a8c0@COSMA>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: 
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,

I want to use a macro for a structure member, something like:


typedef struct {
  int a;
  int b;
  int c;
} myStruct;

myStruct x;

x.a = 7;
x.b = 8;
x.c = 9;

#undef PARAM
#define PARAM a
printf("x=%d\n", x.##PARAM);

#undef PARAM
#define PARAM b
printf("x=%d\n", x.##PARAM);

#undef PARAM
#define PARAM c
printf("x=%d\n", x.##PARAM);


But I'm having problems in writing it correct (that "x.##PARAM"). Are you
faster than a google search? :)

Thanks



This email is subject to Computaris email terms of use: http://www.computaris.com/email_terms.html
