From: dalgoda@ix.netcom.com (Mike Castle)
Subject: Re: getline()
Date: Sun, 24 Aug 2003 23:24:40 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <8mmo11x75q.ln2@thune.mrc-home.org>
References: <20030824203653.A574@Imrashi.net.bd> <16201.12026.604756.905114@cerise.nosuchdomain.co.uk> <20030824215956.GF25257@schottelius.org>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

In article <20030824215956.GF25257@schottelius.org>,
Nico Schottelius  <nico-linux-c-programming@schottelius.org> wrote:
>> getline() is in libc. The prototype is in stdio.h, but you may need to
>> use -D_GNU_SOURCE to enable it.
>
>..and then you won't be able to use it with the dietlibc anymore...

Why?  If you use getline(), you should be providing your own version for
systems that don't have it.  If they have it, great, use the system
version, if they don't, use yours.

mrc
-- 
     Mike Castle      dalgoda@ix.netcom.com      www.netcom.com/~dalgoda/
    We are all of us living in the shadow of Manhattan.  -- Watchmen
fatal ("You are in a maze of twisty compiler features, all different"); -- gcc
