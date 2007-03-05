From: "Markus Rechberger" <mrechberger@gmail.com>
Subject: Re: Handling ioctl() argp memory
Date: Mon, 5 Mar 2007 11:49:57 +0100
Message-ID: <d9def9db0703050249i697cb7ffj9dd9e8910635474e@mail.gmail.com>
References: <20070304164844.GA7231@wintermute.farpoint>
	 <17899.30813.80673.270405@cerise.gclements.plus.com>
	 <20070305052355.GA13946@wintermute.farpoint>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=c0ZzIT/fi2B7G5Q6aFdh0/eSn6+fgEzmpXkf+x//jXfILuZaPsDsv8k9qD9K88C7zSf49MOLpHgopbHMEvZ8RXImCXYRutE7w7yLQRTf2i8XWOh81VEpRDfz4q0fP8fpGhdMUHxfmmMHvTOuTWNWXetbWnKtGqGlnzdksY0cYa0=
In-Reply-To: <20070305052355.GA13946@wintermute.farpoint>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: leslie.polzer@gmx.net
Cc: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

On 3/5/07, leslie.polzer@gmx.net <leslie.polzer@gmx.net> wrote:
> On Mon, Mar 05, 2007 at 01:54:37AM +0000, Glynn Clements wrote:
>
> > You're probably overwriting the beginning of the allocated block.
> What do you mean by that?  I can surely write to allocated memory, at
> the start, end and any point between...
>
> Besides, for the record: a short Valgrind run (thanks for the reminder!)
> showed me that I calculated the space wrongly, i.e. I allocated not
> enough memory.
>

that's what I thought. I just saw that your loop over the array didn't
depend on the defined values which were used for allocating.

Markus
