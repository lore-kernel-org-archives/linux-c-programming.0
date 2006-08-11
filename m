From: "Shorty Porty" <getshorty_@hotmail.com>
Subject: RE: how to implement routines that return general strings?
Date: Sat, 12 Aug 2006 04:36:52 +1000
Message-ID: <BAY104-DAV4846B1779D88C62F4E816ED4B0@phx.gbl>
References: <f68850780608110003u78bc0f1albc7551f30599be27@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <f68850780608110003u78bc0f1albc7551f30599be27@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Raseel Bhagat' <raseelbhagat@gmail.com>, 'C programming list' <linux-c-programming@vger.kernel.org>

On 8/11/06, Glynn Clements <glynn@gclements.plus.com> wrote:

> Avoid the second form. Apart from not being re-entrant, it can lead to
> bugs which can be hard to find, particularly if the function in
> question is relatively general-purpose and may be used from various
> places in your code.

char*
func()
{
	static buf[128] ;	// or whatever size is appropriate
	... copy result into buf ...
	return buf ;
}

It isn't re-entrant, because of the static buffer. In a process, all threads
will get the same copy of the static buffer, so if one thread calls the
function and hasn't copied the string contents before another threads calls
the function, they will both get the string from the 2nd call. If both
threads are inside that function at the same time, they are both going to be
playing with that buf[] at the same time. Icky.

Shorty

