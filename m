From: David Eduardo Gomez "Noguera a.k.a. dabicho" 
	<davidgn@servidor.unam.mx>
Subject: Re: On threads (kind of)
Date: 22 May 2002 16:14:51 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1022102096.22782.40.camel@garcilazo.unicom.ife.org.mx>
References: <1022020531.19456.15.camel@garcilazo.unicom.ife.org.mx> 
	<20020522100037.0017c63e.mitko@rila.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020522100037.0017c63e.mitko@rila.bg>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: programming <linux-c-programming@vger.kernel.org>

On Wed, 2002-05-22 at 02:00, Dimitar Peikov wrote:
> On 21 May 2002 17:35:27 -0500
> David Eduardo Gomez Noguera aka el bicho <davidgn@ife.org.mx> wrote:
> 
> > Hello again.
> > 
> > I am doing a gtk app that uses a thread to comunicate with a device
> > via the serial port.
> > 
> > It sets the serial port to 
> > serial_attr.c_cc[VMIN] = 1;
> > serial_attr.c_cc[TIME] = 0; 
> > 
> > 
> > and a thread (created tih glib-2.0's g_thread_create) calls a function
> > to read a group of bytes from the serial port. the first of wich is a
> > syncronization byte to recognize the beginning of the pack. (all
> > packets are the same size).
> > 
> > so this is such function.
> > 
> > 	read (serialfd, &(movement->sync), 1);
> > 	while(!(movement->sync & 0x80)) //this keeps reading until the
> > sincronization byte is read.
> > 		read (serialfd, &(movement->sync), 1);
> > 	
> > 	read (serialfd, &(movement->b1), 1);
> > 	read (serialfd, &(movement->b2), 1);
> > 	read (serialfd, &(movement->b3), 1);
> > 	read (serialfd, &(movement->check_sum), 1);
> > 
> > That is obviously wrong, since a toggle button starts and "stops" this
> > thread (it actually sets a static global int to 0 or 1 to tell the
> > thread to stop, both are declared in the same source file), but if
> > there is no info in the serial, the read function will never return,
> > and the thread will never end. (the read function is declared in a
> > sepparate file). and the, the joined gtk_main thread would never
> > continue.
> > 
> > I am thinking of a solution to this, making a stat global in that
> > other file for the read's while to stop when that variable changes.
> > i.e.
> > 
> > 	while(!(movement->sync & 0x80) && !test) //this keeps reading
> > 	until the sincronization byte is read.
> > 		read (serialfd, &(movement->sync), 1);
> > 
> > and changing that value from yet another function.
> > 
> > 	void stopreading(void) 
> > 	{ test=1;
> > 	}
> > then, the read function would set test back to 0 before returning.
> > 
> > (I would need to set 
> > 	serial_attr.c_cc[VMIN] 
> > and
> > 	serial_attr.c_cc[VTIME]
> > to some other values, of course)
> > 
> > I have the feeling that this is a mess and bad programming practices.
> > cold anybody please give me sme suggestions?
> > 
> > Thank you.
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-c-programming" in the body of a message to
> > majordomo@vger.kernel.org More majordomo info at 
> > http://vger.kernel.org/majordomo-info.html
> 
> Why you don't try using semaphores and some shared memory or 
> send messages between processes to exchange data? Your semaphore 
> or even more simple using mutex can toggle serial IO. Thus you would 
> distinguish communication and business logic of the application!
> 

I have never understood well shared memory on threads. So far i do it
with globals. (two threads would shere memory if both were created from
the same function, but i just create one new thread each time a botton
is toggled, and with a static global i tell it to stop).
Though if i passwd a pointer to a static variable, that way the thread
would have access to a variable local to the function that created it.
Or is there other way to share memory?




