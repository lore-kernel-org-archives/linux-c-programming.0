From: Alan Bryan <icemanind@yahoo.com>
Subject: Speaker Sound
Date: Fri, 10 Mar 2006 11:33:29 -0800 (PST)
Message-ID: <20060310193329.726.qmail@web51414.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Can someone tell me how, in linux, I could get a tone
from the PC Speaker. In DOS or Windows, I would use
something like the following code:

void Sound(int, int);

main ()
{
    Sound(1000, 100);
}

void Sound(int hertz, int duration)
{
     unsigned divisor = 1193180L / hertz;
     int portval;
     
     portval = inb( 0x61 );
     portval |= 0x03;
     outb( 0x61, portval );
     outb( 0x43, 0xB6 );
     outb( 0x42, divisor & 0xFF ) ;
     outb( 0x42, divisor >> 8 ) ; 
     sleep(duration);
     portval = inb( 0x61 );
     portval &= 0x03;
     outb( 0x61, portval );
     return;
}

The problem is, I'm not sure if I can just read and
output bytes from a port. Any alternate way would be
appreciated!

Thanks


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
