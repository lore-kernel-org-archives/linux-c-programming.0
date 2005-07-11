From: Steve Graegert <graegerts@gmail.com>
Subject: Re: canonical byte swap macros?
Date: Mon, 11 Jul 2005 21:44:04 +0200
Message-ID: <6a00c8d505071112442b9d83b7@mail.gmail.com>
References: <Pine.LNX.4.63.0507102100500.9524@localhost.localdomain>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0507102100500.9524@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On 7/11/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
> 
>   is there a standard set of byte swap macros/functions for doing
> big/little endian conversion?  i have no interest in re-inventing the
> wheel and i'm sure there's a universally-recognized set of macros for
> this, no?
> 

For quick and dirty solutions I sometimes use one of the following
(not favoured over any other solution, it just work for me):

#define swap_16(x) (((x) & 0x00ff) << 8 | ((x) & 0xff00) >> 8)

#define swap_32(x) \
     ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >>  8) | \
      (((x) & 0x0000ff00) <<  8) | (((x) & 0x000000ff) << 24))

uint64_t swap_64(uint64_t x) {
    union { 
        uint64_t ll;
        uint32_t l[2]; 
    } w, r;
    w.ll = x;
    r.l[0] = bswap_32 (w.l[1]);
    r.l[1] = bswap_32 (w.l[0]);
    return r.ll;
}


Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
