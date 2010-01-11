From: ern0 <ern0@linkbroker.hu>
Subject: Re: Help on a memory leak issue
Date: Mon, 11 Jan 2010 21:17:50 +0100
Message-ID: <4B4B876E.8030902@linkbroker.hu>
References: <8eec89ee1001110705k3257bd80r2a719a67b0bda641@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <8eec89ee1001110705k3257bd80r2a719a67b0bda641@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

> I have a client server application which uses a local file socket.
> When i connect to the server part and then close the connection the
> memory usage stays the same indicating that the resources aren't
> freed. Other then this memory leak problem everything is working fine.

I assume, the memleak is not in the part of the code you've been sent, 
but who knows. Let's exclude that case.

If I were you, I would change the server code to a short one, which 
sends back a dummy simple "ok" or "fail" message (the simpler one), I 
guess, the "..." part of your code is that place:

   if (read(client_socket_fd, &length, sizeof (length)) > 0) {
     .....
   }

Then fire as many request as you can, and check the mem.
-- 
ern0.scene.plus4.amiga.code.muzak
Haben Sie Fragen?

