From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: 'C' source analyzer.
Date: Thu, 26 Aug 2004 15:59:06 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138522@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>


>Hi,

>I was wondering if anyone can recommend a 'C' source analyzer.
>Cross references of functions, and call linkages would be nice. dependances
>, h files, and output to a sql db and or graphical connected node diagram.
with
>direction.

There are several tools that do some of this:

cflow - generats a call graph listing where functions are first defined and
which 
        functions call others.  The last time that I used this the output
was 
        to stdout, although there maybe a GUI avaliable by now.

ctags - generates a cross-reference for C and Fortran programs.  Generates a
`tag-
        file' that is digestable by emacs of vi so that you can jump to the 
        defination of an entity.  I have never used this tool however, the
above
        description is based on the man page.  

kcachegrind - a graphical front-end to valgrind, it produces nice graphical
call trees,
        even allow browsing of the source code of each function from it's
interface.
        I have played around with this a bit, however on large programs it
is slow, and
        it crashed (actually hung my X-server) when I tried to run the
source code 
        for emacs (I wanted to stress test the app) through it.

cbrowser - from the README "Cbrowser is a C/C++ source code indexing,
querying and
        browsing tool".  This tool is written in tcl/tk and requires
`cscope'.

cscope - from the web-site "Cscope is a developer's tool for browsing source
code. 
         It has an impeccable Unix pedigree, having been originally
developed at 
         Bell Labs back in the days of the PDP-11."  The interface is only
console 
         based.

There are probably others, but these are the ones that I have heard of.  I
personally 
would like a tool that combined all of these features.  Might have to write
one, one 
of these days.

George Huber
SRI, International

