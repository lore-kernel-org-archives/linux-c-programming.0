From: Jesse Ruffin <joruffin@gmail.com>
Subject: Re: Is it helpful for a compiler to optimize?
Date: Sun, 03 Jun 2012 04:03:44 -0400
Message-ID: <4FCB1A60.5040701@gmail.com>
References: <jqf0o8$cj4$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <jqf0o8$cj4$1@dough.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

As far as I understand it the compiler's break down the code into
abstract syntax graphs then use a number of graph optimizations to
reduce it into an optimized state. The examples will almost certainly
produce equivalent binary output.

Rather than being concerned about how best to help the compiler
optimize I usually worry about the most understandable way to write
the function. Compilers are really, really good at their job, and the
completely unoptimized version is the one your going to see when you
are debugging -O0 builds.

- -Jesse

On 6/3/2012 02:38, Krzysztof wrote:
> Let's have a below code:
> 
> struct st { int iv; /*...*/ };
> 
> void afun(struct st *stp) { stp->iv++; printf("%d\n",stp->iv); }
> 
> Is it helpful for a compiler to do better optimization if I write
> the function as this?
> 
> void afun(struct st *stp) { int liv=stp->iv++;
> 
> printf("%d\n",liv); }
> 
> In other words, is it better from optimization point of view to do 
> assignments structure members values to local variables then do
> what you need to and then assign them back to member variables?
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQIcBAEBAgAGBQJPyxpgAAoJEO7eCtQ2Ge2p6bwQAJBOlV6cJnKfrhfE44DGBHQA
U8nY2weVlVX51YbnG9GAtHNbFtEIy55Z7SZSp9k44KLyQsu3Zj/E1UFQbdTsqVwQ
Gy8SJHu114x9RQgk2HvbLPp2+uwjNo2BPQf03avrD0ERPvAa1Uyfa4Q/labwWoDr
/rFV+90y3q22uEZZe85xIzuGHOLEE8z2qtZko27bvfQM9i+QYNhwCppelIci8Jr/
DhoiMs8O7EgylWaHQdZgbr7eUOjXYOdi1ypXLC5/j2S++vaXNmnSCKIXrQXvBNKc
D87TbjlqaW+E6IsQYC9uaND/mSfoWSHTwLRQuQrdYQFxlvaHHNoMIf0GICSLqoEq
vizMtu7LuWYirwQ6VJJ/CF1GKFD2jIIEE2OlQrA9fGdxLfgjU/VUG3WWc36HJYd7
Et7XGM5DsUUr0LSWUjbB4AtyKhsfiV7V4q7sgGjClrJ8dr7AqtG61rRtebG7CCL2
GBhw603yQCDHkclQaNApCU0TOYG6Rh3K+8xF+iKN6haj4bi6BduRUnxmLdZuc8Bn
VYZhT7833cBBpdkXPpMLdubo7B8qIG9/01oXXs/b7+q+jG1EF32L8dsmh5XgafoF
iy7DidF0y+oyDUZO82q2omLTMTxcRjDRyh+n8WI1/E5XG4FvqyO+xEHSC0YXe3Nn
SWvd/4lS2YEaExH17uzF
=V4At
-----END PGP SIGNATURE-----
