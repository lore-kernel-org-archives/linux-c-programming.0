From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: mid file deletion
Date: Wed, 2 Jul 2003 23:15:09 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16131.22893.47581.672680@cerise.nosuchdomain.co.uk>
References: <000701c340f4$225660f0$ed64a8c0@descartes>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000701c340f4$225660f0$ed64a8c0@descartes>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming@vger.kernel.org


John T. Williams wrote:

> What is the best way to remove data from the middle of a file. Here i=
s the
> Scenario: I have a file that is 20MB in size, about =BC th way throug=
h it is a
> 1 line I want to remove. I can use lseek to bring me to the beginning=
 of the
> section I want to remove, and then lseek again to bring me to the end=
 of
> that section. The only thing I can think to do is load everything fro=
m the
> file after the point I want to delete into memory, remove the part I =
don't
> want from what is stored in memory (or simply don't load it), truncat=
e the
> file at the point where the part I wanted to delete began, and re-wri=
te the
> rest of the file. The alternative (since 20MB is rather big for loadi=
ng into
> memory on a multi-User multi-Media machine) is to load the bits I wan=
t to
> keep into a temporary file, rather into memory. However, I was thinki=
ng that
> for removing 20bytes of information, reading and writing 15MB to 30MB=
 is a
> lot of work. Is there a better way?

You can just read/write arbitrary-sized chunks in a loop, e.g.

	for (;;)
	{
		int n;
		lseek(fd, src_offset, SEEK_SET);
		n =3D read(fd, buf, sizeof(buf));
		if (!n)
			break;
		lseek(fd, dst_offset, SEEK_SET);
		write(fd, buf, n);
		src_offset +=3D n;
		dst_offset +=3D n;
	}
	ftruncate(fd, dst_offset);

Alternatively, you could mmap() the file and use memmove() instead of
the read/write pair (but not memcpy(); that isn't guaranteed to work
if source and destination overlap). That should provide better
performance; however, you shouldn't assume that you can mmap() the
entire file in one go, nor should you assume that both source and
destination will fit within a single mmap()'d region, so you would
need a pair of "scrolling windows". You would also have to deal with
the page-alignment issues.

BTW, if you were inserting (and hence shifting toward the end of the
file), you would have to start at the end of the file then work
backward.

--=20
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
