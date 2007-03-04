From: "Markus Rechberger" <mrechberger@gmail.com>
Subject: Re: Handling ioctl() argp memory
Date: Sun, 4 Mar 2007 19:21:08 +0100
Message-ID: <d9def9db0703041021o77aa2942s64bb5201073efa3b@mail.gmail.com>
References: <20070304164844.GA7231@wintermute.farpoint>
	 <d9def9db0703040852m2df3b0d8l42cf57b0c8ae9e15@mail.gmail.com>
	 <20070304170402.GA7625@wintermute.farpoint>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=sOZxvRwNovLKV8rUgMkyn2Nd8nGCh7xhuyfkankFJa04MpBLMTPRUrgcVqGF792L+l7gR0hk5Jfwp2oh5TnkuCtesxDeeQieyfNMYaH6EX0S58c75EG20Y6WY0f9dwp8+S1n9x5FoCjVEV3dK3RApqYJlg74dS5nmfDWbIZReik=
In-Reply-To: <20070304170402.GA7625@wintermute.farpoint>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: leslie.polzer@gmx.net
Cc: linux-c-programming@vger.kernel.org

Did you run over it with valgrind already?


On 3/4/07, leslie.polzer@gmx.net <leslie.polzer@gmx.net> wrote:
> On Sun, Mar 04, 2007 at 05:52:20PM +0100, Markus Rechberger wrote:
>
> > could you show us the sourcecode?
> Take a look at the main function of the attached file.
> I'm allocating memory at the start for new_map, but when I attempt
> to free it at the end, libc complains.
>
> I think now it's not related to the ioctl, since freeing 'map' works
> (which is also used with ioctl), but freeing 'mapping' does not, despite
> it being not passed via ioctl.
>
> The problem has to be somewhere else, but I cannot see where...
>
>   Leslie
>
> --
> gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83
> http://nic-nac-project.de/~skypher/
>


-- 
Markus Rechberger
