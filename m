From: "J." <mailing-lists@xs4all.nl>
Subject: binary tree traversal...
Date: Thu, 27 Jan 2005 00:01:39 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0501262350200.30870-100000@hestia>
Reply-To: "J." <mailing-lists@xs4all.nl>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Wednesday, January 26

Hello,

I am trying to traverse a binary tree, returning each node that is
encounterd so that I can preform operations on that node. However it keeps
looping over the same first node, it refuses to travel any further down
the tree ... What did I overlooked ? I know the tree is loaded with data
since a simple recursive preorder treeprint confirms that.

An example: 

 while((root = treerecurse(root)) != NULL)
  printf("%4d %s\n", root->count, root->word);

And the treerecurse function would look something like:

struct tnode *treerecurse(struct tnode *p) {
 if(p != NULL) {
  treerecurse(p->left);
  return p;
  treerecurse(p->right);
 }
}

I guess there is something wrong in my reasoning about this...

Thnkx..

J.

