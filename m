From: Honnavalli_Sreevathsa@emc.com
Subject: RE: script in c
Date: Mon, 8 Nov 2004 06:15:17 -0000
Message-ID: <50C05B7AA7D6924FB5E384EF14BC647B495D93@inba1mx2.corp.emc.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaushal@rocsys.com, linux-c-programming@vger.kernel.org

You can use popen() and pclose() calls


> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org 
> [mailto:linux-c-programming-owner@vger.kernel.org] On Behalf 
> Of kaushal
> Sent: Monday, November 08, 2004 11:09 AM
> To: linux prg
> Subject: script in c
> 
> 
> Hello  all,
>            Is there a way by which I can exec a shell script 
> without using the "system()" call? Thanks in advance.
>  
> cheers-
> kaushal.
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in the body of a message to 
> majordomo@vger.kernel.org More majordomo info at  
http://vger.kernel.org/majordomo-info.html
