From: "J." <mailing-lists@xs4all.nl>
Subject: dynamic allocation of array of structures
Date: Sat, 22 Mar 2003 20:47:39 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0303222034440.5699-100000@hestia>
References: <15992.37034.685358.775548@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15992.37034.685358.775548@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello,

struct {
 char *name;
 int telnr;
} people[100];

Instead of statically allocating an array of 100 of these structures like
I have done, I want to dynamically allocate the array at run-time and
resize the number of structures some where at any time in the main
program. 

I know how to resize char arrays and int arrays but I never (re)sized an
array of structres which can be accessed with something as: ``people[4].name''. 
In Google nothing really usefull turns up.

Can this be done without having to resort to other implementations like
linked lists etc.. ? If so how ?

Thank you in advance.

J.

