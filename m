From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: binary tree traversal...
Date: Sun, 30 Jan 2005 11:49:24 +0000
Message-ID: <16892.51652.750327.69188@gargle.gargle.HOWL>
References: <Pine.LNX.4.21.0501262350200.30870-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0501262350200.30870-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org


J. wrote:

> I am trying to traverse a binary tree, returning each node that is
> encounterd so that I can preform operations on that node. However it keeps
> looping over the same first node, it refuses to travel any further down
> the tree ... What did I overlooked ? I know the tree is loaded with data
> since a simple recursive preorder treeprint confirms that.
> 
> An example: 
> 
>  while((root = treerecurse(root)) != NULL)
>   printf("%4d %s\n", root->count, root->word);
> 
> And the treerecurse function would look something like:
> 
> struct tnode *treerecurse(struct tnode *p) {
>  if(p != NULL) {
>   treerecurse(p->left);
>   return p;

This causes the function to return, so ...

>   treerecurse(p->right);

... this will never be executed.

-- 
Glynn Clements <glynn@gclements.plus.com>
