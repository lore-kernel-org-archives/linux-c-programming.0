From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: Re: Returning pointer to array of structures
Date: Tue, 29 Apr 2003 11:28:39 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030429102839.GC22282@gre.ac.uk>
References: <20030429083122.GA22282@gre.ac.uk> <16046.17978.731081.8548@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16046.17978.731081.8548@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Tue, Apr 29, 2003 at 10:30:34AM +0100, Glynn Clements wrote:
> 
> OTOH, this is almost certainly an error:
> 
> 	 uri = xmlGetProp(cur, "name");
> 	 xmlFree(uri);
> 	 mePtr[i].appsubmenu = uri;
> 
> Assuming that xmlFree() is a "destructor", you shouldn't be calling it
> until you have actually finished with "uri". Given that you are
> storing "uri" for later use, you probably either shouldn't be calling
> xmlFree() at all, or you should be copying the string itself (e.g. 
> with strdup()), and not just the pointer.

Thanks! This was the error. I have used strdup() as you sugessted and
now it all seems to be working. My structure is returned to main()
successfully and i can print out each element using a for loop.

Thanks again for your help.

Martin
