From: Massimiliano Cialdi <cialdi@firenze.net>
Subject: const char * vs char[]
Date: Tue, 23 Mar 2004 13:01:18 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040323130118.00005637.cialdi@firenze.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

I have this:

#include <stdio.h>
const char *str = "pippo";
int main(void)
{
  void stampa(char s[]);
  stampa(str);
  return 0;
}
void stampa(char s[])
{
 printf("%s\n", s);
}

and gcc gives me a warning:
pippo.c:9: warning: passing arg 1 of `stampa' discards qualifiers from
pointer target type


what are the differences between char[] and const char *?

thanks

-- 
Massimiliano Cialdi
cialdi@firenze.net
m.cialdi@oksys.it
