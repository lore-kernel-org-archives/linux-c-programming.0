From: Christopher Quinn <cq@htec.demon.co.uk>
Subject: Re: defining a #define
Date: Thu, 05 Dec 2002 13:36:43 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3DEF566B.1080803@htec.demon.co.uk>
References: <200211071046.24987.abulfazl@juniv.edu> <200211072135.59164.abulfazl@juniv.edu> <20021107200436.C1136@neutrino.particles.org> <200211081504.01461.abulfazl@juniv.edu> <3DEF43F5.7050907@htec.demon.co.uk> <3DEF532C.5020701@technisys.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200211071046.24987.abulfazl@juniv.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Miguel Griffa <mgriffa@technisys.net>
Cc: linux-c-programming@vger.kernel.org

sorry - i wish i could withdraw that question, as it
was ridiculous!
thanks.
- chris

Miguel Griffa wrote:

> Just what you did is ok
>
> #ifdef LINUX
> #define GREAT_API
> #define OS "Linux"
> #else
> #define UNKNOWN
> #endif
>

