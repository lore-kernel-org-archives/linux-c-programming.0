From: David Eduardo Gomez Noguera <davidgn@servidor.unam.mx>
Subject: PAM programming with gtk.
Date: Wed, 16 Jul 2003 16:10:06 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F15BF2E.7000107@servidor.unam.mx>
Reply-To: davidgn@servidor.unam.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello. I am having some problems writing a small app that will shutdown 
the pc, and I have a few questions, if someone of you know the answers 
please?

shutdown needs root to execute it, so how can I get to do it? I was 
thinking of a suid app that will authenticate the user via login and 
password and if all is right, then execl shutdown, but gtk wont let an 
app be suid. So how can I get root priviledges with pam? is it possible 
at all?

Then, I dont quite understand how pam works. I compiled the demo app, 
but root can authenticate to any user (using only pam_unix_auth), but 
other users can authenticate to no one but themselves.

in an nutshell, any user that knows a password (to an account, not 
necessarily theirs, that belongs to a certain group) should be able to 
reboot.

Any help?

