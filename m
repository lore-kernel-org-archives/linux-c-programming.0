From: "Dan Gary" <funkychunkymunky@gmail.com>
Subject: Re: max heap usage of a Linux process
Date: Mon, 13 Nov 2006 07:39:10 -0800
Message-ID: <1450f66c0611130739k5391a9adu26f9698f22df4c85@mail.gmail.com>
References: <455873BA.1060908@Sun.COM>
	 <d9def9db0611130609q305b243y188f01902c9ff418@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <d9def9db0611130609q305b243y188f01902c9ff418@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

unless parent is asking about malloc'd space, then mallinfo() or
malloc_stats() might be what they're looking for, memory profiling the
manual way, gotta love it

On 11/13/06, Markus Rechberger <mrechberger@gmail.com> wrote:
> Hi,
>
> On 11/13/06, Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com> wrote:
> > Hi,
> >
> > Can anybody please tell how can I obtain the max. heap usage of a Linux
> > process?
> >
>
> theoretically 3 GB (3/4 of 4gb - which are addressable by 32 bit) on a 32bit machine on a 64bit machine 3/4 of 16exabyte.
>
> cheers,
> Markus
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
