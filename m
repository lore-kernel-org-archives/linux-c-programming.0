From: David Wuertele <dave-gnus@bfnet.com>
Subject: Re: Why does linking a.so with b.so require execs to be linked both
 -la and -lb?
Date: Mon, 11 Aug 2003 17:11:32 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <m3r83r20qz.fsf@bfnet.com>
References: <m3k79jj4av.fsf@bfnet.com> <tmml01xphg.ln2@thune.mrc-home.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Mike> Consider what would happen if everything was using static
Mike> libraries instead.

But they aren't.  One feature of shared libraries is runtime binding.

Mike> In my opinion, it should be a consistent command line between
Mike> static and dynamic linking, with adding -static the only
Mike> difference.

That seems like an unnecessarily strict requirement to me.  I don't
see the benefit.

Dave

