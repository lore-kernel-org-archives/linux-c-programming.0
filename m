From: Neil Horman <nhorman@tuxdriver.com>
Subject: Re: Function stack reallocation
Date: Wed, 28 Mar 2007 07:36:44 -0400
Message-ID: <20070328113644.GA1892@hmsreliant.homelinux.net>
References: <460A177A.4080506@um.edu.mt>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <460A177A.4080506@um.edu.mt>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reggie Cushing <reggie.cushing@um.edu.mt>
Cc: linux-c-programming@vger.kernel.org

On Wed, Mar 28, 2007 at 09:21:30AM +0200, Reggie Cushing wrote:
> Hi All - I wish some insight on the possibility of reallocating a 
> function stack to a malloced regions in realtime ie I jump out of a 
> function and the next time I jump in the stack would have moved along 
> with its data. To me it seems unreliable cause the values in the stack 
> have no type hence I would not know if the stack value is a data value 
> or a pointer. If I mistakenly interpret a data value as a pointer I will 
> update the data value resulting in data corruption. I would really wish 
> some expert insight in this on this subject.
> 

Don't do it.  As you mention, you won't be able to conclusively detrmine if you
are moving a pointer in the stack or a data value to your new location (i.e.
arrays).  You could probably make it work most of the time, but you could never
guarantee that you always got it right.  

Neil

> Regards
> R.
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
