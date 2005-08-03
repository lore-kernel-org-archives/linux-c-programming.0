From: Steve Graegert <graegerts@gmail.com>
Subject: Re: 64 bit network access
Date: Wed, 3 Aug 2005 16:07:16 +0200
Message-ID: <6a00c8d50508030707729521e1@mail.gmail.com>
References: <CA0BCF3BED56294AB91E3AD74B849FD51F1933@us-arlington-0668.mail.saic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CA0BCF3BED56294AB91E3AD74B849FD51F1933@us-arlington-0668.mail.saic.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Kirkwood, David A" <DAVID.A.KIRKWOOD@saic.com>
Cc: linux-c-programming@vger.kernel.org

On 8/3/05, Kirkwood, David A <DAVID.A.KIRKWOOD@saic.com> wrote:
> I have an client server application which is comprised of a 64bit-word
> servers and clients  and clients  and 32 bit word word clients. When this
> was 32 bit only I used htons and htonl etc and everything worked fine. Is
> there such a standard for the addition of 64 bit-word systems or is it up to
> be to handle this on my own. Assume that the integers always fit into 32
> bits, but what will happen in other systems when they don't?

David,

Unfortunately there is no short answer.  The size of integers and
other data types depend on the data model incorporated by the
underlying compiler and the machine.

Today three models are known:

(a) LP64 data model (long pointer 64 bits)
(b) ILP64 data model (integer long pointer 64 bits, not ANSI C)
(c) LLP64 data model (long long pointer 64 bits)


Datatype  LP64 ILP64 LLP64 ILP32 LP32 
------------------------------------
char      8    8     8     8     8 
short     16   16    16    16    16   
int       32   64    32    32    16 
long      64   64    32    32    32 
long long 64   
pointer   64   64    64    32    32 


Most vendors, namely DEC, Hewlett-Packard, IBM, Novell, SCO and Sun
Microsystems, endorsed the new LP64 data model and although it is not
offically standardized they silently agreed on this model. 
Nevertheless, they are expected to provide systems that simultaneously
support both, LP64 and ILP32 (the traditional model for 32-bit
machines), or even all three.

Since the transition from ILP32 to LP64 is quite natural and requires
only minor changes to standard libraries you can still make use of
htons and htonl.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
