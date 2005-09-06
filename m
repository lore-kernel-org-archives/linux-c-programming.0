From: Ronaldo.Afonso@cyclades.com
Subject: Re: weird structure definition in header file
Date: Tue, 6 Sep 2005 17:24:06 -0300
Message-ID: <OFBC99D5D5.A42E7C48-ON83257074.006F5B56-83257074.0070120F@Cyclades.com>
References: <Pine.LNX.4.63.0509061510210.24485@vericenter>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0509061510210.24485@vericenter>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>, linux-c-programming-owner@vger.kernel.org





I'm not sure if I understood your doubt but  just think a little bit, you
can put all the variables declaration inside a header file, be those
variables extern or not, and your source.c file (or source.c files) could
just "include" that header file. Beside of this, you could have other
modules where those variables are "really" declared. A extern variable
informs to the compiler that this variable is not is that module, just
that. The link must do the hard work.
I hope this information worths for you.
Good luck.

Ronaldo Z. Afonso
Projetista de Software
Cyclades Brasil
ronaldo.afonso@cyclades.com.br

Phone: 55 11 5033-3361
Fax: 55 11 5033-3388
www.cyclades.com.br


                                                                           
             "Robert P. J.                                                 
             Day"                                                          
             <rpjday@mindsprin                                          To 
             g.com>                    C programming list                  
             Sent by:                  <linux-c-programming@vger.kernel.or 
             linux-c-programmi         g>                                  
             ng-owner@vger.ker                                          cc 
             nel.org                                                       
                                                                   Subject 
                                       weird structure definition in       
             09/06/2005 04:13          header file                         
             PM                                                            
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           





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
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


