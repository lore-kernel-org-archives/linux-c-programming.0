From: Alvarez Alberto-AALVARB1 <AALVARB1@motorola.com>
Subject: RE: Daemon fork()ing 4 process
Date: Tue, 16 Jul 2002 08:59:28 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <75B979779CA1D311808400508B6F40FF05B61414@zes06exm01.madrid.ecid.cig.mot.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xlp <xlp@emtel.net.co>, linux-c-programming@vger.kernel.org

Hi,
	?maybe something like this? (I've copied this from Solaris code, I think it'll do)

struct CHILD_INFO{
	int child;               /*child pid */
	int pipechild[2]; 	/*child pipe, just in case */
};

> main(){
> 	//fork();, parent dies.
> 	//setsid(); 
> 	//chdir(workdir);
> 	//umask();
> 	while(1){
> 		// What do you suggest?

		for(i=0;i<4;i++)
		{	
			/*se crean los hijos*/
			if ((arraychild[i].child=fork())<0)/*error */
			{
				exit(0);
			}
			if(arraychild[i].hijo==0)/*child*/
			{
				ChildCode(i);
			}
			else /*father*/
			{
				...
			}
		}
		sigaction(...) or signal(...); /* catch the SIGCLD, and call ChildDead */
> 	}
> }
> 

void ChildDead(int xx)
{
	int pid_died,ret_code;
        	
	pid_died=wait(&ret_code);

	/* Now, you have the pid, so check it against arraychild and you'll know who has died */
	/* ret_code has information relevant to the child exit code (man wait) */

	....
}


Regards,

Alberto Alvarez Besada

Tlf.:        +34 914002155
e-mail.:   aalvarb1@motorola.com
            


> -----Original Message-----
> From: xlp [mailto:xlp@emtel.net.co]
> Sent: martes, 16 de julio de 2002 2:01
> To: linux-c-programming@vger.kernel.org
> Subject: Daemon fork()ing 4 process
> 
> 
> Hi, I am coding in C a daemon that has to keep 4 process 
> running doing certain operations and when for exmaple, one 
> finish, It fork()s another with other option and so on.
> Seudocode:
> -Daemon starts,
> -It fork()s 4 processess
> -It waits for ANY of the procrosses to exit().
> -If a process exits, it check the return value, and it 
> fork()s another one with other argument.
> 
> C code:
> main(){
> 	//fork();, parent dies.
> 	//setsid(); 
> 	//chdir(workdir);
> 	//umask();
> 	while(1){
> 		// What do you suggest?
> 	}
> }
> 
> thanks.
> 	
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
