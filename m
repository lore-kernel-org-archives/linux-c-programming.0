From: Yi Wang <yi.w@live.com>
Subject: Signal handler and longjmp question
Date: Sun, 9 Dec 2007 21:12:20 +0800
Message-ID: <BLU125-W33C6B6DA207B733BBC1F7AEA6A0@phx.gbl>
References: <S1751093AbXLIMzQ/20071209125516Z+241@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <S1751093AbXLIMzQ/20071209125516Z+241@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi, all
    I read from some book that a signal handler can either return or call exit, abort or longjmp, it is permitted by ANSI C.
    However, I remember that lonjmp never returns, which in turn causes the signal handler can not return. In that case, the kernel will think the program is in signal handler forever, am I right? 
    IMHO, I think that is too bad...

Leo

--------------------------------------
code sample:

jmp_buf buf;
static void signal_handler(int signo)
{
    longjmp(buf);
}
int main()
{
  signal(SIGUSR1, signal_handler);
  ...
  setjmp(buf);
  ...
  return 0;
}

Suppose the program received SIGUSR1 after setjmp has been called, is the program still in signal handle context after longjmp?


_________________________________________________________________
Invite your mail contacts to join your friends list with Windows Live Spaces. It's easy!
http://spaces.live.com/spacesapi.aspx?wx_action=create&wx_url=/friends.aspx&mkt=en-us
