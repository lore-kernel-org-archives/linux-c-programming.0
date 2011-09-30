From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: proc entry getting created in wrong directory?
Date: Fri, 30 Sep 2011 23:43:38 +0530
Message-ID: <CAGZFCEFAUqjoD7cPNSzY10cksBkqB20_r0aP5Hw3o1SNSPTKwg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=l0gUUYF/X1EKQiPgqfUUxeugdlBa+OAxc0UxnhoLZnY=;
        b=SpGKg59AO3/kc7B5ooOiUdgkBX10Olxlcmmt1u/azOyBCzj6DUGS/C160rdvN/l3WM
         HckhFPjSZBr9j5s9+BKzckMQhWX5UT8N7OyZPc1HrzYZJ4eX83NIh/BtAbSnQpfg9N3m
         MjF7anPML+r4S9fZmqc3LLZha0Dr+hocmwpQU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-modules@vger.kernel.org, linux-c-programming@vger.kernel.org

<linux 2.6.38 kernel>

  struct file *filp = filp_open("/proc/net/stat", O_RDONLY, 0);
   proc_dir_entry = PDE(filp->f_path.dentry->d_inode);
   proc_entry = create_proc_entry( "fortune", 0644, proc_dir_entry );

"fortune" is getting created in /proc dir, why so ?


-ratheesh
