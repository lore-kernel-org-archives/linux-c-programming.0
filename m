From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: static or stuff like that
Date: Sun, 28 Apr 2002 22:52:39 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15564.28455.695486.899966@cerise.nosuchdomain.co.uk>
References: <200204281856.43955.wrazlov@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200204281856.43955.wrazlov@gmx.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wrazlov@gmx.net
Cc: linux-c-programming@vger.kernel.org


Wrazlov wrote:

> I want to control whether a process is already running or not, and i don't 
> know how without using some kind of lock-files

You can scan the files under /proc/<pid> to obtain details about which
processes are running. E.g. /proc/<pid>/exe is a symlink to the
program which process <pid> is executing.

-- 
Glynn Clements <glynn.clements@virgin.net>
