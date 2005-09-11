From: "James Colannino" <james@colannino.org>
Subject: Confusing Prototype
Date: Sun, 11 Sep 2005 11:00:23 -0700
Message-ID: <432470B7.7050609@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hey everyone.  I was looking at the prototype for fgets and noticed the 
following:

char *fgets(char *s, int size, FILE *stream);

I'm confused because it says that it returns a pointer to a character, 
but at the same time it stores a string at the address pointed to by 
char *s, so why does it also need to return a pointer?  I'm confused.  
Thanks in advance.

James
