From: Michael Taylor <michael.taylor@ec.gc.ca>
Subject: Re: about QUERY_STRING parsing
Date: Mon, 29 Mar 2004 10:06:30 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40683B76.5090405@ec.gc.ca>
References: <20040326201748.59da2b24.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040326201748.59da2b24.alphex@crew.org.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alphex K." <alphex@crew.org.ru>
Cc: linux-c-programming@vger.kernel.org

Alphex K. wrote:
> Hi guys,
> I'm write a content management system in C language.
> 
> and I have a question - what the best method to parse QUERY_STRING with decode web charasters?
> I need it to do without tcl.h or any libs.

<http://cvs.apache.org/viewcvs.cgi/*checkout*/apache-1.3/cgi-src/Attic/util.c>
<http://cvs.apache.org/viewcvs.cgi/*checkout*/apache-1.3/cgi-src/Attic/util.h>
You can include this code in your project if you follow the Apache LICENSE
terms: <http://www.apache.org/LICENSE.txt>

Note that this include some security fixes that many older C examples miss. See
<http://www.stanford.edu/group/itss-ccs/security/Advisories/96-125.html> for an
1996 security advisory.

