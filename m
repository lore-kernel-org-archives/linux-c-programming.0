From: "J." <mailing-lists@xs4all.nl>
Subject: RE: <time.h>: solved thank you ....
Date: Fri, 9 May 2003 21:46:48 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0305092142410.13952-100000@hestia>
References: <EF836A380096D511AD9000B0D021B52701317B4A@narmada.techmas.hcltech.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <EF836A380096D511AD9000B0D021B52701317B4A@narmada.techmas.hcltech.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Fri, 9 May 2003, Ranga Reddy M - CTD ,Chennai. wrote:
> 
> Hi,
> 
> Here you are comparing the gmtime() output to The "date" command.
> 
> see the man pages of gmtime().This will give you the time in UTC format.
> use localtime(). Gives same as your "date" output.
> 
> I have modified your code .Know it gives the 
> The code below.
> 
> #include <stdio.h>
> #include <time.h>
> 
> int main(void) {
>  struct tm *tm_ptr;
>  time_t the_time;
> 
>  (void)time(&the_time);
>  tm_ptr = localtime(&the_time);
> 
>  printf("tm_ptr->tm_hour = %d\n", tm_ptr->tm_hour);
> 
>  return 0;
> }
> 
> Cheers
> --------
> Ranga Reddy M

Thank you for the complete reply ! 

I understand what I did wrong, and how to do it better next time.

Merci....

J.

