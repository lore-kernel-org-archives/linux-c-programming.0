From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Using Library Via Piping
Date: Thu, 10 Feb 2005 16:34:35 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA363D@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Amit Dang' <amit_dang@intersolutions.stpn.soft.net>, linux-c-programming@vger.kernel.org

Amit wrote,

>Is there any way of using library functionality via pipes rather than
>linking? If yes, could any body give a brief explanation or point to some
>available information. I am clear about the concept of invoking executables
>via pipes but not about using library.

I do not think so.  Thinking about it, both `ends' of a pipe need to be 
attached to something prior to data transmission.  In a library, the image
is not loaded into memory until some program that needs it is executed, so 
there (as far as I can see) would be no way for the library to connect to 
its end of the pipe.

Just out of curosity - what are you trying to do?  It almost seems like you
are attemping to create something akin to an out-of-process (from Microsoft's
COM/DCOM stuff) server.

George

