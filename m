From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: RE: strange behavious
Date: Wed, 25 Dec 2002 18:01:52 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0212251759050.11856-100000@soochak.ncst.ernet.in>
References: <15881.32906.386882.764352@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15881.32906.386882.764352@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Alvarez Alberto-AALVARB1 <AALVARB1@motorola.com>, linux c programming mailing list <linux-c-programming@vger.kernel.org>


On Wed, 25 Dec 2002, Glynn Clements wrote:

> 
> Mohammed Khalid Ansari wrote:
> 
> > > 	i'll try to answer your question. This may be not be an accurate answer, but i think it'll do.
> > > 
> > > 	The way you've assigned values to 'words' is the reason of the failure. The allocation of memory takes place in program data space (the same place where code is), so you can't modify it.
> > > 	If you want to modify that array, you should dynamically allocate it. Something like this will work,
> > 
> > that means it should not work for the following code as the memory is 
> > allocated in program data space, but it works...
> > 
> > #######
> > #include <stdio.h>
> > 
> > int main()
> > {
> > 	char	string[] = "mohammed";
> > 	
> > 	strcpy (string, "khalid");
> > 	printf ("%s\n", string);
> > 	
> > 	return 0;
> > }
> > #######
> 
> Sure; in this case the variable "string" is stored in the data
> segment, which is mutable.
> 
> 
The above above answer by Mr Alvarez Alberto-AALVARB1 says that since the 
array words is stored in program data space which is not modifiable and 
therefore I get segmentation fault. While here I have given an example of 
modifiable string and you say that since string is stored in the data 
segment, it is modifiable. Please clarify.

with regards...


