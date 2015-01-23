From: Trevor Woerner <twoerner@gmail.com>
Subject: Re: sizeof *data, when data isn't initalized, is that right?
Date: Fri, 23 Jan 2015 02:33:20 -0500
Message-ID: <54C1F940.5090400@gmail.com>
References: <54C13F4A.2020404@gmail.com> <54C143F3.7020704@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=08Mdl+AS/R8rQ402M29gV/AMMcpomtrBoQ6kqFxZ2og=;
        b=oi05M4zXVjgdSdxKZT5RDlOq+k2h/gr3/HKH7yY9bsGU7tP1XtFLvXPVbLsmKaeqgU
         6lVHb9A+Al24PdnLvH55FVF6yVZLXN8sajbHin6hz0vdXIj5qoY5ALp3kwLALo/mDHDY
         Krxsd2lDetvgUV2WbZQvd/mQ/Q07GXxkDpY3bXQRZxT6VooyUZ9lo4+Or4jl3HPFE7v5
         sXizBe8OC7PzTAnVbI98CmOD0G9Oxm5KN+rSWo2ZNdhcnu8GX7N2sgEHHZtgBJV6J6KV
         a1vXpokV7SCZOL6aH/H0V10JP10d3ujB6Rqv349nMitjE7lEL4uad4ZC0tI97xOFDNhz
         pfFw==
In-Reply-To: <54C143F3.7020704@wanadoo.fr>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert CHAUMETTE <hubert.chaumette@wanadoo.fr>, Daniel Hilst Selli <danielhilst@gmail.com>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On 01/22/15 13:39, Hubert CHAUMETTE wrote:
> As I understand it, sizeof(*data) is the same as sizeof(struct mcp23s08_driver_data). There should be no pointer dereference here, so I would say it isn't an issue.

In most cases (always?) sizeof() is a compile-time operator; it is up to
the compiler to perform the calculation of an object's size and simply
place that constant into the code. This is why the target of a sizeof()
operation needs to be fully defined at compile time.

Therefore, since this calculation takes place at compile time, there is
no run-time pointer dereference taking place.


>  That notation is quite confusing though.

This idiom is quite common, so it would be good to become familiar with
it. Without using this idiom one would have to write:

    sizeof (struct mpc23s08_driver_data)

which is fine... until someone else comes along and changes "data"'s
type (defined way up at the start of the function) to, say,
mpc23s08_driver_data_2. Then someone would need to go through all the
code and find all instances of

    sizeof (struct mpc23s08_driver_data)

and change all of them to

    sizeof (struct mpc23s08_driver_data_2)

As you might guess, this is prone to error. However, if the original
developer used

    sizeof (*data)

throughout their code, no such subsequent changes would be needed. The
compiler is smart enough to figure out that *data is an object of struct
mpc23s08_driver_data and use that in its sizeof calculation. If/when
"data"'s definition gets changed, the compiler is then able to use
mpc23s08_driver_data_2 in its calculation, without any necessary
subsequent changes to the code.
