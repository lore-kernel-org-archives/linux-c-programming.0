From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: does static function declaration require static definition?
Date: Tue, 2 Aug 2005 15:23:16 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0508021520360.29602@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  from my 5th edition of harbison and steele, p. 83, i read that the
"static" storage class specifier on a function "indicates that the
declared function will be defined -- with storage class static --
later in the file."

  doesn't this read that, once you declare the function as static, you
*must* define it as static as well?  gcc doesn't seem to have a
problem with leaving "static" off of the definition.

  of course, gcc certainly complains if you forget the "static" on the
declaration but put it on the definition further down.

rday
