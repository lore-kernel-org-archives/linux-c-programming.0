From: Rechberger Markus <mrechberger@gmail.com>
Subject: Re: ioctl.h
Date: Fri, 4 Mar 2005 22:55:41 +0100
Message-ID: <d9def9db0503041355660768a0@mail.gmail.com>
References: <4228B3B8.7020507@valdosta.edu>
Reply-To: Rechberger Markus <mrechberger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4228B3B8.7020507@valdosta.edu>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael young <mhyoung@valdosta.edu>
Cc: linux-c-programming@vger.kernel.org

hey Michael,

here just an example:

this small tool opens the cd tray

#include <sys/types.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <linux/cdrom.h>

int main(){
    int cdrom;
    if ((cdrom = open("/dev/cdrom",O_RDONLY | O_NONBLOCK)) < 0) {
            perror("open");
            exit(1);
    }
    if (ioctl(cdrom,CDROMEJECT,0)<0) {
            perror("ioctl");
            exit(1);
    }
    close(cdrom);
    return(0);
}

simply build it with gcc tray.c -o tray

look at cdrom.h for more defined operations, you will also find
CDROMEJECT in there, 0 is an argument see the manpage (man ioctl) for
more infos..

Markus

On Fri, 04 Mar 2005 14:15:04 -0500, michael young <mhyoung@valdosta.edu> wrote:
> Hi,
> how do you use the ioctl.h?
> there seems to be little info on it
> on the web or in print. If you know
> of anything on the web please let me
> know.
> 
> thank you,
> Mike
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
