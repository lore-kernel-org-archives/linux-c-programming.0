From: chuckw@ieee.org
Subject: Sizes of stack variables
Date: Wed, 29 Oct 2003 15:30:41 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20031029203041.GA12880@whatever.local>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hey All,
  I was just trying to minimize the size of a program the other day,
and I noticed that the size of the varibles created on the stack is
not necessarily the size they should be.  So, for instance, the 
following code: 

void main()
{
  char buffer[8];

  printf("%s\n", buffer);
}

produces the following assembly:
   ...
8  main:
9    pushl %ebp
10   movl  %esp, %ebp
11   subl  $24, %esp
12   andl  $-16, %esp
13   movl  $0, %eax
     ...

No problem right, the buffer variable is created on the stack, and
I am assuming that the number 24 being subtracted from the stack pointer
is the 8 bytes for the buffer + 16 bytes program overhead(environment, etc).
Now, if I change the source to the following:

void main()
{
  char buffer[16];
   
  printf("%s\n", buffer);
}

produces the following assembly:
   ...
   8  main:
   9    pushl %ebp
   10   movl  %esp, %ebp
   11   subl  $40, %esp
   12   andl  $-16, %esp
   13   movl  $0, %eax
   ...

Shouldn't the stack size only increase to 32 which is 16 bytes of overhead
plus the 16 bytes for the variable?

If someone has some insight into this I would be much abliged.

Chuck

