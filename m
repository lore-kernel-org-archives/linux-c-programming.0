From: "J." <mailing-lists@xs4all.nl>
Subject: Re: convert INT to CHAR - SOLVED....
Date: Thu, 13 Nov 2003 02:26:53 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0311130223420.3405-100000@hestia>
References: <00ab01c3a8ec$311abd10$bf95d1d9@PC128>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <00ab01c3a8ec$311abd10$bf95d1d9@PC128>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, 12 Nov 2003, Mikael Aronsson wrote:
> Hi !
> 
> The problem with strcat is that you cannot just use a pointer to the
> character because all C string functions require that you end the string
> with a zero (0) byte.
> 
> You could do something like this for eample:
> char temp[ 2];
> temp[ 0] = my_character;
> temp[ 1] = '\0';
> strcat( org_string, temp);
> 
> Mikael

THnkx.. I fixed that, and I allocated the return value with calloc, this 
works ... :)

I learnend something again....

Thnkx

J.

--
FOnkTong

