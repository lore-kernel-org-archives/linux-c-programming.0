From: wwp <subscript@free.fr>
Subject: Re: malloc and free
Date: Mon, 20 May 2002 12:06:07 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020520120607.275757c6.subscript@free.fr>
References: <200205201126.QAA01696@ns1.dypatil.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200205201126.QAA01696@ns1.dypatil.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sameer Maggon <smaggon@dypatil.edu>
Cc: linux-c-programming@vger.kernel.org

Hi Sameer,


On Mon, 20 May 2002 16:56:30 +0530 (IST) Sameer Maggon <smaggon@dypatil.edu> wrote:

[snip]
>   char *token;
>   token = (char *)malloc(256 * sizeof(char));
> 
>   ...
>   ...
>   token = strtok(...,"\0");
[snip]

The problem is there, you change "token"'s value, so you
lost the value formerly returned by malloc (this one has
to be free()'ed) because strtok returns a pointer to the next
token IIRC. Then, the "token" you attempt to free is not
the good one.

For instance, if I didn't miss anything:
	char *token, *buffer;
	buffer = (char *)malloc(256 * sizeof(char));
	token = buffer;
	token = strtok(...,"\0");
	..
	free(buffer);


Regards,

-- 
wwp
