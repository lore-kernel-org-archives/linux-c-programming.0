From: joy <gracecott@sancharnet.in>
Subject: Re: various doubts part 2
Date: Thu, 12 Aug 2004 16:19:44 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <411B4B48.9000901@sancharnet.in>
References: <41183899.9000203@sancharnet.in>
 <1092121443.1419.3.camel@linux.local> <411989D8.1030000@sancharnet.in>
 <20040811192131.52ff2760.lcapitulino@terra.com.br>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <20040811192131.52ff2760.lcapitulino@terra.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Cc: lantis@iqranet.info, linux-c-programming@vger.kernel.org

Luiz Fernando N. Capitulino wrote:

> Don't, I found the bug:
>
>while((bytes_read = read(STDIN_FILENO,buff,sizeof(buff))>0))
>
> look where ">0" is inside... If you change to:
>
>while((bytes_read = read(STDIN_FILENO,buff,sizeof(buff)))>0)
>
>  
>
Ouch as usual, the retard in me begins to show up.........

> it will work... man, this bug needed about 20 min to be catch up...
>
> every time I did run the program I tought "it _must_ work, all is
>right"... Only saw the bug when I started to write it again myself. :)
>
>  
>
You DO have some kind of  obsessive compulsive disorder ( You remind me 
of myself :-)

> and I didn't played with the second part of the code, because
>I didn't understand very well what do you want.
>
>PS(0): I'm not a C expert, but I advice you: *always* try to write
>clean code.
>
>PS(1): I worked in this because I can't sleep when something which
>should work don't work.
>
>
>  
>
Thanks a lot, anyway I had rewritten the code using frread and fwrite, 
forgot to do an fflush,
got empty output files , almost broke my computer , added an fclose just 
after the fwrite,
got nice output files, cried in happiness, and swore to write clean code 
an hour before I
read this mail ;-).

regards,
Joy.
