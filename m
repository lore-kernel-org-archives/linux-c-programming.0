From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: More Pointer Woes
Date: Mon, 29 Dec 2003 10:44:37 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000001c3ce11$e74db020$0c81640a@aca.org.ar>
References: <200312282206.00330.theman@josephdwagner.info>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200312282206.00330.theman@josephdwagner.info>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'Joseph D. Wagner'" <theman@josephdwagner.info>, 'Jeff Woods' <kazrak+kernel@cesmail.net>
Cc: linux-c-programming@vger.kernel.org

The problem is that ext2_filsys is a pointer itself to a
struct struct_ext2_filsys
declaration in ext2fs.h:
typedef struct struct_ext2_filsys *ext2_filsys

so, you have a pointer to a pointer to a structure.
I think you should declare fs as an ext2_filsys type, like this:
ext2_filsys fs;
Then you could reference blocksize the way you are doing it in your
code...that is
fs->blocksize

Mariano Moreyra.


-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Joseph D.
Wagner
Enviado el: Domingo, 28 de Diciembre de 2003 13:06
Para: Jeff Woods
CC: linux-c-programming@vger.kernel.org
Asunto: Re: More Pointer Woes


> "fs->blocksize" refers to a field "blocksize" in a struct or union that
> the pointer "fs" indicates.  If  "fs" isn't a pointer to a struct (or
> union) then the "->" operator isn't valid.  What type is "fs"?

ext2_filsys *fs which can be found in ext2fs.h

> P.S.  Did you get this code from an email? Perhaps the ">" came from an
> email quote that didn't get cleaned up and "fs-blocksize" morphed into
> "fs->blocksize".  But this looks like a long-shot to me.  I expect that
> "fs" is supposed to be a pointer to a struct.

No, I wrote it myself.  I've tried:

fs.blocksize
fs->blocksize
*(fs).blocksize (which should be the same thing)
*(fs->blocksize)
*fs->blocksize
*(fs.blocksize)
&(fs->blocksize)

To simplify it:

int blocksize_k = fs->blocksize;

also fails.  blocksize is of type int.

Joseph D. Wagner

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

