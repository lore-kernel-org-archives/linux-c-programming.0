From: Marius Nita <marius@cs.pdx.edu>
Subject: Re: A exploitable C program
Date: Mon, 15 Jul 2002 10:41:01 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020715104101.A23326@cs.pdx.edu>
References: <20020711233356.F343@nietzsche.metrotel.net.co> <20020712130106.A4048@neutrino.particles.org> <20020712153007.B39369@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020712153007.B39369@nietzsche.metrotel.net.co>; from xlp@emtel.net.co on Fri, Jul 12, 2002 at 03:30:07PM -0500
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ashtrax <xlp@emtel.net.co>
Cc: linux-c-programming@vger.kernel.org

On Fri, Jul 12, 2002 at 03:30:07PM -0500, ashtrax wrote:
> Hi, each time I  ask for this topic I am suggested to read that document, I have read it several times but I dont understand the concepts.
>

You need to get some basic knowledge of how a computer functions and how unix
processes are mapped in memory. (some of this is explained in that buffer
overflow document)

The basic idea is that if your program is not sane enough to check for
boundaries on static and dynamic arrays, it could be forced to write past the
end of an array. Since memory is linear (you can think of memory as a big long
row of bytes) there could be important stuff past the end of that array, such
as the return address of a function. If you overwrite that with another
address, you could cause that function to return to some other random place,
which you can use to manipulate the program in malicious ways.

In a nutshell, a buffer overflow is writing past the end of an array. (You say
int foo[4]; and sometime later you say *(foo + 4) = blah;)

a good way to avoid overflows is to use a memory debugger. (valgrind is an
excellent one)

