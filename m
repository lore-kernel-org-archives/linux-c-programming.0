From: "Christian Stalp" <christian.stalp@gmx.de>
Subject: Re: sprintf with mips
Date: Wed, 06 Feb 2008 23:48:22 +0100
Message-ID: <20080206224822.178960@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org
Cc: Eric Polino <aluink@gmail.com>

the second printf is only for debugging purpose. The whole string 'insertvalues' is used for SQL-query later.


Eric Polino wrote:
>
>
> On Feb 6, 2008 2:16 PM, Christian Stalp <christian.stalp@gmx.de> wrote:
>
>     Hello out there,
>     are there any known problems with sprintf under mips? I spend some time to make this code runnable:
>
>     sprintf(insertvalues, " %d , ' %s ' , %d ", counter, "192.168.1.1", mytraffic->num_frames);
>     printf("input-string: %s\n", insertvalues);
>
>
> I don't know if this really matters...but why are you doing this this way?  Why not just do it in one line with
>
> printf("input-string:   %d , ' %s ' , %d \n", counter, "192.168.1.1", mytraffic->num_frames);

-- 
Ist Ihr Browser Vista-kompatibel? Jetzt die neuesten 
Browser-Versionen downloaden: http://www.gmx.net/de/go/browser
