From: Eric <eric@cisu.net>
Subject: Newbie Trouble with pointers and structures.
Date: Sat, 9 Aug 2003 13:16:34 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200308091316.34217.eric@cisu.net>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello:
	I am a newbie who is trying to teach himself C programming and I am having 
trouble modifying structure contents. I want the function setoption() to take 
a pointer to a pointer in a structure and modify it without needing to return 
a value (although currently it does). The function works correctly and GDB 
shows that *Option has been set to *String. However, when the function 
returns the pointer in the structure has not been modified. Here are the 
relevant code pieces.

in file vpn.c (where main() is)

structure definition (declared global in vpn.c):
struct {
	/* Structure to hold configuration parameters. The options are set to
	their defaults below. The options that need to be built will be set in
	detdefaultconfig(). The defaults here are mainly to initilize the
	pointers and any changes will be overridden by setdefaultconfig(); */
	// General Options
 	char *PPPDevice;
	char *VPNHost;
	char *LocalIP;
	char *RemoteIP;
	char *PPPDOptions;
	int Delay;
	//SSH Specific
	char *SSHCipher;
	char *SSHLogin;
	char *SSHOptions;
	int SSHPort;
	char *SSHIdentityFilename;
	//Files
	char *VPNPIDFilename;
	FILE *VPNPIDFile;
	char *LogFilename;
	FILE *LogFile;
} ConfigOptions = { NULL, NULL, NULL, NULL, NULL, 0,\
		    NULL,NULL,NULL,0, NULL,NULL, NULL,NULL,NULL};

extern char *setoption(char *Option,const char *String);

setoption is called like this from vpn.c: 
setoption(ConfigOptions.LogFilename,"/var/log/vpn.log");

in file helpers.c:
char *setoption(char *Option,const char *String){
	int achar = sizeof(char);
	/* This function takes a pointer to a structure element and sets it to
	the given string. Takes care of memory allocation with free and malloc. We
	can just give it the option and the string and let it play. Saves time. */
	if (Option != NULL){
		free(Option);
	}
	Option = (char *)malloc(achar * strlen(String));
	if (Option == NULL){
		fprintf(stderr,"Error Allocating Memory in setoption");
	}
	//Copy the new string.
	strcpy(Option,String);
}

After the function returns. GDB print ConfigOptions.LogFilename shows 0x0 
address (NULL).Obviously this is what it has been initialized to in the 
beginning. I know that
ConfigOptions.LogFilename = \ 
setoption(ConfigOptions.LogFilename,"/var/log/vpn.log");
will work....but thats not quite how I want to do it. And besides, its longer 
and kinda clunky compared to giving it the pointer only once.

According to my knowledge I should be modifying the Pointer in the structure, 
but according to gdb It seems that I am missing something.

Any help would be greatly appreciated. 

----------------------
Eric Bambach   
Eric (at) CISU (dot) net 
----------------------
