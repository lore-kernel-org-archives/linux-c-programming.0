From: Ad van den Broek <advandenbroek.nl@gmail.com>
Subject: PIPE questions for Linux 2.4 setup
Date: Thu, 21 May 2009 16:56:36 +0200
Message-ID: <9f924d250905210756l5db654abkf9c9fbc4170717ac@mail.gmail.com>
Reply-To: AdvandenBroek.nl@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:reply-to:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=mXcuVyFuz7N6A3A/TGmayos20ZbiiClaEW4wtt8li+Q=;
        b=XlVs1rgzUlGrQpdaxY6NpNzHQMy+2HSv2JwRkX2u3SxX0pKBrctEria+3KgowW7LOK
         XhUpzhPSjxILnkM9KFAlIROyEGLwqKclyM/kQyL2J77B35x1+zmQkbsoM4yAvX5gnCsi
         eTKNnlWz5LKs2uh3p5XWmZ97nmfQdOe842hS8=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Dear C/Linux friends,

We wanted to increase PIPE_SIZE (from 4K to 8K on linux 2.4 on an AMD
LX800 system).
The result is a segmentation error as soon as Read() is reading more
data than 4K
from the pipe.
So pipe data seems to be damaged.
If we change PIPE_SIZE back tot 4K everything is running fine.
Question-1: Any suggestion to prevent this segmentation error ?

* PIPE_SIZE
If you look in the linux kernel code for PIPE_SIZE
("include/linux/pipe_fs_i.h") you find:
#define PIPE_SIZE PAGE_SIZE
I don't know if #define PIPE_SIZE PAGE_SIZE is necessary or just a
simple shortcut.
Question-2: Is it OK if PIPE_SIZE > PAGE_SIZE ?

* PAGE_SIZE
Question-3: Is it OK to increase Page_size on linux 2.4 on AMD LX800 system ?
Which aspects are limiting the user to config the PAGE_SIZE ?

-- 

With best regards,
Ad van den Broek
