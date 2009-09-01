From: Jonathan Nell <crtrn13@gmail.com>
Subject: Changing syscall table
Date: Tue, 1 Sep 2009 20:57:58 +0300
Message-ID: <48e952f40909011057m70103121vf94978c8a8925734@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=PW5gJ3SvKoCXAygNo0BUMCq56jmzU5EHZC5Lah5PHho=;
        b=Ec4X+kERqpmf0E0zj1UEBQi9n02AUNBv7xJ1SqaWosUjZH0aDzL4EOw0RhGn9zZuq3
         tHWT3wWfL7xe1vrsbdMrsBMPwhcuVtMqWGe1YXmt/e2TpZYdldzWSbKs/k03yKu1eYuD
         t/xlI5VKm0q93JLgDlHCGd0xyOm/D1Qwue1BU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

I'm trying to wrap the
SG_IO ioctl call (i.e. trap it in the kernel) and have that dump the
data from (struct sg_io_hdr).dxferp.
Having issues with doing the kernel trap in the newer kernel versions
though (trying on 2.6.30). The syscall table is now read-only but for
some reason my set_memory_rw() call is failing... Any ideas how to do
this properly?

Here are the relevant bits of code:

unsigned long **find_sys_call_table(void)
{
  unsigned long **sctable;
  unsigned long ptr;

  sctable = NULL;
  for (ptr = (unsigned long)&unlock_kernel;
       ptr < (unsigned long)&loops_per_jiffy;
       ptr += sizeof(void *))
  {
     unsigned long *p;
     p = (unsigned long *)ptr;
     if (p[__NR_close] == (unsigned long) sys_close)
     {
        sctable = (unsigned long **)p;
        return &sctable[0];
     }
  }
  return NULL;
}

static int __init scsisniff_init_module(void)
{
       if ( (sys_call_table = find_sys_call_table()) ) {
           real_ioctl = (int(*)(unsigned int fd, unsigned int cmd,
unsigned long arg))sys_call_table[__NR_ioctl];

               if ( set_memory_rw( (unsigned
long)sys_call_table[__NR_ioctl], 1 ) )
                       printk( "set_memory_rw: succeeded\n" );
               else {
                       printk( "set_memory_rw: failed!\n" );
                     return -1;
               }

               sys_call_table[__NR_ioctl] = (unsigned long)my_ioctl;
       }
       else {
               return -1;
       }
     return 0;
}

This gives me a lovely OOPS:

[   71.143742] WARNING: at arch/x86/mm/pageattr.c:833
change_page_attr_set_clr+0x1a0/0x400()
[   71.143745] Modules linked in: scsi_sniff(+) i915 binfmt_misc drm
i2c_algo_bit bridge stp bnep lp snd_hda_codec_analog snd_hda_intel
snd_hda_codec snd_hwdep snd_pcm_oss snd_mixer_oss snd_pcm
snd_seq_dummy snd_seq_oss snd_seq_midi snd_rawmidi snd_seq_midi_event
snd_seq snd_timer snd_seq_device video snd psmouse tpm_infineon tpm
ppdev soundcore serio_raw pcspkr intel_agp tpm_bios output heci(C)
iTCO_wdt iTCO_vendor_support parport_pc parport snd_page_alloc floppy
usbhid usb_storage e1000e
[   71.143768] Pid: 3378, comm: insmod Tainted: G         C
2.6.30.4custom-1.0 #6
[   71.143769] Call Trace:
[   71.143773]  [<ffffffff802da6d5>] ? __vunmap+0xc5/0x110
[   71.143775]  [<ffffffff80235200>] ? change_page_attr_set_clr+0x1a0/0x400
[   71.143778]  [<ffffffff8024edf8>] warn_slowpath_common+0x78/0xd0
[   71.143780]  [<ffffffff8024ee5f>] warn_slowpath_null+0xf/0x20
[   71.143783]  [<ffffffff80235200>] change_page_attr_set_clr+0x1a0/0x400
[   71.143785]  [<ffffffffa0274050>] ? my_ioctl+0x0/0x120 [scsi_sniff]
[   71.143789]  [<ffffffff802a6dcd>] ? marker_update_probe_range+0x1dd/0x2d0
[   71.143791]  [<ffffffffa0277000>] ? scsisniff_init_module+0x0/0xf4
[scsi_sniff]
[   71.143793]  [<ffffffff80235b9a>] set_memory_rw+0x2a/0x30
[   71.143796]  [<ffffffff802ff000>] ? sys_fcntl+0x180/0x420
[   71.143798]  [<ffffffffa02770bb>] scsisniff_init_module+0xbb/0xf4
[scsi_sniff]
[   71.143801]  [<ffffffff8020a04c>] do_one_initcall+0x3c/0x180
[   71.143804]  [<ffffffff8026b7f3>] ? __blocking_notifier_call_chain+0x63/0x80
[   71.143807]  [<ffffffff8027dc0d>] sys_init_module+0xad/0x200
[   71.143810]  [<ffffffff80210fc2>] system_call_fastpath+0x16/0x1b
[   71.143812] ---[ end trace 5b3efe312296b587 ]---
[   71.143958] set_memory_rw: failed!
