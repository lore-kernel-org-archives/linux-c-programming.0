From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: ODBC Under Linux
Date: Fri, 28 Feb 2003 21:31:07 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15967.54555.639169.148174@cerise.nosuchdomain.co.uk>
References: <20030228032628.GA24856@whatever.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030228032628.GA24856@whatever.local>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: chuckw@ieee.org
Cc: linux-c-programming@vger.kernel.org


chuckw@ieee.org wrote:

> Hello All,
>   I am trying to write an app. which will have to access a database.  I wanted
> to write the app so that the backend database could be changed without changing
> the app.  I know there is ODBC out there, but I was wondering if anyone had
> ideas on the best free ODBC, or maybe some better way of doing this.

I don't know about "best", but the two most popular ODBC managers are
iODBC and unixODBC:

	http://www.iodbc.org/
	http://www.unixodbc.org/

-- 
Glynn Clements <glynn.clements@virgin.net>
