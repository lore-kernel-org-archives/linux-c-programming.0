From: darshan.ghumare@gmail.com
Subject: upgrade firmware
Date: Tue, 12 Oct 2010 01:44:28 -0400
Message-ID: <3463007.21286862268057.JavaMail.root@wombat>
Reply-To: darshan.ghumare@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi,

   This is Darshan (darshan.ghumare@gmail.com).
   I have a Linux based board which has one serial port (so, stdin == stdout == stderr == /dev/ttyS0). I want to send Firmware over a serial port using Y-Modem protocol. But, when I poll on given fd (after sending ASCII 'C') its got time out. Please tell me what could be problem here. I am using HyperTerminal which is connected to my board's serial port. So, neither the HyperTerminal (only when it has launched dialogue box to send firmware to the board using Y-Modem) able to read data send by the board nor board able to read data send by the HyperTerminal. But when I type on HyperTeminal then the board got the key-strokes (thats why I can atleast browse through the GUI).
   The same serial port is being used to render (VT100 based) GUI. I have managed to disable printk(s) after user-mode is up & running.
   Yes one more thing, I have also tried rz(1) but still facing the same problem.

    My current serial port settings is,

int serial_init()
{
     int serial_port_fd = -1;
     tcflag_t serial_baud =  B115200;
     struct termios old_attr,new_attr;

    memset(&new_attr,'0',sizeof(new_attr));
    memset(&old_attr,'0',sizeof(old_attr));

    serial_port_fd = open(SERIAL_PORT,O_RDWR | O_NOCTTY);
    if(serial_port_fd == -1) {
        log_msg(MODULE("serial_init : %s"),strerror(errno));
        return -1;
    }

    if(tcgetattr(serial_port_fd,&old_attr) == -1) {
        log_msg(MODULE("serial_init : %s"),strerror(errno));
        close(serial_port_fd);
        serial_port_fd = -1;
        return -1;
    }

    new_attr.c_cflag = serial_baud | CRTSCTS | CLOCAL | CREAD | CS8;
    new_attr.c_iflag = IGNPAR; //| ICRNL;
    new_attr.c_cc[VEOF] = 4;
    new_attr.c_cc[VMIN] = 1;

    if(tcflush(serial_port_fd,TCIOFLUSH) == -1) {
        log_msg(MODULE("serial_init : %s"),strerror(errno));
        close(serial_port_fd);
        serial_port_fd = -1;
        return -1;
    }

    if(tcsetattr(serial_port_fd,TCSANOW,&new_attr) == -1) {
        log_msg(MODULE("serial_init : %s"),strerror(errno));
        close(serial_port_fd);
        serial_port_fd = -1;
        return -1;
    }

    if(set_nonblocking(serial_port_fd) == -1) {
        log_msg(MODULE("serial_init : Not able to set fd non-blocking"));
        close(serial_port_fd);
        serial_port_fd = -1;
        return -1;
    }

    if(init_pollfd_slot(SERV_SERIAL_CONN,serial_port_fd,(POLLIN | POLLRDNORM | POLLRDBAND)) != 0) {
        log_msg("%s: Not able to init pollfd slots.\n",__FUNCTION__);
        close(serial_port_fd);
        serial_port_fd = -1;
        return -1;
    }
    dup(0);
    dup(0);
    printf("(%s:%d)%d END\n", __FUNCTION__, __LINE__, fcntl(serial_port_fd, F_GETFL));
    return 0;
}


    Thank you in anticipation.

Regards
Darshan


--
This message was sent on behalf of darshan.ghumare@gmail.com at openSubscriber.com
http://www.opensubscriber.com/messages/linux-c-programming@vger.kernel.org/topic.html
