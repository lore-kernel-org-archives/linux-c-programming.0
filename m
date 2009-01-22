From: Jai Sharma <jai.unix@gmail.com>
Subject: Re: Plot graph using C
Date: Thu, 22 Jan 2009 22:50:29 +0530
Message-ID: <1f714d50901220920n15dcf308yec582e91488f0a7f@mail.gmail.com>
References: <1f714d50901220739t1dabc3ado89ed0f3c9de5ce86@mail.gmail.com>
	 <1C57F306-C631-41F5-885C-2A2AE3370621@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=tyhTd4NmI2/XlVvv200CX/Z5NHdtuq9M7TOP1hw/tz8=;
        b=CdLscmxpEUK2TesuMflXWIprC0gOW8URkq6duG2aMtlXiXVRz+S/miLVh8EW7XH3wE
         fShKDGLaCjEiAmuad7ag+QNpyi3X7PLZx/w7b87d7sreZF40kxNdm8EyI0rIsYTXXtQo
         GFvaPd0Ewo2s18xcyBffnKJdsvboCEzr62b8Y=
In-Reply-To: <1C57F306-C631-41F5-885C-2A2AE3370621@arcor.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: XComp <xcomp@arcor.de>
Cc: linux-c-programming@vger.kernel.org

Dear Friends

After a one day search I found libploticus.

but when i compile this program. I got errors:

root@linux:/data/programming/c/chart# cc main.c -lploticus -lpng -lz
-lm -o api_exampmain.c: In function 'main':
main.c:16: warning: incompatible implicit declaration of built-in
function 'exit'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XDrawString'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XLoadFont'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdFontTiny'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageDestroy'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XStoreName'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageCreateFromJpeg'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XRefreshKeyboardMapping'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdFontGiant'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XLookupString'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageColorExact'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageCreateFromWBMP'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XSetTile'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XSetFont'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageCreateFromPng'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XSetFillStyle'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XSetWMNormalHints'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageStringUp'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdFontLarge'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XCreateSimpleWindow'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageCopy'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XOpenDisplay'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageLine'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageWBMP'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XDrawPoint'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XCopyArea'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XDrawLine'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XSetForeground'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XUnmapWindow'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XCreatePixmapFromBitmapData'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XDrawLines'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XSetBackground'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XNextEvent'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageColorTransparent'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XSetLineAttributes'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XCheckMaskEvent'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageSetStyle'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XMapWindow'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XCreateGC'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XSelectInput'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XFlush'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XTextWidth'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XFillPolygon'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XLoadQueryFont'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageFilledPolygon'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdFontMediumBold'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageJpeg'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XDisplayPlanes'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XAllocColor'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdFontSmall'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageSetPixel'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageString'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageColorClosest'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImagePng'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageCreate'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XCreatePixmap'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageCopyResized'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageFilledRectangle'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `XSetDashes'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageColorAllocate'
/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../lib/libploticus.so:
undefined reference to `gdImageSetBrush'
collect2: ld returned 1 exit status


====================== main.c ==============================
#include <stdio.h>

main()
{
int stat;

stat = ploticus_init( "png", "test1.png" );
if( stat != 0 ) { fprintf( stderr, "error on init\n" ); exit( 1 ); }

stat = ploticus_arg( "-debug", "" );

stat = ploticus_begin();

ploticus_execline( "#proc getdata" );
ploticus_execline( "showresults: yes" );
ploticus_execline( "data:" );
ploticus_execline( "A 1 2" );
ploticus_execline( "B 3 4" );
ploticus_execline( "#endproc" );

ploticus_execline( "#proc areadef" );
ploticus_execline( "rectangle: 1 1 3 4" );
ploticus_execline( "xrange: 0 10" );
ploticus_execline( "yrange: 0 10" );
ploticus_execline( "xaxis.stubs inc" );
ploticus_execline( "yaxis.stubs inc" );

ploticus_end();

PL_do_x_button( "Quit" );

}
========================================================

Plz help to solve this problem.



Thanks and Regards
Jai

On Thu, Jan 22, 2009 at 9:29 PM, XComp <xcomp@arcor.de> wrote:
> Hi Jai,
> have you also thought about using gnuplot? It's a powerful command line tool
> for creating graphs of any kind. Maybe you can integrate it into your
> program. Unfortunately I have no experience in any graph library.
>
> Regards,
> Matthias
>
>
> On 22.01.2009, at 07:39, Jai Sharma wrote:
>
>> Dear Friends,
>>
>> I want to plot graph trough my C program, like MRTG.
>> I found two libraries:
>>
>> 1. librrd  - good but, no CAPI documentation
>> 2  libgdchart - less functionality
>>
>> Can anyone told me about more, what library i will use to plot a graph.
>>
>> ================================================
>>
>> Thanks and Regards
>> Jai
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
