From: "J." <mailing-lists@xs4all.nl>
Subject: Re: Random number generator in Linux kernel
Date: Tue, 8 Mar 2005 01:25:23 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0503080109090.1705-100000@hestia>
References: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
In-Reply-To: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Mon, 7 Mar 2005, Vineet Joglekar wrote:
> Hi all,
> 
> Can someone please tell me where can I find and which random/pseudo-random 
> number generator can I use inside the linux kernel? (2.4.28)

I Don't know how this is done for actual use in the kernel itself - So I
cannot answer that particular question and... I may be way out of my
league here, but why not use /dev/urandom ? Just to illustrate! I have
included an example of that below... If it lives up to your idea of
`cryptographicly secure' - ... ? 

> I found out 1 function get_random_bytes() in linux/drivers/char/random.c 
> but thats not what I want.
> 
> I want a function where I will be supplying a seed to that function as an input, 
> and will get a random number back. If same seed is used, same number
> should be generated again.
> 
> Can anybody please help me with that?
> 
> Thanks and regards,
> 
> Vineet.

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>

unsigned time_seed(void);
int get_rand_val(int low, int high);

int main(void) {
 int i = 0;

 srand((time_seed()));

 for(i = 0; i < 10; i++)
  printf("%d\n", get_rand_val(1, 10));

 return 0;
}

int get_rand_val(int low, int high) {
 int k = 0;
 double d = 0;

 d = (double)rand() / ((double)RAND_MAX + 1);
 k = (int)(d * (high - low + 1));
 return(low + k);
}

unsigned time_seed(void) {
 int retval = 0;
 int fd = 0;
    
 if(open("/dev/urandom", O_RDONLY) == -1) {
  retval = (((int)time(NULL)) & ((1 << 30) - 1)) + getpid();
 } else {
  read(fd, &retval, 4);
  /* positive values only */
  retval = abs(retval) + getpid();
  close(fd);
 }

 return retval;
}

Cheers, J.

--
http://www.rdrs.net/

