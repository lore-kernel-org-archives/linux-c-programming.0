From: Darren Sessions <dsessions@ionosphere.net>
Subject: Re: clear the screen
Date: Mon, 21 Feb 2005 08:50:51 -0500
Message-ID: <BE3F516B.2C95%dsessions@ionosphere.net>
References: <20050221181234.3d0de19a.wu_jian@263.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050221181234.3d0de19a.wu_jian@263.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


system("clear");

On 2/21/05 5:12 AM, "YYW" <wu_jian@263.net> wrote:

> On Mon, 21 Feb 2005 15:26:51 +0530
> "Vinodkumar Nair" <vinodkumar.nair@patni.com> wrote:
> 
>>>> printf("\e[0m\e[2J\e[1;1H");
>> 
>> How does this printf work to clear the screen?
> It's ascii control character. 2J means clear the screen and
> 1;1H set the cursor position.
> 
>> 
>> -
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


