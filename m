From: "Daniel" <uval@rz.uni-karlsruhe.de>
Subject: Re: global parameters
Date: Fri, 10 May 2002 11:05:01 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001101c1f801$c662e430$544615ac@stud.unikarlsruhe.de>
References: <463100409.20020419114801@com2com.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


----- Original Message -----
From: "Eugene Vigovskiy" <vigov@com2com.ru>
Newsgroups: ka.lists.linux.c.programming
Sent: Friday, April 19, 2002 9:48 AM
Subject: global parameters


>   Hello All.
>
>   I'd like to ask one question.
>
>   I've got a programm, and i'd like to read configuration from file.
>   I need in some data structure for it.
>
>   What is the best way to do it?
>
>   I see at least two ways.
>
>   The first is allocate a structure like this
>   struct somestruct {
>          param1;
>          param2;
>          .
>          .
>          paramn;
>   }
>   and create func what will fill and return pointer to it,  that I can use
in any place.
>
>   The Second way is to
>
>   allocate some global variables and make them available through
>   "extern" in other modules.
>   Can anybody point me at advantages and disadvantages of this
>   methods.
>
>
> Eugene Vigovskiy
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --------------------------------------------------------------------------
-----
>    Achtung: diese Newsgruppe ist eine unidirektional gegatete
Mailingliste.
>      Antworten nur per Mail an die im Reply-To-Header angegebene Adresse.
>                    Fragen zum Gateway -> newsmaster@inka.de.
> --------------------------------------------------------------------------
-----

I think the first one is better.
 (If you want to develope this program, you only let these modules see
the declarations that realy need them)
If it going to be small (~200 Lines) then it doesn't matter which one you
use.

