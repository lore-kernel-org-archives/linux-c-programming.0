From: K Anandan <anandan@comodo.com>
Subject: Re: Error in Makefile for multiple files
Date: Tue, 30 Aug 2005 14:15:21 -0400
Message-ID: <1125425721.2549.15.camel@ttddtanandan.comodo.com>
References: <EGEELICONHJFEACGEOAICEPCCJAA.sagar.shinde@patni.com>
	 <6a00c8d505083001018d3d42d@mail.gmail.com>
Reply-To: anandan@comodo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505083001018d3d42d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Sagar Shinde

On Tue, 2005-08-30 at 04:01, Steve Graegert wrote:
> On 8/29/05, Sagar Shinde <sagar.shinde@patni.com> wrote:
> > 
> > Hi all,
> > 
> > I have a module with 3 C files: smarthook.c restore.c backup.c
> > 
> > My Makefile code is:
> > -----------------------------------------------------
> > INCLUDEDIR = /usr/src/kernels/linux-2.6.12.1/include
> > 
> > CFLAGS = -D__KERNEL__ -DMODULE
> > CFLAGS += -I$(INCLUDEDIR)
> > 
> > TARGET = smarthook
> > OBJS = $(TARGET).o
> > SRC = smarthook.c backup.c restore.c
> > 
> > all: .depend $(TARGET).o
Here you change 
all: .depend $(TARGET)

> > 
> > $(TARGET).o: $(SRC:.c=.o)
Here you change 
$(TARGET) : $(SRC:.c=.o)

> >        $(LD) -r $^ -o $@
> > 
> > depend .depend dep:
> >        $(CC) $(CFLAGS) -M *.c > $@
> > -----------------------------------------------------
> > 
> > now though I am giving proper dependencies
> >  why am I not able to access global variables defined in one file
> > (smarthook.c)
> >  from other files, inspite of these variables being declared extern in other
> > files.
> 
> Although I am not a make guru I can't see something unusual in this
> fairly simple makefile.  Does the module compile and link properly
> without using a makefile, i.e. compiling and linking manually?  Is the
> contents of .depend exactly what you expected after calling make?
> 
> Please, let us know if you have results you want to share.
>  
> Regards
> 
> 	\Steve
> 
> --
> 
> Steve Graegert <graegerts@gmail.com>
> Software Consultancy {C/C++ && Java && .NET}
> Mobile: +49 (176)  21248869
> Office: +49 (9131) 7126409
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 

Your program will work fine

Ananth

