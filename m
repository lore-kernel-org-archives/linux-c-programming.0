From: "Markus Rechberger" <mrechberger@gmail.com>
Subject: Re: max heap usage of a Linux process
Date: Mon, 13 Nov 2006 16:59:22 +0100
Message-ID: <d9def9db0611130759g549bc449i76c2b5e9bff09b3f@mail.gmail.com>
References: <455873BA.1060908@Sun.COM>
	 <d9def9db0611130609q305b243y188f01902c9ff418@mail.gmail.com>
	 <1450f66c0611130739k5391a9adu26f9698f22df4c85@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1450f66c0611130739k5391a9adu26f9698f22df4c85@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Gary <funkychunkymunky@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi,

On 11/13/06, Dan Gary <funkychunkymunky@gmail.com> wrote:
> unless parent is asking about malloc'd space, then mallinfo() or
> malloc_stats() might be what they're looking for, memory profiling the
> manual way, gotta love it
>

interesting didn't know that..

though now I have a question about it ..

#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
        char *foo;
        printf("total free space: %d\n",mallinfo().fordblks);
        foo=malloc(500000);
        if(foo){
                printf("successfully allocated!\n");
        } else {
                printf("error allocating!\n");
        }
        printf("arena: %d\n",mallinfo().arena);
        printf("ordblks: %d\n",mallinfo().ordblks);
        printf("max total allocated space: %d\n",mallinfo().usmblks);
        printf("total allocated space: %d\n",mallinfo().uordblks);
        printf("total free space: %d\n",mallinfo().fordblks);

        return 0;
}

outputs:
total free space: 0
successfully allocated!
arena: 0
ordblks: 1
max total allocated space: 0
total allocated space: 0
total free space: 0

If I allocate 50000bytes then it outputs:
total free space: 0
successfully allocated!
arena: 184320
ordblks: 1
max total allocated space: 0
total allocated space: 50008
total free space: 134312

does anyone have an explanation for that?

Markus
