From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: nanosleep over multiple processes
Date: Fri, 22 Jun 2012 07:53:56 +0200
Message-ID: <20120622055356.GA15833@opentech.at>
References: <CAA6iF_7rzg8o0C5kbNgcRYmgj=t+0As-YQzP7Ddbmaz6yMAqLA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAA6iF_7rzg8o0C5kbNgcRYmgj=t+0As-YQzP7Ddbmaz6yMAqLA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On Fri, 22 Jun 2012, Randi Botse wrote:

> Hi All,
> 
> In nanosecond precision, if I have multiple processes run nanosleep(),
> how possbile they will get the same struct timespec value? both the
> tv_sec and tv_nsec value. Of course the tv_sec (second) is most
> possible, but how about the tv_nsec (nanosecond)?
> 
> I wan't to create a simple stupid unique id or something like that,
> but with without too much effort. The unique id will be tv_sec +
> tv_nsec.
>
while it is highly unlikely that they get the same tv_nsec it is not
impossible so it will not make for a good ID. The problem with such
an ID is simply that if you have a collision then it will be very hard
to debug this situation. Even worse this solution would not be portable
at all - it even could work on one box (e.g. a UP system where the
processes never execute physically concurrent) and fail on a MP in
rare cases - portability to other OS would also be very shaky at the
concept level (even if the API were pure POSIX).

there are unique objects available to any process, pid, address (if
address space randomization is enabled), /dev/random|/dev/urandom
fetching a long long from there is far more reliable than generating
a shaky long long from tv_nsecs (where the upper bits will almost
surely match).

let us know what you need it for and it is easiert to give some suggestions.

thx!
hofrat
 
