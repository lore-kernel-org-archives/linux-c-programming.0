From: joy <gracecott@sancharnet.in>
Subject: Re: problem in open sys call
Date: Wed, 21 Apr 2004 14:40:01 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40863A69.9090409@sancharnet.in>
References: <33120BB62E0A7643AE75E2B03CA0EDA08E3A18@mail7.monmouth.army.mil>
Reply-To: gracecott@sancharnet.in, gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Cc: linux-c-programming@vger.kernel.org

Huber, George K RDECOM CERDEC STCD SRI wrote:

 >Hi,
 >
 >Try this:
 >
 >	if((fd=open(opcode, O_RDONLY))==-1)
 >      {
 >	  printf("Open failed, error code: %d\n%s\n", errno, strerror(errno)
 >      }
 >		
 >you may need to add errno.h and string.h to the list of includes. 
This will
 >give you the error code and desctiption of why open is failing.
 >
 >
thanks a lot, george but I think Glynn hit the nail on the head. the
code was working fine before I added the opcode variable in main
and totlly neglected to see it while gdb'ing.

 >George Huber
 >SRI, International
 >
 >-----Original Message-----
 >From: linux-c-programming-owner@vger.kernel.org
 >[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of joy
 >Sent: Tuesday, April 20, 2004 2:32 PM
 >To: linux-c-programming@vger.kernel.org
 >Subject: problem in open sys call
 >
 >
 >Hi,
 >I have a small prblem i the open call. it fails every time and I dont
 >know why.
 >
 >thanx in advance,
 >Joy.M.M
 >-
 >To unsubscribe from this list: send the line "unsubscribe 
linux-c-programming" in
 >the body of a message to majordomo@vger.kernel.org
 >More majordomo info at  http://vger.kernel.org/majordomo-info.html
 >
 >
 >




