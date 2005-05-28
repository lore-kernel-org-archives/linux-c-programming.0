From: a.biardi@tiscali.it
Subject: decimal constant so large?
Date: Sat, 28 May 2005 18:50:57 +0100
Message-ID: <200505281850.57908.a.biardi@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi everybody,

Can anyone tell me why the constant -2147483648, according to what g++ reports 
as a warning for the code below, is considered to be "so large that it is 
unsigned"?

How can it be unsigned when it starts with '-'?

I am compiling on an x86, and the constant seems to be a perfectly good 32 bit 
signed value to me. Where am I wrong?

I've tried it with three different compilers, and they all behave in the same 
funny way: Borland C++ compiler 5.7, as well as g++ 3.2.3 report a warning, 
Intel compiler 8.1 says nothing.

==============================================================================
#include <iostream>

using namespace std;

int main() {

  cout << (int)-2147483648 << endl; // ok
  cout <<      -2147483648 << endl; // prints 2147483648 instead

}
==============================================================================

