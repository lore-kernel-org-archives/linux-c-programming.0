From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Control key with Ncurses
Date: Thu, 3 Jul 2003 08:18:56 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16131.55520.62578.551805@cerise.nosuchdomain.co.uk>
References: <3F03D481.1080008@darya.nio.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F03D481.1080008@darya.nio.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vidya Kotamraju <vidyakr@darya.nio.org>
Cc: linux-c-programming@vger.kernel.org


Vidya Kotamraju wrote:

> I am writing a graphics-based application in Linux by making use of C 
> and ncurses library.
> The application needs that i take two numbers as input ( i make use of 
> scanw for the same).
> However at this point in the program i want the user to obtain the 
> flexibility of exiting gracefully from the program(by pressing a cntrl 
> key,like say F5).

You need to call keypad() to enable the use of "extended" keys
(funcion keys, arrow keys etc). The various KEY_* macros define the
codes for the extended keys; for function keys, use KEY_F(), e.g. 
KEY_F(5) for F5.

> Cntrl-D doesnt seem to work with ncurses..

Control codes should be reported by getch() etc as a code in the range
0 to 31 (e.g. Ctrl-D should be code 4).

-- 
Glynn Clements <glynn.clements@virgin.net>
