From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Using operator ! twice
Date: Sun, 1 Jul 2007 02:08:50 +0100
Message-ID: <18054.65186.556018.76413@cerise.gclements.plus.com>
References: <1b2aacd80706291734y55b6e654i956767ae2a6f5e46@mail.gmail.com>
	<1b2aacd80706291736s18563893q83a19d0ae5662514@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1b2aacd80706291736s18563893q83a19d0ae5662514@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luong Ngo <luong.ngo@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Luong Ngo wrote:

> I came across several times codes that use ! operator on an integer
> variable. I am curious what is the purpose of using it twice.
> For example:
> 
> int flag;
>                if( !! flag) {
>                    //do something
>                }
> 
> 
> The first ! operator will make !flag to be true if flag is 0, and if
> we not again it become false, which is just exactly the same if we
> just left it as
>    if(flag), since 0 is the same as false. Similar logic for non-0
> value of flag. Then why do we need to use ! operator twice to get back
> the same value as if we don't use at all?

The !! idiom converts anything which can be used as a boolean to an
integer which is either zero or one.

It isn't necessary in a context where any boolean value is acceptable
(e.g. the test of an if, while or do-while statement, or an operand to
the && and || operators), but is useful if you need a value which must
be either zero or one.

> this seems to be the same
> for me if we do this in math:  -(-( -8)) = -8;

However: !(-8) = 0, and !!(-8) = 1.

-- 
Glynn Clements <glynn@gclements.plus.com>
