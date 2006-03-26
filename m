From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Integer arithmetic vs double precision arithmetic
Date: Sun, 26 Mar 2006 16:12:02 +0000
Message-ID: <6a00c8d50603260812q1ebddc26uae1c9b70bbe0d46e@mail.gmail.com>
References: <200603262044.37068.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603262044.37068.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/26/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> I am trying to work out whether to use an integer or a double for my
> internal
> storage variable of a class meant to store a time.
>
> Qt uses an unsigned integer with millisecond being the best precision, but I
> am wondering, why I should lose the extra digits of precision that I could
> get if I used a double.
>
> Is there a marked increase in computing speed if integer arithmetic is used
> compared to double precision?

It depends: every modern average CPU can do floating point arithmetics
at least as fast as simple integer arithmetics (sometimes even
faster).   The emphasis here lies on "can".  If the compiler has
difficulties generating code for the FPU of a specific target platform
it will default to floating point library calls causing real
performance penalties.

Why do you consider doubles to store time values?

	\Steve
