From: xlp <xlp@emtel.net.co>
Subject: exploitable function
Date: Tue, 25 Jun 2002 16:02:21 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020625160221.A489@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hi, if this code is setuid root, is exploitable:

if(argc==2){
	        if(!strcmp("-show_release",argv[1]))
        {
                printf("%s\n", VERSION);
                exit(1);
        }
}



