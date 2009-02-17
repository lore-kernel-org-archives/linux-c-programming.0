From: Bryan Christ <bryan.christ@gmail.com>
Subject: Re: running out of file descriptors
Date: Tue, 17 Feb 2009 12:51:51 -0600
Message-ID: <444391460902171051x31c7a307mf5d8a088ecd4f9aa@mail.gmail.com>
References: <444391460902152148u11d4a973ka5a630898405d1c6@mail.gmail.com>
	 <3605561d0902152218t431d9edbuf87397bdc9af999@mail.gmail.com>
	 <444391460902152309h179bd75agdded10ca6af135d@mail.gmail.com>
	 <200902160701.14982.eric@cisu.net>
	 <444391460902160935t5b244463nec095fedc45f3707@mail.gmail.com>
	 <18841.56827.356161.98320@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=+50OGnweOPbj4x6avwD8WujF+4HkTiopfWWuXTZrZDw=;
        b=r9Aso51RMHTdmeM0zlafaJ5WQn37bOaM7OLQND5yskHECyCFvnCWG88oYJRhpgpH54
         fdy0FZVz/YJGH8faGZcSwJ2Nw04floivVkWccCWSawH1XoLY8cKu/+O/aZuXTy506ISV
         HX6HP8qCr6CWGN6OpKfLrxL1Equfi3LaHzyOQ=
In-Reply-To: <18841.56827.356161.98320@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: eric@cisu.net, Joe Damato <ice799@gmail.com>, linux-c-programming@vger.kernel.org

Thanks Glynn.

Well according to these values I'm only using about 1500 file
descriptors out of the 560178.


On Mon, Feb 16, 2009 at 3:43 PM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> Bryan Christ wrote:
>
>> I pretty sure you can just echo to /proc/sys/fs/file-nr to set that
>> value (which already seems really high at 560178).  I doubt I'm
>> exhausting 560178 descriptors.
>
> file-nr is read-only, and reports the number of open descriptors, the
> number of free descriptors, and the limit.
>
> file-max is writable, and controls the system-wide limit.
>
> --
> Glynn Clements <glynn@gclements.plus.com>
>



-- 
Bryan
<><
