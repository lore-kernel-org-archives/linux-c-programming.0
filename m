From: Bryan Christ <bryan.christ@hp.com>
Subject: Re: standard OS defines
Date: Wed, 22 Aug 2007 14:48:41 -0500
Message-ID: <46CC9319.9020807@hp.com>
References: <46CC81E9.1080904@hp.com> <200708221524.41782.kratzers@pa.net> <46CC8E51.4050201@hp.com> <200708221547.25508.kratzers@pa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200708221547.25508.kratzers@pa.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kratzers@pa.net
Cc: linux-c-programming@vger.kernel.org

ugly or not--thanks again!

Stephen Kratzer wrote:
> On Wednesday 22 August 2007 15:28:17 Bryan Christ wrote:
>> Thanks!  This list is exactly what I was looking for.  Too bad there's
>> not a tool for piping to gcc--I was trying to avoid -D.
>>
>> Bryan
> 
> This is about as ugly as it gets, but here it is anyway:
> 
> echo -e "#ifndef __SOMETHING__\n#define __SOMETHING__\n#endif" | cat - 
> infile.c | gcc -x c -o outfile.c -
