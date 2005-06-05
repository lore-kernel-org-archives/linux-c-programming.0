From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: library routine wrappers and serious overkill
Date: Sun, 5 Jun 2005 17:34:41 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0506051727540.5731@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  yet another curious feature of this code base that i'm now looking
after.  apparently, the original author was a big believer in
robustness, given that he wrapped numerous simple library routines
with assertions and dbug.h macros, as in:

===========================

void
my_str_copy(char *const dest_p,
		size_t dest_size,
		char const *const source_p,
		size_t const source_size)
{
    DBUG_ENTER(__FUNCTION__);

    my_CONDITION(dest_p || dest_size == 0);
    my_CONDITION(source_p || source_size == 0);

    if (dest_p && 0 < dest_size) {
        if (source_p == 0) {
            dest_size = 1;
        } else if (source_size < dest_size) {
            dest_size = source_size + 1;
        }

        strncpy(dest_p, source_p, --dest_size);
        dest_p[dest_size] = 0;
    }

    DBUG_VOID_RETURN;
}

==============================

  now, i'm as big a fan as the next guy of good debugging (the
my_CONDITION macro is a local implementation of assert() with hooks to
a logging library -- yeesh) but, seriously, there has to be a limit to
just how much debugging you're going to apply to each and every
string-related library routine.  it does get kind of absurd after a
while:

===============================

char
my_str_ch2upper(char const ch)
{
    DBUG_ENTER(__FUNCTION__);

    if (isascii(ch) && islower(ch)) {
        DBUG_RETURN(toupper(ch));
    }
    DBUG_RETURN(ch);
}


===============================

  is this what you'd call best practice?  am i just being too
critical?  is there a more established combination of
debugging/assertions/logging that people use?  based on a previous
posting, i'm looking hard at "log4c" for the logging part.

rday
