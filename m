From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Function pointers to inline functions
Date: Wed, 4 Apr 2007 20:33:51 +0200
Message-ID: <6a00c8d50704041133u30d98daavec529753606fc7e9@mail.gmail.com>
References: <4613DBC2.8060708@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=iLv/dW7/6EBxuBwo1OSo5MUVPePLahAPn0StcfLzJkF+tPudXhM97l1/sEVEo3losi22IvR2W7n8HBPxW0yJ3Ee1KUcYMJxUj/aA8yoRCuBO+aw4cckrDZYB4aEoZd05xkOQYNP+Cqa0ic+R8W+nvqJY39LYcZE11IEyOuctwLI=
In-Reply-To: <4613DBC2.8060708@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

Shriramana,

On 4/4/07, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Hello.
>
> As per my understanding, an inline function is replaced in place by t=
he
> compiler with the body of the function, so it does not have a separat=
e
> location in memory in contrast with a regular function. This being so=
,
> how is it possible to extract a pointer to an inline function and
> effectively use it?
>
> See the attached two examples. They work and though it's a good thing
> for my project that I can extract a pointer to an inline function I d=
o
> not understand how it is possible.

Whenever you request a pointer to an inline function the compiler will
place a normal subroutine version of the inline's implementation in an
object file and return its address.  So, effectively, the function
pointer does not point to an inline function at all.

       \Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
Internet  http://eth0.graegert.com, http://blog.graegert.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
