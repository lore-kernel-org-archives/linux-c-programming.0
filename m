From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: exploitable function
Date: Wed, 26 Jun 2002 00:43:45 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020626004345.B2816@neutrino.particles.org>
References: <20020625160221.A489@nietzsche>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020625160221.A489@nietzsche>; from xlp@emtel.net.co on Tue, Jun 25, 2002 at 04:02:21PM -0500
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xlp <xlp@emtel.net.co>
Cc: linux-c-programming@vger.kernel.org

On Tue, Jun 25, 2002 at 04:02:21PM -0500, xlp wrote:
> hi, if this code is setuid root, is exploitable:
> 
> if(argc==2){
> 	        if(!strcmp("-show_release",argv[1]))
>         {
>                 printf("%s\n", VERSION);
>                 exit(1);
>         }
> }

It's not. 

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
