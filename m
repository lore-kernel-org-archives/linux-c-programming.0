From: David Eduardo Gomez Noguera <davidgn@servidor.unam.mx>
Subject: Memory bug somewhere
Date: 24 May 2003 12:48:58 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1053798538.1248.24.camel@localhost.localdomain>
Reply-To: davidgn@servidor.unam.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello.

I have been having a program crash in this function.
It basically recives a pointer to a structure 

typedef struct hufftree {
  HuffCode code;
  struct hufftree *l;
  struct hufftree *r;
}hufftree;

a code, a size (of the code) and a data asigned to that huffman code.

This function inserts the data at the end of the path marked by the code
and the size of the code.

It segfaults after some asignments (some calls to ins_code), always at
the same point.

Can anybody here see what is wrong with this?

compilation like is just 

gcc -g -lm file.c -o file

and its glibc-2.3.2-4.80 (know if there is any issue with malloc there?)

-------------------------CUT HERE-----------------------------

int
ins_code (hufftree * tree, unsigned short code, unsigned char size,
	  unsigned char dato)
{
	hufftree *tree2;
	unsigned short i, k;

	tree2 = tree;

	for (i = size; i > 0; i--)
	{

		if (code & ((unsigned short) 1 << (i - 1)))
		{
			if (tree2->l == NULL)
			{
				printf ("before\n");
				tree2->l = malloc (sizeof (hufftree));
				printf ("after\n");
				tree2->l->l = NULL;
				tree2->l->r = NULL;
			}
			tree2 = tree2->l;
		}
		else
		{
			if (tree2->r == NULL)
			{
				printf ("before\n");
				tree2->r = malloc (sizeof (hufftree));
				printf ("after\n");
				tree2->r->l = NULL;
				tree2->r->r = NULL;
			}
			tree2 = tree2->r;
		}
	}
	tree2->code.used = dato;
	tree2->code.code = code;
	return 0;
}
----------------------CUT HERE------------------------------

