From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Subject: Issues updating 2.6-stable branch to 2.6.24.y
Date: Wed, 13 Aug 2008 15:42:23 +0200
Message-ID: <48A2E4BF.5010107@visionsystems.de>
Reply-To: yegor_sub1@visionsystems.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi all,

I've just cloned the 2.6-stable branch

git clone 
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-2.6-stable.git

after that I have 2.6.22.6. If call "git remote show origin" I get 
following branches:

Tracked remote branches
    linux-2.6 linux-2.6.12.y linux-2.6.13.y linux-2.6.14.y 
linux-2.6.15.y linux-2.6.16.y linux-2.6.17.y linux-2.6.18.y 
linux-2.6.19.y linux-2.6.20.y linux-2.6.21.y linux-2.6.22.y 
linux-2.6.23.y linux-2.6.24.y linux-2.6.25.y linux-2.6.26.y master

I want to pull the changes from "linux-2.6.24.y" and execute

git pull origin linux-2.6.24.y

after that I've got the following message:

Automatic merge failed; fix conflicts and then commit the result.

If I look at the status "git status" I see lots of following entries

...modified:   mm/hugetlb.c
#       unmerged:   mm/readahead.c
#       modified:   mm/readahead.c
#       unmerged:   net/bluetooth/rfcomm/tty.c
#       modified:   net/bluetooth/rfcomm/tty.c
#       unmerged:   net/bridge/br_device.c
#       modified:   net/bridge/br_device.c
#       unmerged:   net/core/dev.c
#       modified:   net/core/dev.c
#       unmerged:   net/dccp/ccids/ccid2.c
#       modified:   net/dccp/ccids/ccid2.c
#       unmerged:   net/ieee80211/softmac/ieee80211softmac_assoc.c
#       modified:   net/ieee80211/softmac/ieee80211softmac_assoc.c
#       unmerged:   net/ieee80211/softmac/ieee80211softmac_wx.c
#       modified:   net/ieee80211/softmac/ieee80211softmac_wx.c
#       unmerged:   net/ipv4/netfilter/nf_conntrack_proto_icmp.c
#       modified:   net/ipv4/netfilter/nf_conntrack_proto_icmp.c
...

I didn't touch any files. So where the conflicts come from? What am I 
missing? Or how do I pull the changes from other branches to avoid such 
conflicts?

Best regards,
Yegor


