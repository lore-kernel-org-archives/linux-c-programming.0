From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: parse error
Date: Sat, 25 Sep 2004 09:29:01 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040925062900.GC1997@velka.phys.uoa.gr>
References: <20040926143252.39003.qmail@web52902.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040926143252.39003.qmail@web52902.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

On Sun, Sep 26, 2004 at 03:32:52PM +0100, Ankit Jain wrote:
> hi
> 
> i could not understand why compiler has put semi colon
> before else due t owhich this parse error comes....
> 
> thanks
> 
>   
> #define exch(x,y) { int tmp; tmp=x; x=y; y=tmp; }

#define exch(x,y) do { int tmp; tmp=x; x=y; y=tmp; } while(0);

Regards,
-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
