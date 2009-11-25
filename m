From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: select() timeout question
Date: Wed, 25 Nov 2009 03:58:26 -0500
Message-ID: <34e1241d0911250058j47bb2bebo8a8763b4188b8541@mail.gmail.com>
References: <34e1241d0911250029g5e56e1cdxe7abfce03eb15836@mail.gmail.com>
	 <da5b0fda0911250038k4f6b87e7o3fd39e4c2db5ce86@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=UDFBjE+hgTy19TzxZgTVWUvgCdREAX0fv8SNoAvqma8=;
        b=LLzNJFA5Xs3NWVH7h57YxcN6zgIgCpNla3c+M/3osUsipkcVr30NYK6SQQIFtFHXzj
         bg3jEllnynu21lEF3S9jFqhlzEaS2X1LnSZRF01I1+rsAdn/JZdmTQOFahi+zQne6yGM
         DTCYsrzcw2eW1KHg6547FB6h1ioVJT1p7yE7Y=
In-Reply-To: <da5b0fda0911250038k4f6b87e7o3fd39e4c2db5ce86@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Liao <phyomh@gmail.com>, linux-c-programming@vger.kernel.org

Hi Sam,

That's means the data is buffered right?, is it guaranteed?

                         - Randi

On Wed, Nov 25, 2009 at 3:38 AM, Sam Liao <phyomh@gmail.com> wrote:
> You will get the data for next select call.
>
> -Sam
