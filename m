From: Christian Beckel <Christian.Beckel@gmx.de>
Subject: Re: A Calendar app on C
Date: Wed, 2 Jun 2004 09:10:41 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200406020910.41006.Christian.Beckel@gmx.de>
References: <Pine.LNX.4.58.0406012354140.12322@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0406012354140.12322@ns.isi.ulatina.ac.cr>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

there are several possibilities to compute the number of days in a month or if 
there is a leap or not.

if (i == 2) 
	days = 28;
else
	days = 31 - ( (i != 4 || i != 6 || i != 9 || i != 11) ? 1 : 0 );

I think there is no simpler way, because the numbers of months are unregular.



> Hi.
>
> I am trying to program a basic calendar software in C. The idea is to ask
> for a year and display all the calendar from january to december. How to
> code such app taking care of 31/28 days month and check each 4 year for a
> leap year? Any idea/comment/advice/code is welcome.
>
>
> best regards,
>
> ---
> Fabio Andres Miranda
> Ingenieria de sistemas informaticos
> Universidad Latina - Costa Rica
>
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
