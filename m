From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: PAM programming with gtk.
Date: Thu, 17 Jul 2003 02:49:52 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16150.192.720325.136343@cerise.nosuchdomain.co.uk>
References: <3F15BF2E.7000107@servidor.unam.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F15BF2E.7000107@servidor.unam.mx>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: davidgn@servidor.unam.mx
Cc: linux-c-programming@vger.kernel.org


David Eduardo Gomez Noguera wrote:

> Hello. I am having some problems writing a small app that will shutdown 
> the pc, and I have a few questions, if someone of you know the answers 
> please?
> 
> shutdown needs root to execute it, so how can I get to do it? I was 
> thinking of a suid app that will authenticate the user via login and 
> password and if all is right, then execl shutdown, but gtk wont let an 
> app be suid. So how can I get root priviledges with pam? is it possible 
> at all?
> 
> Then, I dont quite understand how pam works. I compiled the demo app, 
> but root can authenticate to any user (using only pam_unix_auth), but 
> other users can authenticate to no one but themselves.
> 
> in an nutshell, any user that knows a password (to an account, not 
> necessarily theirs, that belongs to a certain group) should be able to 
> reboot.

I strongly suggest that you use sudo for this. I.e. configure sudo to
allow all such users to run /sbin/shutdown as root, then have your GTK
program invoke sudo via xterm, e.g.

	xterm -T Sudo -geometry 30x1 -e sudo shutdown -h now

Shutdown needs root privilege. Your GUI program isn't running with
root privilege. Consequently, a setuid program has to get involved
somewhere along the line. Writing a setuid program which doesn't give
everyone unrestricted root privilege is hard. So use an existing
program which is likely to have been written by someone who knows what
they are doing.

If you are intent on doing this yourself, don't use a setuid program. 
Write a daemon which is run as root (via init and /etc/rc.d/) and
which will perform a shutdown upon receipt of a valid request. Writing
a daemon is easier to get right than writing a setuid program. A
daemon only has to worry about malicious input on it's socket (or FIFO
etc), whereas a setuid program has to worry about its entire process
environment.

-- 
Glynn Clements <glynn.clements@virgin.net>
