From: "J." <mailing-lists@xs4all.nl>
Subject: RE: obstack_alloc & _obstack_newchunk
Date: Wed, 23 Feb 2005 14:37:17 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0502231433360.1736-100000@hestia>
References: <NHBBKOOOHBAAJLGEOFLHEENEPJAC.moremari@aca.org.ar>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
In-Reply-To: <NHBBKOOOHBAAJLGEOFLHEENEPJAC.moremari@aca.org.ar>
Content-ID: <Pine.LNX.4.21.0502231433362.1736@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, 23 Feb 2005, Mariano Moreyra wrote:

> Hi J.
> 
> You need to init your obstack before using it
> Also, you need to declare this before calling obstack_init()
> 
> #define obstack_chunk_alloc malloc
> #define obstack_chunk_free free
> 
> So, your code would look like this:

<CUT>
...
</CUT>

Thank you for the complete answer.. !!

Cheers, J.

