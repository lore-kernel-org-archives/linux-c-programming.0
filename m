From: Graydon Smith <smithg@cogeco.ca>
Subject: Re:How to make a program to run as a daemon
Date: Thu, 04 Jul 2002 08:10:05 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3D243B1D.650C7E3B@cogeco.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Bubulac Angela Tatiana wrote:
>
>How can I make a program writen in C to run as a daemon?
>

Some systems supply a daemon function for running a process in the background.

#include <unistd.h>
int daemon (int nochdir, int noclose);

If the parameter nochdir is zero, the function changes the directory to "/",
otherwise it stays in the current working directory.

The noclose parameter, if zero, directs stdin, stdout, and stderr to /dev/null.

When in doubt, search your man pages for this function.

--
Graydon Smith

"I never let my schooling interfere with my education."
- Mark Twain


