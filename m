From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: writing a large array to disk
Date: Thu, 19 Sep 2002 20:45:52 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15754.10608.797384.787489@cerise.nosuchdomain.co.uk>
References: <Pine.SGI.4.05.10209191421390.81557-100000@tesla.dartmouth.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.SGI.4.05.10209191421390.81557-100000@tesla.dartmouth.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Karthik Vishwanath <karthik@northstar.dartmouth.edu>
Cc: C-programming <linux-c-programming@vger.kernel.org>


Karthik Vishwanath wrote:

> I have a (fairly) large 4-d array in my program that I want to dump to
> disk as text data (so that it may be suitably parsed later). I was
> wondering if there was an easy (hopefully, single library call!) that
> would do this?

No.

> If there is none, and I must write the data out "by hand", what would be
> the most optimal way of doing this? 

Nested "for" loops:

	double data[NI][NJ][NK][NL];
	FILE *fp = ...;
	...
	fprintf(fp, "%f %f %f %f\n", NI, NJ, NK, NL);
	for (i = 0; i < NI; i++)
	    for (j = 0; j < NJ; j++)
	        for (k = 0; k < NK; k++)
	            for (l = 0; l < NL; l++)
	                fprintf(fp, "%f\n", data[i][j][k][l]);

-- 
Glynn Clements <glynn.clements@virgin.net>
