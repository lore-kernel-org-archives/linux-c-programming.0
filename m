From: "Khan, Ahmer" <aakhan@vivotech.com>
Subject: RE: how to implement routines that return general strings?
Date: Thu, 10 Aug 2006 12:51:02 -0400
Message-ID: <24E518F08BD8C445A6D9AE5BC7AD4B5802926DFA@ms09.mse4.exchange.ms>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>, C programming list <linux-c-programming@vger.kernel.org>

It really depends on what func() is doing inside. If it's only
allocating memory and copying contents, then you can have the 
	char* func()
if it's doing other stuff too, like validating contents against various
rules, which can result in different error codes, then you should
consider using the 
	int func(...) 
form. I think both approaches are otherwise ok.

Ahmer

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of Robert
P. J. Day
Sent: Thursday, August 10, 2006 7:10 AM
To: C programming list
Subject: how to implement routines that return general strings?


  i'm about to design and implement a number of routines that return
strings and, as far as i can tell, i have two general design choices.

  int		func(char* buf, int bufsiz) ;
  char*		func() ;

  that first form obviously accepts the address of a buffer (and its
size) into which to copy the result, and leaves the "int" return value
to be used perhaps as an error code.  perfectly reasonable, but it
forces every invocation to first have a buffer ready to go.

  the second form would be intuitively more natural, but is affected
by the scope of the result.  the approach i would use there might be:

char*
func()
{
	static buf[128] ;	// or whatever size is appropriate
	... copy result into buf ...
	return buf ;
}

an error of some kind might be implemented by returning NULL, but that
will restrict the range of error codes i can pass back.

  are there compelling arguments either way?  while i like the natural
feel of the second form, i have to admit the first form is more
informative.  thoughts?

rday


-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
