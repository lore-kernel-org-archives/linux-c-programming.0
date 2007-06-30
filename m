From: "Luong Ngo" <luong.ngo@gmail.com>
Subject: Using operator ! twice
Date: Fri, 29 Jun 2007 17:36:07 -0700
Message-ID: <1b2aacd80706291736s18563893q83a19d0ae5662514@mail.gmail.com>
References: <1b2aacd80706291734y55b6e654i956767ae2a6f5e46@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=NOUM7bEdvjDV79kSBXB9Co5A6DgxW21hBzUqV25QUZabKcDYCyl9u95SyM+aZBZ4QREGTxNQPrrLs5bTmoPmThl2/tIe5Du5p12cXzJlDyeNahGLlAhwrjmtEsBSs2hYqeZJ64/+Y8CeHQK1rT9GSdP4h6X0gOUfjwm7zkqG4lQ=
In-Reply-To: <1b2aacd80706291734y55b6e654i956767ae2a6f5e46@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,

I came across several times codes that use ! operator on an integer
variable. I am curious what is the purpose of using it twice.
For example:

int flag;
               if( !! flag) {
                   //do something
               }


The first ! operator will make !flag to be true if flag is 0, and if
we not again it become false, which is just exactly the same if we
just left it as
   if(flag), since 0 is the same as false. Similar logic for non-0
value of flag. Then why do we need to use ! operator twice to get back
the same value as if we don't use at all? this seems to be the same
for me if we do this in math:  -(-( -8)) = -8;

Any explanation would be appreciated.

Thanks,
-L
