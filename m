From: "J." <mailing-lists@xs4all.nl>
Subject: Re: getline()
Date: Sun, 24 Aug 2003 18:01:34 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0308241756590.25738-100000@hestia>
References: <20030824203653.A574@Imrashi.net.bd>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030824203653.A574@Imrashi.net.bd>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sun, 24 Aug 2003, Progga wrote:

> 
>  Is there any 'C' lib which contains the getline() function ? I have found
> a code similar to this:
> 
>  -------
> 
>  char *temp ;
>  int n = 0 ;
>  FILE *file_handle = NULL ;
> 
>  // [snipped]
> 
>  getline(&temp, &n, file_handle);                                        

Aren't you searching for fgets() ?

char line[1024];

while((fgets(line, 1024, stdin)) != NULL)
 printf("%s", line);

> 
>  Khoda Hafez
>  Progga

JM

