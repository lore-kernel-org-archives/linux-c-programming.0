From: kaushal <kaushal@rocsys.com>
Subject: copy program
Date: Tue, 06 Sep 2005 11:55:25 +0530
Message-ID: <1125987925.3348.66.camel@kaushal>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hello list,
          The default copy program in the linux or windows will not
create a file,if the copy process aborts at say the last 5 seconds.Lets
say the file size is 700MB and the copy process failed after copying
695MB and aborted,then we don't have the 695MB file on the hdd.If alone
the copy is successful till 100%we can have it.In windows I came across
a software:unstoppable.exe this software can copy to whatever extent it
is possible.My question is if I want to write a program how should I do
it using C(In linux/windows).As this approach is always recommended why
is it not implemented in the standard cp or copy programs?Earlier I have
posted a question about a problem in copying CDs in linux.Whenever I try
to copy a CD from linux it fails giving the seek error message.But
without mounting the cd if I play it using mplayer command, it plays.
		(mplayer vcd:// )
 while I copy the same CD in windows on the same machine it
succeeds .Can unstoppable kind of software in linux would help me
resolve this issue.Is there such a software?This is like a mystery .It
happens everytime.Any help would be greatly appreciated.Thanks in
advance.

regards-
kaushal.

