From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: mode_t mode in mkdir(2)
Date: Sun, 23 Jun 2002 04:05:18 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15637.15086.442381.205946@cerise.nosuchdomain.co.uk>
References: <20020622164739.A44581@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020622164739.A44581@nietzsche>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xlp <xlp@emtel.net.co>
Cc: linux-c-programming@vger.kernel.org


xlp wrote:

> hi ppl, What are the values for mode_t mode in mkdir(2) ?, HOw can i
> know what mode to use?, What is the relation between the valude of
> node and the user file mask?.

The "mode" argument corresponds to the permission bits from the
st_mode field in "struct stat", i.e.

       S_IRWXU    00700     mask for file owner permissions
       S_IRUSR    00400     owner has read permission
       S_IWUSR    00200     owner has write permission
       S_IXUSR    00100     owner has execute permission
       S_IRWXG    00070     mask for group permissions
       S_IRGRP    00040     group has read permission
       S_IWGRP    00020     group has write permission
       S_IXGRP    00010     group has execute permission
       S_IRWXO    00007     mask for permissions for others (not in group)
       S_IROTH    00004     others have read permission
       S_IWOTH    00002     others have write permisson
       S_IXOTH    00001     others have execute permission

[Note: the above values are octal.]

-- 
Glynn Clements <glynn.clements@virgin.net>
