From: Eugene Vigovskiy <vigov@com2com.ru>
Subject: global parameters
Date: Fri, 19 Apr 2002 11:48:01 +0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <463100409.20020419114801@com2com.ru>
Reply-To: Eugene Vigovskiy <vigov@com2com.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

  Hello All.

  I'd like to ask one question.

  I've got a programm, and i'd like to read configuration from file.
  I need in some data structure for it.

  What is the best way to do it?
  
  I see at least two ways.
  
  The first is allocate a structure like this
  struct somestruct {
         param1;
         param2;
         .
         .
         paramn;
  }
  and create func what will fill and return pointer to it,  that I can use in any place.

  The Second way is to

  allocate some global variables and make them available through
  "extern" in other modules.
  Can anybody point me at advantages and disadvantages of this
  methods.
  



Eugene Vigovskiy

