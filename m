From: Eric <eric@cisu.net>
Subject: Pointers to classes
Date: Sat, 19 Jun 2004 23:46:34 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200406192346.34166.eric@cisu.net>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello
	First I would like to say im fairly new to C++ and keep in mind you will 
probably see many glaring mistakes in reading my code, please be kind. Hey, 
thats how we learn :)

	My problem is with pointers to classes. I am writing a VPN management program 
and have a class Connection, which handles a connection ppp0, ppp1, etc, and 
is closely tied with a class ConfigFile, which handles all the variables for 
that connection obviously read from a file.

	I need to have a pointer to an object ConfigFile inside the Connection class 
so I can access variables and such associated with that connection that were 
read from a file. However, I am getting very strange compile errors when 
trying to define the pointer to a class. These are the errors. Below are the 
relevant files and how they are included.

*/home/bot403/programming/projects/vpn_client/src/connection.h:28: error: 
syntax error before `*' token 
*/home/bot403/programming/projects/vpn_client/src/connection.h:31: error: 
parse error before `*' token 
*/home/bot403/programming/projects/vpn_client/src/connection.h:36: error: 
syntax error before `*' token


Here are the relevant files. Please let me know if you need additional 
information. 

BTW, I don't consider making Connection a sublass of configfile a solution 
becuase I am already teaching myself alot with this project and am happy with 
simpleton solutions. Subclasses/Inheritance  would require that I teach 
myself way too much to accomplish way too little.


---------------------start connection.h
class Connection
{
private:
  char ifName[ 5 ];
  char pppdopts[256];
  char sshopts[256];
  char pidfile[256];
  ConfigFile * config;
  pid_t pid;
public:
  Connection(ConfigFile * cFile );
  void printName( void );
  int start();
  int stop();
  ~Connection();
  ConfigFile * getConfig();

};
----------------------- end file
-----------------------start configfile.h
int readElement( char buffer[], char option[], char argument[] );

using namespace std;

class ConfigFile {
 private:
  ifstream configFile;
  char configFileName[ 256 ];

  //File variables
  char pppdevice[ 8 ];
  char vpnhost[ 256 ];
  char logfile[ 256 ];
  char *pppdopts;
  //SSH Specific
  char sshcipher[ 15 ];
  char sshlogin[ 256 ];
  char sshidentity[ 256 ];
  char *sshopts;
  char sshport[ 10 ];
  //Misc
  char delay[ 10 ];
  char vpnpidfile[80];
  //Connection Details
  char *networks[5];
  char *nameservers[2];
  //End File Variables

 public:
  ConfigFile( char *Name );
  ~ConfigFile();
  int readConfig();
  void printConfig();
  int writeConfig(char *Filename);
  
  char *getsshopts(char buffer[]);
  char *getpppdopts(char buffer[]);
  char *getlogfile(char buffer[]);
  char *getpidfile(char buffer[]);
  
  //FIXME
  //char *getnetworks();
  //char *getnameservers();
  

};

-----------end of file
-----------top of connection.cpp

#include <iostream>
#include <fstream>
#include <unistd.h>
#include "configfile.h"
#include "connection.h"
#include "strings.h"
#include "config.h"
------snip---------

-----------------end file

----------------top of configfile.cpp

#include <iostream>
#include <fstream>
#include "configfile.h"
#include "strings.h"
-----snip------------

--------------end of file
