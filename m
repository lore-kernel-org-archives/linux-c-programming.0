From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Subject: Re: quotactl
Date: Wed, 02 Jul 2003 15:20:13 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F03225D.30601@fi.uba.ar>
References: <Pine.LNX.4.44.0307021401270.20193-100000@gpu.utcc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Francis Lau <fkwlau@utcc.utoronto.ca>
Cc: linux-c-programming@vger.kernel.org

   If you did not recompile the kernel, it has quota support. Has the FS 
you are quering been mounted with the usrquota option?

Francis Lau wrote:
>>make a clean compilation of the kernel from the beggining.(use make clean &&
>>make mrproper).Be sure that no object files exist when you start building
>>your new kernel.Try this....and e-mail again:)
>>
> 
> I'm running RedHat 9 with the stock 2.4.20 SMP kernel.  Unfortunately, I 
> cannot (not allowed to) recompile the kernel...Any other suggestions?
> 
> Thanks
> Francis
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


