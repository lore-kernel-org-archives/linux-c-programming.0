From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: this is a gprof of a program
Date: Wed, 17 Nov 2004 11:12:00 +0000 (GMT)
Message-ID: <20041117111200.45253.qmail@web52910.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

if somebody can guess what is this t1_4 process? /it
is taking 75% of the time.

i am nto able to detect how to remove it

thanks

 Flat profile:
      2
      3 Each sample counts as 0.01 seconds.
      4   %   cumulative   self              self    
total
      5  time   seconds   seconds    calls  ms/call 
ms/call  name
      6  75.00      0.03     0.03                     
       t1_4
      7  25.00      0.04     0.01        1    10.00   
10.00  fccorr
      8   0.00      0.04     0.00        1     0.00   
 0.00  MAX
      9
     10  %         the percentage of the total running
time of the
     11 time       program used by this function.
     12
     13 cumulative a running sum of the number of
seconds accounted
     14  seconds   for by this function and those
listed above it.
     15
     16  self      the number of seconds accounted for
by this
     17 seconds    function alone.  This is the major
sort for this
     18            listing.
     19
     20 calls      the number of times this function
was invoked, if
     21            this function is profiled, else
blank.
     22
     23  self      the average number of milliseconds
spent in this
     24 ms/call    function per call, if this function
is profiled,
     25            else blank.
                                               
granularity: each sample hit covers 4 byte(s) for
25.00% of 0.04 seconds
     41
     42 index % time    self  children    called    
name
     43                                               
  <spontaneous>
     44 [1]     75.0    0.03    0.00                
t1_4 [1]
     45
-----------------------------------------------
     46                 0.01    0.00       1/1        
  main [3]
     47 [2]     25.0    0.01    0.00       1        
fccorr [2]
     48                 0.00    0.00       1/1        
  MAX [4]
     49
-----------------------------------------------
     50                                               
  <spontaneous>
     51 [3]     25.0    0.00    0.01                
main [3]
     52                 0.01    0.00       1/1        
  fccorr [2]
     53
-----------------------------------------------
     54                 0.00    0.00       1/1        
  fccorr [2]
     55 [4]      0.0    0.00    0.00       1        
MAX [4]
     56
-----------------------------------------------
     57
     58  This table describes the call tree of the
program, and was sorted by
     59  the total amount of time spent in each
function and its children.
     60
     61  Each entry in this table consists of several
lines.  The line with the
     62  index number at the left hand margin lists
the current function.
     63  The lines above it list the functions that
called this function,
                                                      
                    


________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
