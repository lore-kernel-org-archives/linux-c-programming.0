From: David Eduardo Gomez Noguera aka el bicho <davidgn@ife.org.mx>
Subject: On threads (kind of)
Date: 21 May 2002 17:35:27 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1022020531.19456.15.camel@garcilazo.unicom.ife.org.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: programming <linux-c-programming@vger.kernel.org>

Hello again.

I am doing a gtk app that uses a thread to comunicate with a device via
the serial port.

It sets the serial port to 
serial_attr.c_cc[VMIN] = 1;
serial_attr.c_cc[TIME] = 0; 


and a thread (created tih glib-2.0's g_thread_create) calls a function
to read a group of bytes from the serial port. the first of wich is a
syncronization byte to recognize the beginning of the pack. (all packets
are the same size).

so this is such function.

	read (serialfd, &(movement->sync), 1);
	while(!(movement->sync & 0x80)) //this keeps reading until the
sincronization byte is read.
		read (serialfd, &(movement->sync), 1);
	
	read (serialfd, &(movement->b1), 1);
	read (serialfd, &(movement->b2), 1);
	read (serialfd, &(movement->b3), 1);
	read (serialfd, &(movement->check_sum), 1);

That is obviously wrong, since a toggle button starts and "stops" this
thread (it actually sets a static global int to 0 or 1 to tell the
thread to stop, both are declared in the same source file), but if there
is no info in the serial, the read function will never return, and the
thread will never end. (the read function is declared in a sepparate
file). and the, the joined gtk_main thread would never continue.

I am thinking of a solution to this, making a stat global in that other
file for the read's while to stop when that variable changes. i.e.

	while(!(movement->sync & 0x80) && !test) //this keeps reading until the
sincronization byte is read.
		read (serialfd, &(movement->sync), 1);

and changing that value from yet another function.

	void stopreading(void) 
	{ test=1;
	}
then, the read function would set test back to 0 before returning.

(I would need to set 
	serial_attr.c_cc[VMIN] 
and
	serial_attr.c_cc[VTIME]
to some other values, of course)

I have the feeling that this is a mess and bad programming practices.
cold anybody please give me sme suggestions?

Thank you.

