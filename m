From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: About getopt()
Date: Thu, 8 Aug 2002 18:41:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15698.44351.527488.846163@cerise.nosuchdomain.co.uk>
References: <3D5284CF.8090708@veritel.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3D5284CF.8090708@veritel.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "William N. Zanatta" <william@veritel.com.br>
Cc: linux-c-programming@vger.kernel.org


William N. Zanatta wrote:

>    getopt() does memory allocation for the optarg pointer it sets when a 
> value for it is found, right?

No. optarg will point at or into one of the elements of argv.

E.g. for "./foo -a hello", optarg will be equal to argv[2], while for
"./foo -ahello", optarg will be equal to argv[1]+2.

-- 
Glynn Clements <glynn.clements@virgin.net>
