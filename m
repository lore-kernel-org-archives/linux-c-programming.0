From: Progga <abulfazl@juniv.edu>
Subject: Re: mktemp()
Date: Sat, 5 Jun 2004 18:40:01 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040605184000.A300@Imrashi.net.bd>
References: <20040605093054.A613@Imrashi.net.bd> <16577.21054.198004.325948@cerise.nosuchdomain.co.uk> <20040605141705.A681@Imrashi.net.bd> <20040605111647.GW20632@lug-owl.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040605111647.GW20632@lug-owl.de>; from jbglaw@lug-owl.de on Sat, Jun 05, 2004 at 01:16:48PM +0200
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sat, Jun 05, 2004 at 01:16:48PM +0200, Jan-Benedict Glaw wrote:
> 
> This one will work:
> ---------------------------------
> char my_temp_template[] = "abcXXXXXX";
> char *my_temp_file;
> 
> my_temp_file = mktemp (my_temp_template);
> if (!my_temp_file)
> 	errex ("Couldn't create temp file\n");

 mktemp() does not create the tmp file; it just returns the name string pointer.
mkstemp() creates file though.



 Khoda Hafez
 Progga

