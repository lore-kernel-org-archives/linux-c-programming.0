From: "Senthil Nathan V" <senthilnathan@mail.cyberneme.com>
Subject: Re: filesystem in the kernel
Date: Thu, 25 Nov 2004 15:06:28 +0530
Message-ID: <opsh0ky2au00eaj5@202.144.45.6>
References: <5959EA4638D8734599AB75EAAFBB6FEFA471E6@mtv01ex04.mindtree.com>
Reply-To: senthilnathan@mail.cyberneme.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <5959EA4638D8734599AB75EAAFBB6FEFA471E6@mtv01ex04.mindtree.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: linux-c-programming@vger.kernel.org

On Thu, 25 Nov 2004 12:04:31 +0530, Bakki Srinivas  
<bakki_srinivas@mindtree.com> wrote:

> hi,
>     when a filesystem is registered with the kernel eg.
> register_filesystem(&ext2_fs_type);
>   where is the structure ext2_fs_type declared ?
>
	ext2_fs_type is variable of type "struct file_system_type"

	Refer to the source code in /usr/src/lyour_linux_kernel_dir/  
include/linux/fs.h


--
regards,
Senthil Nathan V
	


	

