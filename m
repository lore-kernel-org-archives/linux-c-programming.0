From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: problem with const in structure
Date: Mon, 6 Jan 2003 18:53:15 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0301061759250.14169-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Hi,

consider the following code.

####
#include <stdio.h>

struct node {
	const int x;
	char name[20];
	struct node *next;
};

int main()
{
	struct node newnode;
		
	newnode.x = 10;
	newnode.x = 12;
	printf ("x = %d\n", newnode.x);
	return 0;
}
####

Now, you can see that even though I have defined x to be const int, I can 
assign it values. When I compiled the program, it gives the warning that 
assignment of read-only member x but when I ran the program, it worked 
fine. Where is the catch. How do I define a structure variable to be 
const?

with regards...

-- 

**************************************************************************

Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
Assistant Manager II                          (off) : 0091-022-2024641
National Centre for Software Technology   Fax       : 0091-022-2049573 
8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
Mumbai 400021.

Homepage : http://soochak.ncst.ernet.in/~khalid			  	  

**************************************************************************


