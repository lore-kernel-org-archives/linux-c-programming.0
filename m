From: "Alphex K." <alphex@crew.org.ru>
Subject: Re: daemons
Date: Sun, 15 Feb 2004 13:06:01 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040215130601.4a5cfdc8.alphex@crew.org.ru>
References: <Pine.LNX.4.58.0402142313510.2561@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0402142313510.2561@debian>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ameer armaly <ameer@charter.net>
Cc: linux-c-programming@vger.kernel.org

On Sat, 14 Feb 2004 23:14:45 -0500 (EST)
ameer armaly <ameer@charter.net> wrote:

So, You can do it =)
You must call the fork(),close all enviroment and so all =)
some like this

//closing the enviroment
int pid;
if((pid=fork())==0)
{
for(;;)
{
// something useful
}
}

so, it's all
---===---
Alphex Kaanoken
Senior developer of Crew IT research labs
web: http://crew.org.ru
mailto:Alphex@Crew.Org.RU
