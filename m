From: Andrew Edmondson <inbox@andy.co.uk>
Subject: Re: Running make seems to be crashing my computer.
Date: Wed, 8 May 2002 20:53:28 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <02050820532800.02600@localhost.localdomain>
References: <02050222174801.01065@localhost.localdomain> <20020502220737.GA16467@cam.ac.uk>
Reply-To: inbox@andy.co.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020502220737.GA16467@cam.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Thu, 02 May 2002, you wrote:

> My guess is filesystem corruption. Reboot to emergency mode or with
> init=/bin/bash and fsck it.
>
> Steven Smith,
> sos22@cam.ac.uk.

After a little bit of carefull looking (due to the other suggestions) I have 
found that it was the file-system. Thank you all very much for your help.

Andrew


-- 

for x in *; do echo go on\!; sleep 1;done; echo Have a cup of tea\!
