From: Nick Jennings <nkj@namodn.com>
Subject: using 'int char' with #define's variables.
Date: Sun, 1 Sep 2002 15:35:29 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020901153529.A16903@namodn.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi All,

  A function that has a prototype of:

char * strrchr( char * str, int ch );

  It takes a character as an int in that second param.
 
  I am having trouble using it with a #define's VAR.

---
#define DIRMARK "/"

...

char * filename = strrchr(path, DIRMARK);
fprintf(stderr, "debug: filename = %s\n", filename);
---

gcc complains:
warning: passing arg 2 of `strrchr' makes integer from pointer without a cast

  It compiles, but doesn't seem to work right:

debug: filename = (null)


Any suggestions?

- Nick

