From: Sameer Maggon <smaggon@dypatil.edu>
Subject: malloc and free
Date: Mon, 20 May 2002 16:56:30 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200205201126.QAA01696@ns1.dypatil.edu>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,
  In one function i have a definiton like

  char *token;
  token = (char *)malloc(256 * sizeof(char));

  ...
  ...
  token = strtok(...,"\0");
 
  ...
  free(token);


  Now the problem is that sometimes this runs
  fine and sometimes it crashes on free()..
  Why so.
  If I remove the free(..), then the program
  works perfectly fine

  How do i correct the problem.
  
  Regards
  Sameer





--------------
http://www.dypatil.edu For Better tomorrow
