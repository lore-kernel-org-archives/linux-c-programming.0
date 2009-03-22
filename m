From: "Ardhan Madras" <ajhwb@knac.com>
Subject: Re: Socket programming
Date: Sun, 22 Mar 2009 07:08:53 -0700
Message-ID: <20090322070853.1C31EAD6@resin17.mta.everyone.net>
Reply-To: <ajhwb@knac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Volker Kokula <kokula@informatik.uni-wuerzburg.de>
Cc: linux-c-programming@vger.kernel.org

Hi Volker,

Thanks for let me know. actually, there are no security 
concerns in my program. What do you means with 'unportable?' 
do you means CPU bit type? like integer size?, i want to 
learn socket programming, so i must understand it from scratch, 
not simply by using a library wrapper.


--- kokula@informatik.uni-wuerzburg.de wrote:

From: Volker Kokula <kokula@informatik.uni-wuerzburg.de>
To: ajhwb@knac.com
CC: linux-c-programming@vger.kernel.org
Subject: Re: Socket programming
Date: Sun, 22 Mar 2009 14:41:22 +0100

Hi Ardhan,


you're going to write an enterly unportable and insecure program. If you 
want just send a structure from one host to another look for a library 
which does the packing and unpacking over the network for you.

For example json-c [1] or csoap [2]


Volker



[1] http://oss.metaparadigm.com/json-c/
[2] http://sourceforge.net/projects/csoap/




_____________________________________________________________
Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
