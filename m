From: David Eduardo Gomez Noguera <davidgn@servidor.unam.mx>
Subject: questions on cvs pserver, hope its ok to ask here.
Date: 03 Jun 2003 22:18:35 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1054696715.6585.10.camel@localhost.localdomain>
Reply-To: davidgn@servidor.unam.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello.
I am setting a cvs repository, but have some doubts about "anonymous"
access.

The system does not have any anonymous account and has the line
anonymous:
on the /usr/CVS/cvsroot/CVSROOT/password file, so this command goes ok
cvs -d:pserver:anonymous@hostname:/usr/CVS/cvsroot login

after that, this command goes wrong with a message of "no anonymous
user"

cvs -d:pserver:anonymous@hostname:/usr/CVS/cvsroot co "kernel device
drivers"

However, this turns out to be ok

cvs -d:pserver:@hostname:/usr/CVS/cvsroot co "kernel device drivers"

I think that problem would be fixed if I do either of

a) create a system accout anonymous in /etc/passwd
or
b) chancge the passwd life to
anonymous::some_existing_account

The point is I dont want to asign a true username/system_account to
anonymous cvs access. So what can I do? Is that just how CVS is and I
just have to learn to live with that? may I have an old cvs system ?
(its rh8's)
or should I get my hands dirty and see what the problem with cvs's
source code is?

Thank you.



