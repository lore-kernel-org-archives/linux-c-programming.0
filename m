From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: structure size
Date: Wed, 5 Mar 2003 12:32:01 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0303051227480.30291-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Hi,

why the sizeof sturcture is alway greater than the collective sizes of all 
the elements in it.

eg
struct node {
	int	a;
	char	c;
	int	b;
};

int main()
{
	printf ("%d\n", sizeof (struct node));
	return 0;
}


it prints 12 in my case.

where is the catch.

-- 

**************************************************************************

Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
Assistant Manager II                          (off) : 0091-022-2024641
National Centre for Software Technology   Fax       : 0091-022-2049573 
8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
Mumbai 400021.

Homepage : http://soochak.ncst.ernet.in/~khalid			  	  

**************************************************************************

