From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: parsing with fscanf().
Date: Wed, 11 Sep 2002 21:24:28 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020911212428.A1167@neutrino.particles.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

A really newbie question, but I have no time for research (my deadline
is counted in hours).

I have to parse a text file, which has been exported from MS Excel (I
have no access to this thingie) using TABs as delimeters. The text
is like:

4	3	2.0
5		1.2
4	3	2.4

I use fscanf() to insert the data to my structures, but the "gap" (between
5 and 1.2) breaks the sequence. fscanf() places the 3rd column to the 2nd
field in my structure.

Is there a trivial way to bypass the problem using fscanf() or I have to do 
the parsing using read()?

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
