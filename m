From: "J." <mailing-lists@xs4all.nl>
Subject: structure containing node pointing to an other type structure
Date: Fri, 21 Jan 2005 05:31:19 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0501210522490.17563-100000@hestia>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Friday, January 21 05:22:49

Hi,

My question, below I have declared a struct which is used in a binary
tree, but I have to keep track of the root node from another node which is
used in an array of ptr's -> structs. Can I do that or is that illegal ?

 the tree node....
struct tnode {
 char *destination;
 float mcount;
 float msize;
 float mav_size;
 time_t utc_time;

 struct tnode *left;
 struct tnode *right;
};

 and the node for the array which should hold the pointer to the 
 binary tree...
struct lognode {
 char *logfile;
 float tot_bytes;
 float tot_messages;
 struct tnode *root;  /* <==== ?? */
};

Thnkx..

J.

