From: Marius Nita <marius@cs.pdx.edu>
Subject: File handling
Date: Mon, 29 Apr 2002 15:46:10 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020429154610.B24899@cs.pdx.edu>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

I have a large text file (45Mb) which needs to be searched through in a decent
amount of time (4-5 seconds.) So far I have some Perl and shell scripts that
search it, but either they are way too slow, or if I try to tweak them to make
them faster, I usually run into low memory problems.

So I was thinking that if I write the program in C I would get better results.
Do you have any suggestions about a way to approach this, pointers about
libraries, etc?

Thanks.
marius

PS: The search is very simple. It just tries to match the exact keywords, case
insensitive, so that's not an issue. It's file reading performance that I'm
worried about.

