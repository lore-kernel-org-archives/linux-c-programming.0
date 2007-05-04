From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: C or C++
Date: Fri, 4 May 2007 14:46:18 +0100
Message-ID: <17979.14634.85216.727844@cerise.gclements.plus.com>
References: <463B1244.6080802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <463B1244.6080802@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> I am writing a library and wondering whether to write it in C or C++.
> Previously I knew only C but now I got introduced to the many
> conveniences of C++ I am loth to give them up. I also feel C++ is a
> cleaner language than C (for whatever reason).
> 
> OTOH I am thinking maybe if I write in C many more programmers will be
> able to use it - C programmers as well as C++ programmers, whereas if I
> write in C++ only C++ programmers can use it (i.e. if the API contains
> any C++-specific items [or even if otherwise?]).
> 
> I would like the list's opinion on whether it is worth sacrificing the
> advantages of C++ to capture more "clients".
> 
> A voice inside tells me -- Qt and KDE are pure C++, yet they are among
> the hugest-used (if there is such a word) libraries... But another voice
> tells me -- there is GTK, GNOME and so many other libraries which I do
> not know which may be having many users precisely because they are in
> pure C...
> 
> So I don't want to be like the frog in the well (who did not know there
> was such a thing as an ocean) and so I am asking you.

It depends upon what you want to do with the library.

If it's likely to be useful to other libraries, there's a strong
incentive to use C, or at least to provide a C API (the standard
implementation of GLU is written in C++, although the public API only
uses C).

-- 
Glynn Clements <glynn@gclements.plus.com>
