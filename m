From: Jesse Ruffin <jesse@eloquentpeasant.net>
Subject: Re: extract the data from buffer
Date: Fri, 16 Jan 2009 11:55:03 -0500
Message-ID: <200901161155.08177.jesse@eloquentpeasant.net>
References: <1f714d50901160754m4568738ev27879b0e9ba72fab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1f714d50901160754m4568738ev27879b0e9ba72fab@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

If you really want to use Perl style regular expressions, use libpcre (www.pcre.org). It will be available in your package manager, and probably already installed. If you don't need the full functionality of a regex, look into the scanf family of functions.

Jesse Ruffin

On Friday 16 January 2009 10:54:11 Jai Sharma wrote:
> Hi
> 
> I want to extract variables values from a string buffer. Can anyone
> pleease tell me how can i do that.
> In C how to use perl like regular expressions.
> 
> 
> Channel              Location             State   Application(Data)
> SIP/5078-099b4b48    s@newvcci:1          Ringing AppQueue((Outgoing Line))
> SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone||||3600)
> SIP/5080-09964168    s@newvcci:1          Up      Bridged Call(SIP/66.119.60.21-
> SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone||||3600)
> SIP/5079-09924998    s@newvcci:1          Up      Bridged Call(SIP/66.119.60.21-
> SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone||||3600)
> SIP/5041-0993ee38    s@newvcci:1          Up      Bridged Call(SIP/66.119.60.21-
> SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone||||3600)
> SIP/5010-098e7760    tsihomephoneservice@ Up      Bridged Call(SIP/63.111.11.135
> SIP/63.111.11.135-09 tsihomephoneservice@ Up      Queue(tsihomephoneservice||||9
> 10 active channels
> 5 of 200 max active calls ( 2.50% of capacity)
> 
> 
> I want to extract three numeric data fields from last line:
> as
> 
> %d of %d max active calls ( %l% of capacity)
> result : 5,200,2.50
> 
> means 2.5
> 
> 
> Thanks and Regards
> 
> Jai
