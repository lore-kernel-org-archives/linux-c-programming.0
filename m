From: Anindya Mozumdar <anindya@cmi.ac.in>
Subject: Re: Random number generator in Linux kernel
Date: Tue, 8 Mar 2005 10:10:42 +0530
Message-ID: <20050308044042.GA9364@cmi.ac.in>
References: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com> <Pine.LNX.4.21.0503080109090.1705-100000@hestia>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0503080109090.1705-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: vintya@excite.com, mailing-lists@xs4all.nl

Hi,
   This method ,i.e, using /dev/urandom should work but there should be 
   sufficient entropy to generate enough random data. For example, if
   you take an octal dump of /dev/urandom (hexdump quits when there is
   no more data in the file while od waits for more data), and then dont
   touch your machine for a few seconds, it stops - and starts printing
   the dump only when you move the mouse or something.
   Sorry for being very vague, but I guess the idea should be clear.
Anindya.

On Tue, Mar 08, 2005 at 01:25:23AM +0100, J. wrote:
> On Mon, 7 Mar 2005, Vineet Joglekar wrote:
> > Hi all,
> > 
> > Can someone please tell me where can I find and which random/pseudo-random 
> > number generator can I use inside the linux kernel? (2.4.28)
> 
> I Don't know how this is done for actual use in the kernel itself - So I
> cannot answer that particular question and... I may be way out of my
> league here, but why not use /dev/urandom ? Just to illustrate! I have
> included an example of that below... If it lives up to your idea of
> `cryptographicly secure' - ... ? 
> 
> > I found out 1 function get_random_bytes() in linux/drivers/char/random.c 
> > but thats not what I want.
> > 
> > I want a function where I will be supplying a seed to that function as an input, 
> > and will get a random number back. If same seed is used, same number
> > should be generated again.
> > 
> > Can anybody please help me with that?
> > 
> > Thanks and regards,
> > 
> > Vineet.
> 
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/types.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <time.h>
> 
> unsigned time_seed(void);
> int get_rand_val(int low, int high);
> 
> int main(void) {
>  int i = 0;
> 
>  srand((time_seed()));
> 
>  for(i = 0; i < 10; i++)
>   printf("%d\n", get_rand_val(1, 10));
> 
>  return 0;
> }
> 
> int get_rand_val(int low, int high) {
>  int k = 0;
>  double d = 0;
> 
>  d = (double)rand() / ((double)RAND_MAX + 1);
>  k = (int)(d * (high - low + 1));
>  return(low + k);
> }
> 
> unsigned time_seed(void) {
>  int retval = 0;
>  int fd = 0;
>     
>  if(open("/dev/urandom", O_RDONLY) == -1) {
>   retval = (((int)time(NULL)) & ((1 << 30) - 1)) + getpid();
>  } else {
>   read(fd, &retval, 4);
>   /* positive values only */
>   retval = abs(retval) + getpid();
>   close(fd);
>  }
> 
>  return retval;
> }
> 
> Cheers, J.
> 
> --
> http://www.rdrs.net/
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
