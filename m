From: "Petrin, Benjamin" <b.petrin@WPI.EDU>
Subject: Using netlink to obtain arp table entries only returns stale entries
Date: Wed, 19 May 2010 16:43:30 -0400
Message-ID: <495305EC7917D242A523BB811E017DEF010E5DB42FD3@EXCHANGEMAIL.admin.wpi.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1274301812; bh=GcLz8/q940LiUOa+kD/CPbgSosMRs0ZQb8I719DDgTI=;
	h=From:To:Date:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	b=OBrD7xw3MDBOBlV5pjQgkQp6yi57eby7jd1PLPBbA0sGRkd5X7+7LSjpwe7WfNkkr
	 SjehgpbkDCynZhvFuQrtEgeiOVrKMJ08yhAbdCrAPKHqz9SlH1Wi/FXYqYXc3P8lXE
	 RIyhp4NB8uLUsNsE5q/aNU43fE5zCmgF49GvJquE=
Content-Language: en-US
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hello.

I'm trying to retrieve neighbors from the ARP neighbor table using netlink. I've written a sample app that mostly works. The problem is, it is only retrieving "stale" neighbors, not "reachable" or any other state. This is happening despite the fact that I am using the NUD_REACHABLE flag. It seems no matter what I use as the flag, I still get the same results.

I'm not very familiar with netlink, so I've modeled most of the code after this link: http://linux-hacks.blogspot.com/2009/01/sample-code-to-learn-netlink.html.

I know I must be doing something right getting this far, but I can't seem to figure out what is missing. Any ideas?

Thanks,
Benjamin


#include <stdio.h>
#include <string.h>
#include <netinet/in.h>
#include <linux/rtnetlink.h>

int main(int argc, char** argv) {
    struct {
        struct nlmsghdr n;
        struct ndmsg r;
    } req;

    struct rtattr *rta;
    int status;
    char buf[16384];
    struct nlmsghdr *nlmp;
    struct ndmsg *rtmp;
    struct rtattr *rtatp;
    int rtattrlen;
    struct in_addr *inp;

    char lladdr[6];
    char ipv4string[INET_ADDRSTRLEN];

    int fd = socket(PF_NETLINK, SOCK_DGRAM, NETLINK_ROUTE);

    memset(&req, 0, sizeof(req));
    req.n.nlmsg_len = NLMSG_LENGTH(sizeof(struct ndmsg));
    req.n.nlmsg_flags = NLM_F_REQUEST | NLM_F_ROOT | NLM_F_REQUEST;
    req.r.ndm_state = NUD_REACHABLE;
    req.n.nlmsg_type = RTM_GETNEIGH;
    req.r.ndm_family = AF_INET; 

    rta = (struct rtattr *)(((char *)&req) + NLMSG_ALIGN(req.n.nlmsg_len));
    rta->rta_len = RTA_LENGTH(4);

    status = send(fd, &req, req.n.nlmsg_len, 0);

    if (status < 0) {
        //error sending
    }

    status = recv(fd, buf, sizeof(buf), 0);

    if (status < 0) {
        //error receiving
    }

    for(nlmp = (struct nlmsghdr *)buf; status > sizeof(*nlmp);){

        int len = nlmp->nlmsg_len;
        int req_len = len - sizeof(*nlmp);

        if (req_len<0 || len>status || !NLMSG_OK(nlmp, status)) {
            printf("error");
        }

        rtmp = (struct ndmsg *)NLMSG_DATA(nlmp);
        rtatp = (struct rtattr *)IFA_RTA(rtmp);

        rtattrlen = IFA_PAYLOAD(nlmp);

        for (; RTA_OK(rtatp, rtattrlen); rtatp = RTA_NEXT(rtatp, rtattrlen)) {       
            if(rtatp->rta_type == NDA_DST){
                inp = (struct in_addr *)RTA_DATA(rtatp);
                inet_ntop(AF_INET, inp, ipv4string, INET_ADDRSTRLEN);
                printf("addr: %s",ipv4string);
            }
        }

        status -= NLMSG_ALIGN(len);
        nlmp = (struct nlmsghdr*)((char*)nlmp + NLMSG_ALIGN(len));
    }

    return 0;
}
