From: zavandi <zavandi@easynet.ro>
Subject: Value to subtract from ESP register?
Date: Wed, 24 Mar 2004 18:22:28 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4061B5C4.7040907@easynet.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I have a question which regards mostly gcc. If isn't appropriate here, I 
apologize, maybe someone can point me to a more appropriate mailing list.

So... the problem: When gcc compiles a function, the first thing the 
function does is to subtract a certain value from the ESP register, to 
make room for local variables. This value is always >= than the size of 
local variables, but I'd be curious to know what algorithm gcc uses to 
decide how much greater the value will be.

An example: I have this code in C:

---start------------------

void f1() {
          char d[3];
}

void f2() {
          char d[4];
}

---end--------------------

The assembly output for f1 and f2 functions is (gcc -S test.c):

---start------------------

f1:
          pushl   %ebp
          movl    %esp, %ebp
          subl    $24, %esp
          leave
          ret

f2:
          pushl   %ebp
          movl    %esp, %ebp
          subl    $4, %esp
          leave
          ret

---end--------------------

I would like to know why the subtracted value is 24 when the local 
variable is 3 bytes and 4 when the variable is 4 bytes.

