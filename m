From: Marius Nita <marius@cs.pdx.edu>
Subject: Re: is it a buf or what?
Date: Sat, 8 Jun 2002 10:24:48 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020608102448.A1510@cs.pdx.edu>
References: <Pine.LNX.4.33.0206081601090.19134-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0206081601090.19134-100000@soochak.ncst.ernet.in>; from khalid@ncst.ernet.in on Sat, Jun 08, 2002 at 04:03:35PM +0530
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux-c-programming@vger.kernel.org

On Sat, Jun 08, 2002 at 04:03:35PM +0530, Mohammed Khalid Ansari wrote:
> 
> Hi,
> 
> I had written a small program as follows...
> 
> #include <stdio.h>
> 
> int main()
> {
> 	char	*ptr;
> 	
> 	strcpy (ptr, "khalid");

Try this with a larger string, say 400 bytes. It will most likely segfault.
Since your string is small, there's a high probability that ptr will be
pointing to a small chunk of writable memory, in which your 7 bytes happen to
fit.

> 	printf ("%s\n", ptr);
> 	return 0;
> }
> 
> As you can see, I haven't allocated the space for the pointer ptr. When I 
> ran the program, instead of giving me the segmentation fault, it just ran 
> printing "khalid". Is it a bug of gcc or the kernel.

Neither. This is perfectly normal behavior.

> -- 
> 
> **************************************************************************
> 
> Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
> Assistant Manager II                          (off) : 0091-022-2024641
> National Centre for Software Technology   Fax       : 0091-022-2049573 
> 8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
> Mumbai 400021.
> 
> Homepage : http://soochak.ncst.ernet.in/~khalid			  	  
> 
> **************************************************************************
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
