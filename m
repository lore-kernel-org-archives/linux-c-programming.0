From: "J." <mailing-lists@xs4all.nl>
Subject: Re: gcc: Floating point exception
Date: Sun, 20 Feb 2005 22:13:38 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0502202211280.2139-100000@hestia>
References: <20050220210522.GR17589@lug-owl.de>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
In-Reply-To: <20050220210522.GR17589@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sun, 20 Feb 2005, Jan-Benedict Glaw wrote:

> On Sun, 2005-02-20 21:58:54 +0100, J. <mailing-lists@xs4all.nl>
> wrote in message <Pine.LNX.4.21.0502202150070.2008-100000@hestia>:
> >  int red = 0; 
> >  int green = 128; 
> >  int blue = 0;
> > 
> >  printf("%d %d %d\n", (100 / (256 / red)), 
> >    (100 / (256 / green)), (100 / (256 / blue)));
> 
> With red = blue = 0, you're having two divisions by zero. That won't
> fly...
> 
> MfG, JBG

Aiii.. of course !!

Thnkx....

J.

