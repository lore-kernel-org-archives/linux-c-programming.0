From: Sascha Retzki <lantis@iqranet.info>
Subject: Re: make-error 127
Date: Mon, 06 Sep 2004 09:55:34 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1094457334.517.4.camel@MEniac.net>
References: <B0003374578@hermes.imsd.uni-mainz.de>
Reply-To: lantis@iqranet.info
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <B0003374578@hermes.imsd.uni-mainz.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: stalp@imbei.uni-mainz.de
Cc: linux-c-programming@vger.kernel.org

On Mon, 2004-09-06 at 13:48 +0200, Christian Stalp wrote:
> Hello together,
> does anybody knows whats the meaning of the make-error 127.
> I found out that is has something todo with missing tools ( diff, gawk...) 
> but its all installed and reasonably up to date.
> 
> What else can throw such a error?
> 
> Gruss Christian
> 
> 
> 

bash-2.05b$ m00
bash: m00: command not found
bash-2.05b$ echo $?
127

You mean this? If yes, 127 is just the thing bash returns when the
comamnd can't be found.

