From: r_zaca <r_zaca@ig.com.br>
Subject: Re: Random number generator
Date: Thu, 10 Mar 2005 08:01:19 -0300
Message-ID: <20050310_110119_011142.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1110452476"
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1110452476
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

   I read about somethink like that another day in the www.embedded.com. I 
don't have the exact link, but you can shearch for it. Good luck. 

Vineet Joglekar wrote: 
> Hi all, 
> 
> Can someone please tell me where can I find and which 
> random/pseudo-random number generator can I use inside the linux 
> kernel? (2.4.28) 
> 
> I found out 1 function get_random_bytes() in 
> linux/drivers/char/random.c but thats not what I want. 
> 
> I want a function where I will be supplying a seed to that function 
> as an input, and will get a random number back. If same seed is used, 
> same number should be generated again. 

Without knowing what you're doing I can't say if it justifies having all 
that extra code around, but the stuff from the library, like srand48, 
will do this. You can add the code to your module. 

--Message-Boundary-by-Mail-Sender-1110452476--

