From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: how to implement routines that return general strings?
Date: Thu, 10 Aug 2006 10:10:21 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0608101004460.13097@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


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


