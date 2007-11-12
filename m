From: Gery <zaphod001@gmail.com>
Subject: Re: reading elf section data
Date: Mon, 12 Nov 2007 13:25:15 -0500
Message-ID: <47389A8B.8030108@gmail.com>
References: <473856E2.5050707@gmail.com> <18232.12586.211596.82841@cerise.gclements.plus.com>
Reply-To: zaphod001@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=hjA7eRZJF/BKFHylKzrfzz445Cq+H9jU+eTKU9dNHTk=;
        b=ge41/T18u5WX3qdKmvU6Imus56ZRO7u1M4ihz6d0L0v/MvOK7NTiyN7BUMQqM8CC6CHdUqglfzKlpBGnxbbxOglcybXsoUxHL8LXtGsStbMRFoiTyTqZPrwZC+dvHmSDPqRgP8hAlqFtc6NW5Va7lSFgj5KpW9dXHhRbrr4eDSs=
In-Reply-To: <18232.12586.211596.82841@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Glynn Clements wrote:
> Gery wrote:
>
>   
>> How to read in human format data from elf section?
>>     
>
> Can you be more specific? What kind of data? What format?
>
> objdump and readelf can provide a lot of information about ELF files,
> but they can't decode every type of data which could conceivably be
> stored in an ELF file.
>
>   
Ok.
i put some structure with gcc attribute to special section named ".my_sec"
The structure is like
struct abc {
char *a;
char *b;
};
and global variable is
struct abc klm = { "this is 1st string", "this is 2nd string" };

Which utility can show me just the data of that section?

