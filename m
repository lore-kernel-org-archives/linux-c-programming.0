From: darshan.ghumare@gmail.com
Subject: Msync Invalid Arg
Date: Tue, 29 Dec 2009 06:52:05 -0500
Message-ID: <22791256.21262087525518.JavaMail.root@wombat>
Reply-To: darshan.ghumare@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Whne I try to execute following code then  get an erro message that "Invalid Argumemt" in msync. 


#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/errno.h>
#include <sys/time.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <pthread.h>
#include <linux/types.h>

int main()
{
	int fd;
	char data[20];
	__u8 *start_addr,*end_addr;
	int PageSize;

	if ( (PageSize = sysconf(_SC_PAGE_SIZE)) < 0) {
	    perror("sysconf() Error=");
		    return -1;
	}
	printf("PageSize = %d\n",PageSize);

	if((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1)
	{ 
		printf("Error opening /dev/mem\n");
		return -1;
	}

	start_addr = mmap(0, PageSize, PROT_READ | PROT_WRITE, MAP_SHARED, fd,
										0);
	if(start_addr == MAP_FAILED)
	{
		printf("enc_status map failed %s\n", strerror(errno));
		return -1;
	}

	end_addr = start_addr + (4096 - 1);
	strcpy(data, "Test Msg");
	printf("\n%s:Writing NVRAM.......\n", __FUNCTION__);
	if(write(fd, data, strlen(data)) <= 0)
	{
		printf("%s: Not able to write on NVRAM. %s.\n", __FUNCTION__,
				strerror(errno));
		return -1;
	}
	printf("\n%s:Synching NVRAM.......\n", __FUNCTION__);
	if(msync(start_addr, PageSize, MS_SYNC) <= 0)
	{
		printf("%s: Not able to sync to NVRAM. %s.\n", __FUNCTION__,
				strerror(errno));
		return -1;
	}
	printf("\n%s:reading NVRAM.......\n", __FUNCTION__);
	strcpy(data, "");
	if(read(fd, data, sizeof(data)) <= 0)
	{
		printf("%s: Not able to read on NVRAM. %s.\n", __FUNCTION__,
				strerror(errno));
		return -1;
	}
	printf("%s: data  %s.\n", __FUNCTION__, data);
	return 0;
}


--
This message was sent on behalf of darshan.ghumare@gmail.com at openSubscriber.com
http://www.opensubscriber.com/messages/linux-c-programming@vger.kernel.org/topic.html
