From: Progga <abulfazl@juniv.edu>
Subject: Re: clear the screen
Date: Wed, 23 Feb 2005 18:54:57 +0600
Message-ID: <20050223185457.A550@Imrashi.net.bd>
References: <1108969688.5088.12.camel@localhost.localdomain> <16923.52084.408249.817998@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16923.52084.408249.817998@gargle.gargle.HOWL>; from glynn@gclements.plus.com on Wed, Feb 23, 2005 at 12:16:52AM +0000
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, Feb 23, 2005 at 12:16:52AM +0000, Glynn Clements wrote:
> 
> See the manpage for setupterm() and tigetstr() for more information.

 Should it be like this ? 


<code>
    char *area[100], bp[2048] ;

    tgetent( bp, getenv( "TERM" )) ;
    puts( tgetstr( "cl", area )) ;
</code>


