From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: invalid lvalue
Date: Sat, 15 Feb 2003 20:57:35 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0302152054580.24802-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux c programming mailing list <linux-c-programming@vger.kernel.org>


I tried to compile the following program...

int main()
{
	int a;
	
	a = 2;
#	printf ("%d\n", a++++);
	
	return 0;
}

but it gave the following error.

"invalid lvalue in increment" for the line indicated by #. Why it so, a 
has been defined as an int variable!

-- 

**************************************************************************

Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
Assistant Manager II                          (off) : 0091-022-2024641
National Centre for Software Technology   Fax       : 0091-022-2049573 
8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
Mumbai 400021.

Homepage : http://soochak.ncst.ernet.in/~khalid			  	  

**************************************************************************

