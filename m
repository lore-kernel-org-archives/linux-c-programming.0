From: Shriramana Sharma <jamadagni@gmail.com>
Subject: efficiency in passing a value to a function
Date: Wed, 04 Apr 2007 22:43:28 +0530
Message-ID: <4613DCB8.8030007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello.

Is providing an input to a function by constant reference more efficient 
than passing it by value? In what way.

For ex:

int addOne ( const & int inValue ) { return inValue + 1 ; }

vs:

int addOne ( int inValue ) { return inValue + 1 ; }

or:

void printThis ( const & int inValue ) { cout << inValue ; }

vs:

void printThis ( int inValue ) { cout << inValue ; }

I think passing as const & would be more efficient since passing by 
value would involve copying the value whereas passing by const & would 
skip this step. Am I right? Or is there something else?

Thanks in advance.

Shriramana Sharma.


