From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: is it a buf or what?
Date: Sat, 8 Jun 2002 16:03:35 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0206081601090.19134-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Hi,

I had written a small program as follows...

#include <stdio.h>

int main()
{
	char	*ptr;
	
	strcpy (ptr, "khalid");
	printf ("%s\n", ptr);
	return 0;
}

As you can see, I haven't allocated the space for the pointer ptr. When I 
ran the program, instead of giving me the segmentation fault, it just ran 
printing "khalid". Is it a bug of gcc or the kernel.

-- 

**************************************************************************

Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
Assistant Manager II                          (off) : 0091-022-2024641
National Centre for Software Technology   Fax       : 0091-022-2049573 
8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
Mumbai 400021.

Homepage : http://soochak.ncst.ernet.in/~khalid			  	  

**************************************************************************

