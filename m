From: Steve Graegert <graegerts@gmail.com>
Subject: Re: getopt() library function options
Date: Fri, 4 Mar 2005 09:42:17 +0100
Message-ID: <6a00c8d505030400424c31cd64@mail.gmail.com>
References: <1109910902.595.32.camel@0003ba16bccc>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1109910902.595.32.camel@0003ba16bccc>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: Fabio <fabio@crearium.com>

On Thu, 03 Mar 2005 22:35:02 -0600, Fabio <fabio@crearium.com> wrote:
> Hello,
> 
> I am coding a small utility for system administrator. The following command line options will be accepted:
> 
> $apstat
> $apstat -t 1
> $apstat -n 1
> $apstat -t 2 -n 2
> $apstat -v
> $apstat -t 1 -v
> $apstat -v -t 1 -n 2
> 
> unaccepted command line options:
> 
> $apstat -t
> $apstat -n
> $apstat -t <<non integer value>>
> $apstat -n <<non integer value>>
> 
> I would like that know what would be the while() command that I have to call getopt() inside the case(), for example, I need all this:
> 
>     while ((c = getopt(argc, argv, ":abf:")) != -1) {
>         switch(c) {
>         case 'a':
>              printf("a is set\n");
>              break;
>         case 'b':
>              printf("b is set\n");
>              break;
>         case 'f':
>              filename = optarg;
>              printf("filename is %s\n", filename);
>              break;
>         case ':':
>              printf("-%c without filename\n", optopt);
>              break;
>         case '?':
>              printf("unknown arg %c\n", optopt);
>              break;
>         }
>     }
> 

Hi Fabio,

this is what I would try:

while ((c = getopt(argc, argv, "n:t:v")) != -1) {
	switch (c)
	{
	case 'n':
		n_flag = (int)strtoul(optarg, NULL, 0);
		break;
	case 't':
		t_flag = (int)strtoul(optarg, NULL, 0);
		break;
	case 'v':
		v_flag = true;
		break;
	default:
		return -1;      
	}
}

It's not tested though, but hopefully points you to the right direction.

-- 
Kind Regards

    \Steve
