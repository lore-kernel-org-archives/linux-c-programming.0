From: "John T. Williams" <jtwilliams@vt.edu>
Subject: mid file deletion
Date: Wed, 2 Jul 2003 16:45:42 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000701c340f4$225660f0$ed64a8c0@descartes>
References: <Pine.LNX.4.44.0307021454080.20193-100000@gpu.utcc>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org





What is the best way to remove data from the middle of a file. Here is =
the
Scenario: I have a file that is 20MB in size, about =BC th way through =
it is a
1 line I want to remove. I can use lseek to bring me to the beginning o=
f the
section I want to remove, and then lseek again to bring me to the end o=
f
that section. The only thing I can think to do is load everything from =
the
file after the point I want to delete into memory, remove the part I do=
n't
want from what is stored in memory (or simply don't load it), truncate =
the
file at the point where the part I wanted to delete began, and re-write=
 the
rest of the file. The alternative (since 20MB is rather big for loading=
 into
memory on a multi-User multi-Media machine) is to load the bits I want =
to
keep into a temporary file, rather into memory. However, I was thinking=
 that
for removing 20bytes of information, reading and writing 15MB to 30MB i=
s a
lot of work. Is there a better way?




To give this more of a real world perspective. I'm downloading e-mails =
into
a mbox file and I'm trying to figure out how to delete 1 email from a m=
box
file that could potentially store 1,000's of e-mails an any given time.







-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
