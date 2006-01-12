From: Scott <drmemory@3rivers.net>
Subject: Re: Double values - what precision do I use for fprintf?
Date: Thu, 12 Jan 2006 15:06:49 -0700
Message-ID: <20060112220649.GC1339@drmemory.local>
References: <200601121800.19678.samjnaa@gmail.com> <6a00c8d50601121051n691ee179kef3298829025e973@mail.gmail.com> <20060112215728.GB1339@drmemory.local>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060112215728.GB1339@drmemory.local>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Thu, Jan 12, 2006 at 02:57:29PM -0700, Scott wrote:
> On Thu, Jan 12, 2006 at 07:51:08PM +0100, Steve Graegert wrote:
> > 
> > Double precision numbering format is standardized by IEEE 754 with an
> > 8 byte encoding.  1 bit is used for the sign, 11 bits for the exponent
> > and the remaining 52 bits are used for the precision, which means
> > precision "ends" at %.52f.
> > 
> > 	\Steve
> > 
> > Steve Graegert <graegerts@gmail.com>
> 
> Ummm, I'm no expert and in fact completely out of my element here, but
> how would 52 bits yield 52 decimal numerals following the decimal
> point? Wouldn't it be true that 52 bits could represent at most an
> integer of 2^52 (4503599627370496)? So I am at a loss as to how such a
> format could accurately represent more than 16 significant decimal
> digits....

As usual, brain engages immediately *after* pressing 'send'. Wouldn't
it be more accurate to say that the format can represent:

(2^52)*(2^11) =
323170060713110073007148766886699519604441026697154840321303454275246\
551388678908931972014115229134636887179609218980194941195591504909210\
950881523864482831206308773673009960917501977503896521067960576383840\
675682767922186426197561618380943384761704705816458520363050428875758\
915410658086075523991239303855219143333896683424206849747865645694948\
561760353263220580778056593310261927084603141502585928641771167259436\
037184618573575983511523016459044036976132332872312271256847108202097\
251571017269313234696785425806566979350459972683529986382155251663894\
37335543602135433229604645318478604952148193555853611059596230656

Which is just slightly more than 52 decimal places....

Or am I way off base here...?

Scott Swanson
