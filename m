From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: Re: Returning pointer to array of structures
Date: Wed, 30 Apr 2003 09:24:22 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030430082421.GH22282@gre.ac.uk>
References: <20030429083122.GA22282@gre.ac.uk> <UP74EBBAEBHCKGTNLKMJPL95LFFDV.3ead0903@rafaelnote.ns1.lhost.com.br>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <UP74EBBAEBHCKGTNLKMJPL95LFFDV.3ead0903@rafaelnote.ns1.lhost.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rafael Santos <rafael@thinkfreak.com.br>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi,

On Mon, Apr 28, 2003 at 07:57:07AM -0300, Rafael Santos wrote:
> Try the modifications above.
>
> - menuentry parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)
> + void parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)

Thanks. Ive done as you suggested and it all works. 

As the way i had coded it before where i was returning the structure
each time worked, I am assuming this is a better way to code it (seeing 
as you guys have suggested it and i know diddly squat :-)

Why is this so?
Is it just because i do not have the extra overhead of
passing/returning the structure for each function call or is there
something more fundamental?

Excuse my ignorance but this is my first C program after hello world
:-)

Thanks again.

Martin
