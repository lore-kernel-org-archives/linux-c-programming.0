From: dalgoda@ix.netcom.com (Mike Castle)
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 24 Jul 2002 12:56:00 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <go0nha.u6f.ln@thune.mrc-home.org>
References: <20020717205559.J1163@neutrino.particles.org> <200207171755.g6HHtsF0004688@grinch.txt.com> <20020717123023.A2248@cs.pdx.edu>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

In article <20020717123023.A2248@cs.pdx.edu>,
Marius Nita  <marius@cs.pdx.edu> wrote:
>It seems that this issue has become a religious thing, tho I don't see why. It
>is clear that the return of malloc need not (and must not--for correctness) be
>casted.

I believe it was necessary for pre or early ANSI C, so a lot of old code
written by some pretty smart people used it.

mrc

-- 
     Mike Castle      dalgoda@ix.netcom.com      www.netcom.com/~dalgoda/
    We are all of us living in the shadow of Manhattan.  -- Watchmen
fatal ("You are in a maze of twisty compiler features, all different"); -- gcc
