From: Shanks <mshanks79@yahoo.co.in>
Subject: gcc -S option
Date: Fri, 14 Mar 2003 10:40:46 -0800 (PST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030314184046.85169.qmail@web8006.mail.in.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

Assume hypothetical C code below
int
main()
{
        int t;

        t += 1;
        return 0;
}

When i compile this code using -S option on a *solaris* box using
the *solaris* compiler, i get following .s file
! File a.c:
!    1  int
!    2  main()
!    3  {
!    4          int t;
!    5
!    6          t += 1;

        add     %i5,1,%i5

!    7          return 0;

        mov     %g0,%i0
        jmp     %i7+8
        restore

As you can see above, the .s file generated is of following
format:
- C code block
- Corresponding Assembly code

However when i do the same thing using gcc i get *only* the
assembly code and not the corresponding C code also.

Can someone tell me if i need to pass some extra options
while compiling using gcc to get the desired data.

Right now i am generating .s as follows
$ gcc -S a.c

Thanks in advance,
Shanks

__________________________________________________
Do you Yahoo!?
Yahoo! Web Hosting - establish your business online
http://webhosting.yahoo.com
