From: Pankaj <pankajd@myrealbox.com>
Subject: Re: feof fails
Date: Wed, 15 Sep 2004 16:43:53 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200409151643.53618.pankajd@myrealbox.com>
References: <B0003441729@hermes.imsd.uni-mainz.de>
Reply-To: pankajd@myrealbox.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <B0003441729@hermes.imsd.uni-mainz.de>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: stalp@imbei.uni-mainz.de
Cc: linux-c-programming@vger.kernel.org

hi,
Check whether u have put a \n at the end of last character..
u might have missed it.

Pankaj
On Wednesday 15 Sep 2004 3:09 pm, Christian Stalp wrote:
> Hello together,
> I have a simple problem. I opened a file with fopen and read from the file
> with:
>   while ( !feof( infile ) )
>  {
>    fgets( buffer, BUFFER_SIZE, infile );
>    new_number = atoi ( buffer );
> ......
>
> The file is filled withe a stack of numbers, 7 charakters and each is
> terminated by an '\n'.
>
> My problem now is, that the last number is been read twice. What is the
> problem?
>
> Gruss Christian
