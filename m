From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: weird structure definition in header file
Date: Tue, 6 Sep 2005 15:13:48 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0509061510210.24485@vericenter>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  i'm looking at some legacy code and, in a header file, i find the
following (paraphrased for brevity):

typedef struct {
	... stuff ...
} Widgets ;

extern Widgets Widget ;


  huh?  i can see why a header file would want to define a structure
but i'm confused why the *header* file would then refer to an external
object of that type.  that's a new one on me -- typically, i'd expect
a *source* file to define such a thing and other *source* files to
contain the "extern" declaration.

  is this some subtle programming cleverness of which i am unaware?
thanks.

rday
