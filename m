From: Glynn Clements <glynn.clements@virgin.net>
Subject: RE: strange behavious
Date: Wed, 25 Dec 2002 13:44:29 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15881.46653.843341.756128@cerise.nosuchdomain.co.uk>
References: <15881.32906.386882.764352@cerise.nosuchdomain.co.uk>
	<Pine.LNX.4.33.0212251759050.11856-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0212251759050.11856-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: Alvarez Alberto-AALVARB1 <AALVARB1@motorola.com>, linux c programming mailing list <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> > > > 	i'll try to answer your question. This may be not be an accurate answer, but i think it'll do.
> > > > 
> > > > 	The way you've assigned values to 'words' is the reason of the failure. The allocation of memory takes place in program data space (the same place where code is), so you can't modify it.
> > > > 	If you want to modify that array, you should dynamically allocate it. Something like this will work,
> > > 
> > > that means it should not work for the following code as the memory is 
> > > allocated in program data space, but it works...
> > > 
> > > #######
> > > #include <stdio.h>
> > > 
> > > int main()
> > > {
> > > 	char	string[] = "mohammed";
> > > 	
> > > 	strcpy (string, "khalid");
> > > 	printf ("%s\n", string);
> > > 	
> > > 	return 0;
> > > }
> > > #######
> > 
> > Sure; in this case the variable "string" is stored in the data
> > segment, which is mutable.
> 
> The above above answer by Mr Alvarez Alberto-AALVARB1 says that since the 
> array words is stored in program data space which is not modifiable and 
> therefore I get segmentation fault. While here I have given an example of 
> modifiable string and you say that since string is stored in the data 
> segment, it is modifiable. Please clarify.

Alberto's response was incorrect, at least for Linux/ELF.

Program code is stored in the "text" (code) segment, which is
read-only. Constant static data, such as string literals, are stored
in the "rodata" (read-only data) segment, which is also read-only. 

Explicitly-initialised mutable static data are stored in the "data"
segment, which is writable. Implicitly-initialised mutable static data
are stored in the "bss" segment[1], which is also writable[2].

[1] The term arises from an IBM pseudo-op, and stands for "block
started by symbol".

[2] As the BSS segment only contains zeros, its contents don't
actually need to be stored in the executable; however, it does have an
entry in the segment table.

However, most of this information is unnecessary. The main thing to
remember is that a string literal is a pointer to *constant* data
(except when used as an array initialiser, as in the above example).

-- 
Glynn Clements <glynn.clements@virgin.net>
