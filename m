From: Suciu Flavius <suciuflavius@tiscali.de>
Subject: Re: -EFAULT during freeing a pointer to a structure
Date: Fri, 08 Oct 2004 08:36:12 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <ck5bs3$uis$1@sea.gmane.org>
References: <OFA6DAB128.ACBA7070-ONC1256F24.0054FB89@bln.d-trust.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OFA6DAB128.ACBA7070-ONC1256F24.0054FB89@bln.d-trust.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

your problem is with the vector limit:
struct abc mystruct[7];

mystruct[7].bla = "bla bla bla" IS SEGMENTATION FAULT !!!!!

the valid range is 0 - 6, so the last one is mystruct[6].bla = "bla";

The multiply by 4 is another stuff, the 32 bits and more processors 
loves to read from 4n addresses, that's why compilers generate structs 
with sizeof == 4n

But, anyway, your problem here is the vector limit, read the manual ;)



p.boehm@d-trust.net wrote:
> hi,
> I've found the error. the problem occurs if MAXNUM or number of array to store pointers of another
> structure is odd.
> I know that malloc() always allocates memory as multiple of 4 but in my case it is so:
> 
>      struct xy {
>           int id;        /* sizeof(int)=4 */
>           char *name;         /* sizeof(char *)=4 */
>      };
> 
>      struct abc {
>           struct xy *next[7]; /* sizeof(struct xy *) * 7 = 4 * 7 = 28 */
>      };
> 
>      => all in all 36 bytes, and that's even!
> 
> Can someone explain this? (I fears the solution is more than easy ...)
> pb
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

