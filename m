From: Shriramana Sharma <samjnaa@gmail.com>
Subject: operator! and lvalue
Date: Wed, 27 Jun 2007 09:01:47 +0530
Message-ID: <4681DA23.7030001@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

In Thinking in C++ chapter on overloading operators, Bruce Eckel gives
the following code:

For a non-member operator:

int operator!(const Integer& a) {
   cout << "!Integer\n";
   return !a.i;
}

For a member operator:

Byte operator!() const {
   cout << "!Byte\n";
   return Byte(!b);
}

My question is: why is there no "const" before Integer and Byte at the
head of the function? There's all that stuff about when temporaries are
returned they are automatically const, but throughout the examples in
this chapter, only operator! is not explicitly specified to have a const
return value whereas in all other relevant cases we have the "const"
specified explicitly.

Shriramana Sharma.



