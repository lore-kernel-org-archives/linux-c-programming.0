From: wwp <subscript@free.fr>
Subject: Re: static or stuff like that
Date: Mon, 29 Apr 2002 11:09:33 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020429110933.19f3c1af.subscript@free.fr>
References: <200204281856.43955.wrazlov@gmx.net>
	<15564.28455.695486.899966@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15564.28455.695486.899966@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi Glynn,


On Sun, 28 Apr 2002 22:52:39 +0100 Glynn Clements <glynn.clements@virgin.net> wrote:

> 
> Wrazlov wrote:
> 
> > I want to control whether a process is already running or not, and i don't 
> > know how without using some kind of lock-files
> 
> You can scan the files under /proc/<pid> to obtain details about which
> processes are running. E.g. /proc/<pid>/exe is a symlink to the
> program which process <pid> is executing.

Is /proc always available? (if not, how to do what Wrazlov asked?)


Regards

-- 
wwp
