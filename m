From: "Sandro Dangui" <sdangui@nortelnetworks.com>
Subject: RE: constant variable
Date: Thu, 11 Mar 2004 10:28:16 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <31E38B53D182D51195FA00508BE3A334036058A1@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nasir@orbisindonesia.com, linux-c-programming@vger.kernel.org


If you look at the generated assembly you will notice that the compiler uses
(in the call printf("value of i = %d\n",i);) the value 9 instead of the
contents of i. I mean, the assembly pushes directly the value 9 to the
stack... It assumes that if you declared a constant it will not be changed.

[]'s

Sandro.


-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of Nasir
Simbolon
Sent: Thursday, March 11, 2004 8:19 AM
To: linux-c-programming@vger.kernel.org
Subject: constant variable


Hi All, 
I just curious. I have the following codes

main()
{
 	const int i=9;          //declare constant  integer variable and
initialize
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

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
