From: Glynn Clements <glynn.clements@virgin.net>
Subject: RE: strange behavious
Date: Wed, 25 Dec 2002 09:55:22 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15881.32906.386882.764352@cerise.nosuchdomain.co.uk>
References: <75B979779CA1D311808400508B6F40FF06B4354E@zes06exm01.madrid.ecid.cig.mot.com>
	<Pine.LNX.4.33.0212241011001.31854-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0212241011001.31854-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: Alvarez Alberto-AALVARB1 <AALVARB1@motorola.com>, linux c programming mailing list <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> > 	i'll try to answer your question. This may be not be an accurate answer, but i think it'll do.
> > 
> > 	The way you've assigned values to 'words' is the reason of the failure. The allocation of memory takes place in program data space (the same place where code is), so you can't modify it.
> > 	If you want to modify that array, you should dynamically allocate it. Something like this will work,
> 
> that means it should not work for the following code as the memory is 
> allocated in program data space, but it works...
> 
> #######
> #include <stdio.h>
> 
> int main()
> {
> 	char	string[] = "mohammed";
> 	
> 	strcpy (string, "khalid");
> 	printf ("%s\n", string);
> 	
> 	return 0;
> }
> #######

Sure; in this case the variable "string" is stored in the data
segment, which is mutable.

-- 
Glynn Clements <glynn.clements@virgin.net>
