From: kaushal <kaushal@rocsys.com>
Subject: stack smashing
Date: Thu, 03 Feb 2005 11:59:21 +0530
Message-ID: <1107412160.5409.50.camel@localhost.localdomain>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello all,
	I wanted to understand the stacksmashing work.I simply copied and run
the first example code-snippet from the ALEPH-ONE's paper on "smashing
the stack for fun and profit"(http://www.insecure.org/stf/smashstack.txt
).But it did not skip the instruction.I tried this on the linux -x86
machine.The code follows:

----------------------------------------------------------------------------
void function(int a, int b, int c) {
   char buffer1[5];
   char buffer2[10];
   int *ret;

   ret = buffer1 + 12;
   (*ret) += 8;
}

void main() {
  int x;

  x = 0;
  function(1,2,3);
  x = 1;
  printf("%d\n",x);
}
----------------------------------------------------------------------------
Can somebody throw light on this?

-liuser

