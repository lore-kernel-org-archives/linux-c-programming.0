From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: parse error
Date: Mon, 27 Sep 2004 11:58:38 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138538@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Ankit Jain' <ankitjain1580@yahoo.com>, linux prg <linux-c-programming@vger.kernel.org>

Ankit wrote:

>i could not understand why compiler has put semi colon
>before else due t owhich this parse error comes....

>#define exch(x,y) { int tmp; tmp=x; x=y; y=tmp; }

Remember that macro expansion occures early in the compilation process 
(it occures in step 4 if I remember correctly).  In this case a simple
text replacement is performed.

>However that wouldn't work in some cases. The following code is 
>meant to be an if-statement with two branches:

  if(x>y)
    exch(x,y);          // Branch 1
  else  
    do_something();     // Branch 2

As written, assuming exch() is a function you would have a two branch
if statement.  However, because exch is a macro, this is what is passed
from the c preprocessor to the compiler (because exch(..) is replaced with
the body of the defination:

if(x>y)
  { int tmp; tmp=x; x=y; y=tmp;};
else
  do_something();

and you have a one-brance if statement along with a parse error of an 
unassociated elst statement.  There are two fixes to this problem.  The 
first is to remove the semi-colon after the if statement:

if(x>y)
  exch(x,y)
else
  do_something();

This will expand to what you expect.  This is probably the least 
satisfactory fix.  The better fix would be to wrap the entire macro in a 
do-while loop, leaving the semicolon in place (i.e. this construct allows 
a macro call to be treated like a function).

#define exch(x,y)  do{int tmp; tmp=x; x=y; y=tmp;}while(0)

if(x>y)
  do{int tmp; tmp=x; x=y; y=tmp;}while(0);
else
 ...


You should be aware that while macros are powerful, they can be tricky to 
use.  As an example, consifer what would happen with this statement

exch(a, b+4)

George
