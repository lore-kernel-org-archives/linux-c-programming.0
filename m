From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: using 'int char' with #define's variables.
Date: Sun, 01 Sep 2002 18:16:14 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.1.0.14.0.20020901181431.00aa0b80@fluent2.pyramid.net>
References: <20020901153529.A16903@namodn.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020901153529.A16903@namodn.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Nick Jennings <nkj@namodn.com>, linux-c-programming@vger.kernel.org

At 03:35 PM 9/1/02 -0700, Nick Jennings wrote:
>char * strrchr( char * str, int ch );
>
>   It takes a character as an int in that second param.
>
>   I am having trouble using it with a #define's VAR.
>
>---
>#define DIRMARK "/"
>
>...
>
>char * filename = strrchr(path, DIRMARK);

Your #define is of type array of char, not a plain chiar. If you were to 
define it as

#define DIRMARK '/'

it would work better.

(note single-quote instead of double-quote)

