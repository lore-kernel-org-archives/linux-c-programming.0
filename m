From: Nasir Simbolon <nasir@orbisindonesia.com>
Subject: constant variable
Date: Thu, 11 Mar 2004 18:19:00 +0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200403111819.00752.nasir@orbisindonesia.com>
Reply-To: nasir@orbisindonesia.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi All, 
I just curious. I have the following codes

main()
{
 	const int i=9;          //declare constant  integer variable and initialize
       	int* j=NULL;   		     //declare a pointer to integer
	 j = (int*) &i;         //j point to address of memory i 
 	*j = 3;		     //modify value  of  j point to 

	//Now print the result
	 printf("value of i = %d\n",i);
  	 printf("value of j = %d\n",*j);
	 printf("Address of i = %x\n",&i);
 	 printf("Address of j = %x\n",j);
}
when I compile using gcc version 3.3.2 (Debian) and run, I have the result :

value of i = 9
value of *j = 3
Address of i = bffff8a4
Address of j = bffff8a4

Now, I notice  that j point to address of i BUT they do not  have the same 
value.

Anybody have an explanation?


Regards,

Nasir 


-- 
"timor Domini principium scientia (Prov 1:7)"

