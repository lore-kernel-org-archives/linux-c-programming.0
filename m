From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Is it possible to trace back from where a user comes
Date: Wed, 29 Oct 2003 08:29:09 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0310290808580.16385-100000@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

I have written a small program that allows a user to do some configuration.
Now everytime the user does configure something it gets logged to a log
file. Usually when someone comes from a remote machine I took the
environment variable DISPLAY and if that is not there the output from
"who am i", to determine from where the user comes. However this does
not work reliably since DISPLAY is set to localhost when the user is using
ssh, also "who am i" does not always tell me from where a user comes.
Another problem is when the user first logs in on say host1 then to host2
and then to host3. Is there a way to determine that the user comes from
host1? The SSH_CLIENT environment variable is always set to the last
host, so this can not be used. SSH_CONNECTION is not set so this can
also not be used. I also looked at struct utmp it to does not provide
the information, it is also not very portable since the structure differs
a lot from system to system.

So is there a way to determine from where a user comes?

Thanks,
Holger

