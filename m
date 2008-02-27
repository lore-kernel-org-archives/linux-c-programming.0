From: Flavio Alberto Lopes Soares <flavio.thunder@gmail.com>
Subject: write() doesn't works with procfs
Date: Wed, 27 Feb 2008 07:06:23 -0300
Message-ID: <47C5361F.1010605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
        bh=fLxc5d84455N/+ez0HOS0jDm6Qw2BuIReIKnx46WP5s=;
        b=RmQx8VKw1aeL4yNNJ9FukMTVfsml8mKMhyE5pdRQMpFnkUQyX5BT8qbFAiy6BAYsmuQNA4UZn2R+7uMZSsk7cEsfFEB3nDrecLk+TmBiCj8cT9PsuEfWAy0/FSSI+5mF+uHP03J2qoqIS8MMXJwXyHC91AljarHM2adzeKSM6zU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello all,

I'm a very newbie in kernel programming and I modified a kernel module ( 
in a ARM board from Digi - www.digi.com )
to use procfs, when I pass data to this device using proc file using
shell commands works fine ( cat filebuff > /proc/ns9360_fb/screen_1
filebuff about 600KB size ), but when I use an write() call from
user-space program this doesn't works (after open() OK), when debugging
I found that the function copy_from_user() cannot transfer none byte to
buffer returning the same size of passed to it.

Why this occurs ?
Theres some way to write in procfs files using write() call ?

Thanks for any help

Flavio Alberto Lopes Soares

PS: Follow the procfs write function in driver

int ns9xxxfb_write_func_procfs(struct file* file, const char* buffer,
unsigned long count, void* data)
{
	struct 	proc_fb_data *ptr_proc_fb_data;
	struct auxiliar_fb *ptr_aux_fb;
	int res;
	unsigned char n;
	ptr_proc_fb_data = (struct proc_fb_data *)data;
	ptr_aux_fb = (struct auxiliar_fb *)ptr_proc_fb_data->data;

	printk("%d BYTES\n", count);
	switch(ptr_proc_fb_data->id){
		case PROC_MAIN_DIR:
			res = count;		
		break;
		case PROC_SCR_1:
			printk(KERN_WARNING DRIVER_NAME "NA TELA 1\n");
			if(count <= info.fb.fix.smem_len){
				//res = count;
				n = 0;
			}
			else{
				printk("ERRO TELA 1\n");
				res = -ENOMEM;
			}
		break;
		case PROC_SCR_2:
			printk(KERN_WARNING DRIVER_NAME "NA TELA 2\n");
			if(count <= info.fb.fix.smem_len){
				//res = count;
				n = 1;
			}
			else{
				printk("ERRO TELA 2\n");
			   	res = -ENOMEM;	
			}		
		break;
		case PROC_CTRL:
		{
			struct fb_fix_screeninfo *fixptr;
			copy_from_user((void *)&proc_cmd, (const void *)buffer, 1);
			res = 1;
		 	switch(proc_cmd){
		 		case PROC_CMD_SWITCH_SCR_ORIG:
		 			/*Switch one framebuffer with other*/
		 			fixptr = &fix_orig;
		 			info.fb.screen_base = screen_base_orig;
		 		 	ns9xxxfb_switch_fb(*fixptr);			
		 		break;
		 		case PROC_CMD_SWITCH_SCR_1:
		 			/*Switch one framebuffer with other*/
		 			fixptr = &info_fb_dbbuff[0].info_fb.fb.fix;	
		 			info.fb.screen_base = info_fb_dbbuff[0].info_fb.fb.screen_base;
				 	ns9xxxfb_switch_fb(*fixptr);
		 		break;
		 		case PROC_CMD_SWITCH_SCR_2:
			 		/*Switch one framebuffer with other*/
			 		fixptr = &info_fb_dbbuff[1].info_fb.fb.fix;
		 			info.fb.screen_base = info_fb_dbbuff[1].info_fb.fb.screen_base;
				 	ns9xxxfb_switch_fb(*fixptr);
		 		break;
		 		case PROC_CMD_SWITCH_LCD_ON:
		 			LCD_CONTROL = (lcd_active->control |= LCD_CONTROL_EN );
		 		break;
		 		case PROC_CMD_SWITCH_LCD_OFF:
		 			LCD_CONTROL = (lcd_active->control &= ~LCD_CONTROL_EN);		 		
		 		break;
		 		default:
		 			printk(KERN_WARNING DRIVER_NAME ": Unknown control command :
%c\n", proc_cmd);
		 			res = -ENOSYS;
		 	}
		}	
		break;
	}

	if(ptr_proc_fb_data->id != PROC_CTRL && res != -ENOMEM){
		unsigned long remain = 0;
		long pos = 0;

		pos = ptr_aux_fb->datasize - ptr_aux_fb->datacopyremain;
		pos = (pos < 0) ? 0 : pos;
		remain = copy_from_user((void *)ptr_aux_fb->info_fb.fb.screen_base +
pos, (const void *)buffer, count);

		printk("SOBROU : %ld\n", remain);
		res = count;
		ptr_aux_fb->datacopyremain -= (count + remain);

		if(ptr_aux_fb->datacopyremain <= 0){
			ptr_aux_fb->datacopyremain = ptr_aux_fb->datasize;	
		
		}					
		//printk(DRIVER_NAME ": Copiando %d bytes\n", count);
		//printk(DRIVER_NAME ": Faltaram %d bytes\n", remain);
	}
	
	return res;
}
-
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs


