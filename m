From: Kurt Kehler <kmk@pa.net>
Subject: Re: Segmentation fault
Date: Tue, 16 Apr 2002 15:30:40 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.10.10204160232390.587-100000@darkstar.example.net>
References: <OF5DFD5B6D.7D47A4C9-ON65256B98.0022D8F5@pune.tcs.co.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF5DFD5B6D.7D47A4C9-ON65256B98.0022D8F5@pune.tcs.co.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Thu, 11 Apr 2002, Hemant Mohan wrote:

> I compiled this code with gcc-3.0.3  and ran it.  It displays the output as:
> 
> Easter in 2002 on 3/31
> 
> There was no segmentation fault or any other messages. Attachment easter.c 
> contains the source code with a small modification from yours. I only moved 
> the #include <stdio.h> line before the definition of easter().

Hemant,

Thanks for taking the time to do this.  Moving the #include <stdio.h> did
not prevent the segmentation fault.

Kurt Kehler

