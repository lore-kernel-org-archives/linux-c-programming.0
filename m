From: Vasiliy G Tolstov <v.tolstov@selfip.ru>
Subject: get in kernel module committed_as under 2.6.18 rhel kernel
Date: Thu, 23 Sep 2010 11:40:18 +0400
Message-ID: <1285227618.28983.5.camel@vase.work>
Reply-To: v.tolstov@selfip.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=selfip.ru; s=dk;
	h=Content-Transfer-Encoding:Mime-Version:Message-ID:Date:Content-Type:To:Reply-To:From:Subject; bh=oylGrV6Tzm81xwGXLmxYV3IV+vc9NjCstErKxfTTqA4=;
	b=ea1vxZ9XXgSBI2rmVwLs3qQs43MuzuqcDDmEXK2uYGtUvpyuLH0UAMJxFt2f+UIv5EAHjNfm8yUBnJsC7x63tzgq7J4eHFuHfQZz3Lcj7H/YZ0uOOQpuHg+nhO+aqIio;
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello. I need to get Committed_AS undex 2.6.18 in my kernel module. How
can i do that? I'm check this under fs/proc/proc_misc.c i need to access
vm_committed_space that defined as atomic_t. But it in kernel data and
not export to modules. How can i avoid this?

Thank's.

-- 
Vasiliy G Tolstov <v.tolstov@selfip.ru>
Selfip.Ru

