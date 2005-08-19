From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: any compelling reasons to use "offsetof"?
Date: Fri, 19 Aug 2005 10:36:41 +0100
Message-ID: <17157.43049.216069.34520@cerise.gclements.plus.com>
References: <Pine.LNX.4.63.0508181019570.10814@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0508181019570.10814@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   in a legacy project i just inherited, i did a quick recursive grep
> and noticed a number of invocations of "offsetof".  from experience,
> i've concluded that the majority of these calls are because of sloppy
> programming or laziness or just plain doing something incredibly hacky
> that could be done in a more straightforward way.
> 
>   are there any really compelling reasons to need to know the offset
> of a structure field?  just curious.

It's most commonly used in conjunction with an application-specific
object system or generics mechanism.

Probably the best-known example is Xt widget definitions. Each widget
class definition has an array of XtResource structures identifying the
resources which the widget understands:

typedef struct _XtResource {
    String	resource_name;	/* Resource name			    */
    String	resource_class;	/* Resource class			    */
    String	resource_type;	/* Representation type desired		    */
    Cardinal	resource_size;	/* Size in bytes of representation	    */
    Cardinal	resource_offset;/* Offset from base to put resource value   */
    String	default_type;	/* representation type of specified default */
    XtPointer	default_addr;	/* Address of default resource		    */
} XtResource, *XtResourceList;

The resource_size and resource_offset fields would be initialised by
applying sizeof() and offsetof() [1] to the field within the widget
instance structure which corresponds to the resource.

[1] Usually XtOffsetOf(); Xt predates C99 or the widespread
availablility of offsetof().

This allows the creation of generic functions (not tied to a specific
widget class) to set/get resource values for a particular widget
instance by name. IOW, roll-your-own OO with reflection.

-- 
Glynn Clements <glynn@gclements.plus.com>
