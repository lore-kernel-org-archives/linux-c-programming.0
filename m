From: "Leslie P. Polzer" <leslie.polzer@gmx.net>
Subject: Re: malloc interposition how?
Date: Thu, 17 Jul 2008 09:39:31 +0200 (CEST)
Message-ID: <61651.88.73.234.237.1216280371.squirrel@mail.stardawn.org>
References: <18501119.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18501119.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bkerin <bkerin@fastmail.fm>
Cc: linux-c-programming@vger.kernel.org


Check the -M argument to ld to see where your malloc comes from
(well, presumably from libc, but let's be sure).

Supposedly your set_vtable stuff isn't working at all,
and you need to put the gc libs higher in the linking
order (before libc).

  Leslie

