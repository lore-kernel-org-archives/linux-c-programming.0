From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Ever Increasing memory but not freed
Date: Thu, 28 Jan 2010 18:18:33 +0000
Message-ID: <19297.54521.4493.408471@cerise.gclements.plus.com>
References: <8eec89ee1001280220n88091bds74f974f45ad27087@mail.gmail.com>
	<19297.33143.803345.127596@cerise.gclements.plus.com>
	<8eec89ee1001280442x2c60f0a4gf8c9ec87d5e82610@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <8eec89ee1001280442x2c60f0a4gf8c9ec87d5e82610@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: =?UTF-8?B?VcSfdXIgQVRB?= <ataugur@gmail.com>
Cc: linux-c-programming@vger.kernel.org


U=C4=9Fur ATA wrote:

> 1) I have tried getrusage() command and it didn't work for slackware
> 12.2 (Linux 2.6.27.7 kernel). It was returning zero no matter what an=
d
> I read somewhere on the internet that it doesn't work for linux to ge=
t
> memory usage. That's why I wrote my own function.

Sorry, my mistake; on Linux, it only records CPU usage and page
faults, not memory. You can get equivalent information from
/proc/<pid>/{stat,statm,status}.

> 2) Yes, it is up to the kernel to release unused memory blocks on
> demand but what I am wondering is why the program crashes every time
> RSS reaches exactly the same amount which is almost 65MBs.

Coincidence? On an unloaded system, RSS will correlate closely with
virtual memory usage.

Is there an RSS limit (ulimit -m) in effect? If there is, the process
may start to swap when the limit is reached. If there are any
timing-related bugs, this could cause them to manifest.

> 3) My system has 1GB of free RAM and free memory exists every time a
> lot more than needed.
> 4) For some method calls RSS usage doesn't increase for subsequent
> calls but for some it increases every time. Otherwise it wouldn't be =
a
> problem if the memory usage stabilized on some level but it doesn't.

That tends to suggest a memory leak. Examining virtual memory usage
may help to confirm or deny this.

> 5) What is interesting is that in every method call RSS increases by
> 4K segments if it does. That made me think it is something related to
> the newly created stack in each method call.

4K is the x86 page size; any memory allocated by the kernel will be in
multiples of 4K.

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
