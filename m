From: Alvarez Alberto-AALVARB1 <AALVARB1@motorola.com>
Subject: RE: malloc and free
Date: Mon, 20 May 2002 11:55:36 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <75B979779CA1D311808400508B6F40FF0552B52E@zes06exm01.madrid.ecid.cig.mot.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,
	Why do you 'malloc' for token? strtok returns a pointer to an already allocated string (or a null pointer), but doesn't do a copy. So, when assigning strtok to 'token', you loose the value you had allocated.

	So, the free()'ing doesn't free your former allocation, but the piece of string returned by strtok.

Regards,

Alberto.


> -----Original Message-----
> From: Sameer Maggon [mailto:smaggon@dypatil.edu]
> Sent: lunes, 20 de mayo de 2002 13:27
> To: linux-c-programming@vger.kernel.org
> Subject: malloc and free
> 
> 
> Hi,
>   In one function i have a definiton like
> 
>   char *token;
>   token = (char *)malloc(256 * sizeof(char));
> 
>   ...
>   ...
>   token = strtok(...,"\0");
>  
>   ...
>   free(token);
> 
> 
>   Now the problem is that sometimes this runs
>   fine and sometimes it crashes on free()..
>   Why so.
>   If I remove the free(..), then the program
>   works perfectly fine
> 
>   How do i correct the problem.
>   
>   Regards
>   Sameer
> 
> 
> 
> 
> 
> --------------
> http://www.dypatil.edu For Better tomorrow
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
