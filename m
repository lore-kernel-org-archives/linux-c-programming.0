From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Function call
Date: Wed, 1 Mar 2006 16:39:22 +0000
Message-ID: <17413.52794.925863.87192@cerise.gclements.plus.com>
References: <50C05B7AA7D6924FB5E384EF14BC647B04D9A8A3@inba1mx2.corp.emc.com>
	<200603011624.04553.samjnaa@gmail.com>
	<20060301120249.5e83e84b@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060301120249.5e83e84b@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


wwp wrote:

> > > The statement funckey; 'not wrong'. 
> > > You can compile your program with -Wall option to see a warning message
> > > saying this. 
> > 
> > fk.c:8: warning: statement with no effect
> 
> I'm not sure w/ gcc, but a "statement with no effect" might not mean that the
> statement isn't compiled and generates code.. that will have no effect ;-).

Without optimisation, it might generate some code (e.g. putting the
value funckey into a register). With optimisation, wouldn't expect any
code to be generated.

-- 
Glynn Clements <glynn@gclements.plus.com>
