From: simon <simon.guinot@laposte.net>
Subject: Re: Accessing a process structure in the processes link list
Date: Mon, 29 Nov 2004 02:31:56 +0100
Message-ID: <41AA7C0C.8040103@laposte.net>
References: <20041128225720.99389.qmail@web51909.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041128225720.99389.qmail@web51909.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: A M <alim1993@yahoo.com>
Cc: linux-C-programming <linux-c-programming@vger.kernel.org>



A M wrote:
> Would it be possible for a program running as root
> that wasn't compiled with the kernel to access a
> process structure in the processes link list? 
> 
> I've read an article about hiding processes and the
> article made sound so easy to access the link list and
> hide a process, how easy is it? 
there is some way... in kernel mode...
for example you can write a module who redirect the getdents system 
call... it is used to get directory listing...
command like ps are just a listing of the /proc/"pid" directories...
if you intercept a getdents call for a directory matching the pid of the 
process you want hide... just forget...
> 
> Is it possible to a process to access its own entry in
> the processes link list?
yes a process can change some attributes in his own entry... but i don't 
think it can acces to the process link list or hide itself in userspace...

simon

