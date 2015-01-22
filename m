From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: sizeof *data, when data isn't initalized, is that right?
Date: Thu, 22 Jan 2015 16:19:54 -0200
Message-ID: <54C13F4A.2020404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=emD507YqqaCiXUyl1GsXWrQEF8kHzavRNFVXvzGmHxc=;
        b=FlBbop5trQQWwdcNgse1Z2kIC0MVKltvdI3fak6gkG/J3dVC652YL6BjfxMpkj6MRU
         k3HoyMWzzn39EdWzFnAvBpJm6pveITQkkAj/qOxDiVAhTVw981KP1IT80QS3eELjhxhf
         W3XIH3n6KPvYAAJI1P7UH7rouOg8Q0WCXGl6jDKRhFQmhMzJGhmYx2r6tO5GkmTiazEu
         ZHb2xhwwuqAc6XCEI4280yZIY4GRLKcFQJhGlpgl/EFO+RAZ0W6I6NO0bf+Dvib/NO/4
         ofGXGu9ddD+ruDUlpP4en71yDD6biTM8xObQIrpMEGgbT2+7/Hqi28vo58btXE0iyTob
         v5vg==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

I came across this code:

         struct mcp23s08_driver_data     *data;
	...
	data = kzalloc(sizeof *data + chips * sizeof(struct mcp23s08),
                         GFP_KERNEL);


Since data wasn't initialized when `sizeof *data' is called, wasn't this a non-initialized pointer dereference?

Cheers
