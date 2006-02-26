From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: A safe scanf function
Date: Sun, 26 Feb 2006 15:34:28 +0000
Message-ID: <17409.51844.97168.392901@cerise.gclements.plus.com>
References: <200602261347.20494.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602261347.20494.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> If I am not wrong, a safe alternate for scanf could be (relatively) easily 
> written which simply uses getline and sscanf -- thereby replacing the 
> original scanf function.

You can't /replace/ scanf() in the C library. It's a standard ANSI
function, so it needs to be present and it needs to have its specified
behaviour (which can include consuming either more or less than a line
of input, depending on the format string).

> Why has not anyone written such a function and included it into the GNU C 
> library?

Probably because its trivial to write it yourself if that's what you
really want.

-- 
Glynn Clements <glynn@gclements.plus.com>
