From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: usage of WIN_SMART
Date: Thu, 25 Nov 2004 07:08:32 +0000
Message-ID: <16805.34033.574.53616@cerise.gclements.plus.com>
References: <1101293397.3787.34.camel@myLinux>
	<20041124121036.GQ2067@lug-owl.de>
	<1101356823.3795.9.camel@myLinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1101356823.3795.9.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>, Linux C Programming <linux-c-programming@vger.kernel.org>


Jagadeesh Bhaskar P wrote:

> I meant how to use WIN_SMART in the code? Not its uses or advantages!!
> 
> Can someone help me with that??

Look at the source code of an existing program which uses it, such as
those to which Jan-Benedict referred.

Also, within a few clicks of the linux-ide.org URL, I found:

	http://www.linux-ide.org/smart/smartmontools-5.0/

which says:

  == REFERENCES ==
  If you need help in understanding the output of smartctl, a good place
  to start is to read Section 8.41 of the AT Attachment with Packet
  Interface-5 (ATA/ATAPI-5) specification.  This documents the
  S.M.A.R.T. functionality which the smartmontools utilities provide
  access to.  You can find Revision 1 of this document at:
  http://www.t13.org/project/d1321r1c.pdf
  
  Future versions of the specifications (ATA/ATAPI-6 and ATA/ATAPI-7)
  can be obtained from:
  http://www.t13.org/#FTP_site
  Later revisions (2, 3) of the ATA/ATAPI-5 specification are also
  available there.
  
  The functioning of S.M.A.R.T. is also described by the SFF-8035i
  revision 2 specification.  This is a publication of the Small Form
  Factors Committee, and can be obtained from SFF Committee, 14426 Black
  Walnut Ct., Saratoga, CA 95070, USA.  
  SFF FaxAccess: (408) 741-1600
  Ph: (408) 867-6630
  Fax: (408) 867-2115
  E-Mail: 250-1752@mcimail.com.

-- 
Glynn Clements <glynn@gclements.plus.com>
