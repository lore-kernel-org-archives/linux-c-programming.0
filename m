From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: #include problem
Date: Fri, 15 Oct 2004 12:55:04 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138543@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org


>Howdy,
>i have a file main.c in my program that needs to include four headers
>aaa.h , bbb.h ,ccc.h and ddd.h . Each one of these headers need to
>include another header xxx.h . With this implementation i get a
>"redefinition" compilation error. How can i solve this problem ? Thanks
>in advance.

each header file should have the form:

#ifndef <some symbol>
#define <some symbol>

... rest of header file code

#endif

where <some symbol> is a unique name across your project.  I tend to use
the form: _<filename>_h_.  The way this works is that the first time the
header is included the symbol is not defined so the header is processed, on 
subsequent inclusions the symbol is defined ad the header is not processed.

George
