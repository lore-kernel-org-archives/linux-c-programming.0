From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: the pros and cons of "catch-all" header files
Date: Thu, 10 Aug 2006 10:01:00 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0608100956590.13049@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  over the next few days, i'm going to have some general design-type
questions as i try to restructure a project i'm working on, so i'm
hoping i don't wander too far from the mandate of the list.

  on this current project, there is frequent use of what i call
"catchall" header files.  rather than have individual source files
pull in just those header files they need, a monster "catchall.h" file
is created that contains almost all project-related inclusions, so
that source files need only:

  #include "catchall.h"

  sure, it's convenient, but there are also some obvious downsides.
the simple question -- is there a defensible rationale for this
approach?  i personally don't like it and would prefer source files to
be more selective, but the argument i keep hearing is, "it's more
convenient."

  thoughts?

rday
