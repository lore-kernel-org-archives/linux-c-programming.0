From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: problem in open sys call
Date: Tue, 20 Apr 2004 15:22:27 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <33120BB62E0A7643AE75E2B03CA0EDA08E3A18@mail7.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'gracecott@sancharnet.in'" <gracecott@sancharnet.in>, linux-c-programming@vger.kernel.org

Hi,

Try this:

	if((fd=open(opcode, O_RDONLY))==-1)
      {
	  printf("Open failed, error code: %d\n%s\n", errno, strerror(errno)
      }
		
you may need to add errno.h and string.h to the list of includes.  This will
give you the error code and desctiption of why open is failing.

George Huber
SRI, International

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of joy
Sent: Tuesday, April 20, 2004 2:32 PM
To: linux-c-programming@vger.kernel.org
Subject: problem in open sys call


Hi,
I have a small prblem i the open call. it fails every time and I dont 
know why.

thanx in advance,
Joy.M.M
