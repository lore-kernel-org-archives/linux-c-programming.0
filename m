From: "William N. Zanatta" <william@veritel.com.br>
Subject: About getopt()
Date: Thu, 08 Aug 2002 11:48:47 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3D5284CF.8090708@veritel.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hey,

   getopt() does memory allocation for the optarg pointer it sets when a 
value for it is found, right?
   ok, thus if I'm making something like

   char *str;
   ...

   str = optarg;


   I'll have to free() str later.

   Is that right???

   Thanks,

william

-- 
Perl combines all of the worst aspects of BASIC, C and line noise.
                 -- Keith Packard

