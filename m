From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Control key with Ncurses
Date: Fri, 4 Jul 2003 15:47:56 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16133.37788.429091.741158@cerise.nosuchdomain.co.uk>
References: <3F03D481.1080008@darya.nio.org>
	<16131.55520.62578.551805@cerise.nosuchdomain.co.uk>
	<3F055A89.4000401@darya.nio.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F055A89.4000401@darya.nio.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vidya Kotamraju <vidyakr@darya.nio.org>
Cc: linux-c-programming@vger.kernel.org


Vidya Kotamraju wrote:

> I had enabled the keypad() along with the other graphics initializations.
> Also, Control codes do work with getch().
> But what i need to know is how to make use of a control key to exit out 
> of a scanw input. (As control-D would work with scanf without needing to 
> make use of getchar)

You can't; getstr() (which scanw() uses) won't return until you press
Return/Enter. If you want to be able to interrupt it, you would have
to read the string manually using repeated calls to getch(), then use
sscanf() to parse it.

-- 
Glynn Clements <glynn.clements@virgin.net>
