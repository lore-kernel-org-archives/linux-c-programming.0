From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Into the Void
Date: Wed, 2 Feb 2005 13:17:33 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA3636@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Glynn Clements' <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org



-----Original Message-----
From: Glynn Clements [mailto:glynn@gclements.plus.com]
Sent: Wednesday, February 02, 2005 7:16 AM
To: linux-c-programming@vger.kernel.org
Subject: RE: Into the Void

Glynn wrote:

>Huber, George K RDECOM CERDEC STCD SRI wrote:

>> Well we have not put anything in that memory location yet, and
>> as I recall, under Linux any memory is zero-out when returned by malloc to
>> help prevent information leakage from one application to another.

>Memory contains zeroes when it is first given to the process by the
>kernel. Whether or not memory returned from malloc() contains zeroes
>depends upon whether that memory has been used previously by the
>current process.

Agreed.

I was thinking of the case where there are multiple processes running at a time.  Each
process has it quanta `on the' processor and then another is swapped in.  I do not 
recall ever hearing if on a switch from one process to another if memory is reset or if 
the pages are just swapped back in.

Any one have information on this?

George
