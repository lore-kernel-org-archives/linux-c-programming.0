From: Progga <abulfazl@juniv.edu>
Subject: getline()
Date: Sun, 24 Aug 2003 20:36:53 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030824203653.A574@Imrashi.net.bd>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org


 Is there any 'C' lib which contains the getline() function ? I have found
a code similar to this:

 -------

 char *temp ;
 int n = 0 ;
 FILE *file_handle = NULL ;

 // [snipped]

 getline(&temp, &n, file_handle);                                        


 --------

 But there's no prototype declaration and 'greping' through the '*/includes/'
havn't produced anything relevant either. 



 Khoda Hafez
 Progga

