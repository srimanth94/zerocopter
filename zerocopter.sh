#!/usr/bin/env bash
# A bash script for vulnerability exposures

#colors
nocolor="\033[0m"
green="\033[0;32m"
yellow="\033[0;33m"
red="\033[0;31m"
red_bold="\033[1;31m"
blue="\033[0;34m"
light_gray="\033[0;37m"
dark_gray="\033[1;30m"
magenta_bold="\033[1;35m"

#SITE 

echo "VERSION 1.0"


echo -e "${red} ________   ________   __________   _______  _____   ______   _______   _________   _______   __________         "
echo -e "${red}|________| |____|___| |_____/  / | | ____ | |____/  |  __  | | ____  | |_____|___| | ______/ | |______/ /${nocolor}"
echo -e "${red}      / /  |  |       |  |    / /  | |  | | |  /    | |  | | | |___| |     | |     | |       | |     / /    ${nocolor}"
echo -e "${red}     / /   |  |_____  |  |___/ /   | |  | | | |     | |  | | |_______|     | |     | |_____  | |___ / / ${nocolor}"
echo -e "${red}    / /    |  |_____| |  |___\/    | |  | | | |     | |  | | | |           | |     | |_____| | |___\ / ${nocolor}"
echo -e "${red}   / /     |  |       |  |  \ \    | |  | | | |     | |  | | | |           | |     | |       | |   \ \  ${nocolor}"
echo -e "${red}  / /____  |  |_____  |  |   \ \   | |__| | |  \__  | |__| | | |           | |     | |_____  | |    \ \ ${nocolor}"
echo -e "${red} |_______| |__|_____| |__|    \_\  |______|  \____/ |______| |_|           |_|     |_|_____| | |     \_\ ${nocolor}"
echo -e "\n"
echo -e "\n"
echo -e "${blue}SrimanthTIP.thm${nocolor}"  
sleep 5

#                 -------------------------messages-------------------------------

#functions

#info function
info() {
 echo -e "${blue}[*] $1${nocolor}"
}
 
#success function
success() {
echo -e "${green}[+] $1${nocolor}"
}

#warning function
warning() {
echo -e "${yellow}[!] $1${nocolor}"
}

#fail funciton
fail() {
echo -e "${red}[-] $1${nocolor}"
}
#HOSTNAME
HostName=`hostname 2>/dev/null`
if [ "$HostName" ];
then
echo -e " ${green}###HOST-INFORMATION###${nocolor} \n ${blue}$HostName${nocolor} "
echo -e "\n"
fi

#CURRENTUSER
CurrentUser=`id 2>/dev/null`
if [ "$CurrentUser" ];
then
echo -e "${green}[+]###CURRENT-USER-INFO###${nocolor} \n ${blue}$CurrentUser${nocolor}"
echo -e "\n"
fi
#kernal information
kernalInfo=`uname -a && uname -r  2>/dev/null`
if [ "$kernalInfo" ];
then 
echo -e " ${green}[+]####BASIC-KERNAL-INFORMATION#####${nocolor} \n ${blue}$kernalInfo${nocolor}"
echo -e "\n"
fi
#proc version 
ProcVersion=`cat /proc/version 2>/dev/null`
if [ "$ProcVersion" ];
then
echo -e  " ${green}[+]####BASIC-PROC-INFORMATION####${nocolor} \n ${blue}$ProcVersion${nocolor}"
echo  -e "\n"
fi

###LOGGED-USERS###
LogUser=`w 2>/dev/null`
if [ "$LogUser" ]; then
echo -e "${green}[+]###THE-USERS-WHO-ARE-LOGGED-IN###${nocolor} ${blue}$LogUser${nocolor}"
echo -e "\n"
fi

###/ETC/PASSWD-PERMISSIONS###
EtcPasswd=`ls -l /etc/passwd | cut -d " " -f 1  2>/dev/null`
if [ r == ${EtcPasswd:7:-2} 2>/dev/null ]; then
#echo "${EtcPasswd:7:-2}"
echo -e "${green}[+]###/etc/passwd-FILE-IS-WORLD-READABLE###${nocolor}"
else 
echo -e "${red}[-]###/etc/passwd IS-UNREADABLE###${nocolor} "
fi
echo -e "\n"

EtcPasswrd=`ls -l /etc/passwd | cut -d " " -f 1  2>/dev/null`
if [ w == ${EtcPasswrd:8:-1} 2>/dev/null]; then
#echo "${EtcPasswrd:8:-1}"
echo -e "${green}[+]###/etc/passwd-FILE-IS-WORLD-WRITABLE###${nocolor}"
else 
echo -e "${red}[-]###/etc/passwd HAS-NO-WRITE-PERMISSIONS###${nocolor} "
fi
echo -e "\n"

EtcPasswxd=`ls -l /etc/passwd | cut -d " " -f 1  2>/dev/nulll`
if [ "x" == ${EtcPasswxd:9:10} 2>/dev/null]; then
#echo "${EtcPasswd:9:10}"
echo -e "${green}[+]###/etc/passwd-FILE-HAS-EXECUTABLE-PERMISSIONS###${nocolor}"
else 
echo -e "${red}[-]###/etc/passwd-HAS-NO EXECUTABLE-PERMISSIONS###${nocolor} "
fi
echo -e "\n"
##############SUID-BINARIES############

##MYSQL-SERVICE###

MySql=`find / type f -perm -u=s -print 2>/dev/null | grep /home/user/tools/mysql-udf`
if [ "/home/user/tools/mysql-udf" == ${MySql} ]; then
echo -e "${green}[+]###USER-DEFINED-FUNCTIONS-TO-RUN-SYSTEM-COMMANDS-AS-ROOT-VIA-MYSQL-SERVICE###${nocolor}"
echo -e "${blue}${MySql}${nocolor}"
echo -e "###{yellow}[v]VISIT :-- https://www.exploit-db.com/exploits/1518${nocolor}"
else
echo -e "${red}[-]###MYSQL-SERVER-IS-NOT-RUNNING-FOR-UDFs###{nocolor}"
echo -e "\n"
fi

###/etc/shadow###

EtcShadwr=`ls -l /etc/shadow | cut -d " " -f 1  2>/dev/null`
if [ r == ${EtcShadwr:7:-2} 2>/dev/null]; then
#echo "${EtcShadwr:7:-2}"
echo -e "${green}[+]###/etc/shadow-FILE-IS-WORLD-READABLE###${nocolor}"
else 
echo -e "${red}[-]###/etc/shadow IS-UNREADABLE###${nocolor}"
fi
echo -e "\n"

EtcShadwo=`ls -l /etc/shadow | cut -d " " -f 1  2>/dev/null`
if [ w == ${EtcShadwo:8:-1} 2>/dev/null]; then
#echo "${EtcShadwo:8:-1}"
echo -e "${green}[+]###/etc/shadow-FILE-IS-WORLD-WRITABLE###${nocolor}"
else 
echo -e "${red}[-]###/etc/shadow HAS-NO-WRITE-PERMISSIONS###${nocolor}"
fi
echo -e "\n"

EtcShadxw=`ls -l /etc/shadow | cut -d " " -f 1  2>/dev/null`
if [ x == ${EtcShadxw:9:10} 2>/dev/null]; then
#echo "${EtcShadxw:9:10}"
echo -e "${green}[+]###/etc/shadow-FILE-HAS-EXECUTABLE-PERMISSIONS###${nocolor}"
else 
echo -e "${red}[-]###/etc/shadow-HAS-NO EXECUTABLE-PERMISSIONS###${nocolor} "
fi
echo -e "\n"



###CRON JOBS###

####EXIM###
echo -e "${yellow}[!]###searching for exim####${nocolor}"
EXIM=`find / type f -perm -u=s -print 2>/dev/null | grep /usr/sbin/exim-4.84-3`
if [ "/usr/sbin/exim-4.84-3" == ${EXIM} 2>/dev/null ]; then
echo -e "${green}[+]###A KNOWN FOUND FOE USER BIN EXIM###${nocolor}"
echo -e "${blue}${EXIM}${nocolor}"
echo -e "###{yellow}[v]VISIT :-- https://www.exploit-db.com/exploits/1518${nocolor}"
else
echo -e "${red}[-]###NO EXPLOIT FOUND FOR EXIM###${nocolor}"
echo -e "\n"
fi


###suid-so###

echo -e "${yellow}[!]###searching for suid-so binaries####${nocolor}"
SuidSo=`find / type f -perm -u=s -print 2>/dev/null | grep /usr/local/bin/suid-so`
if [ "/usr/local/bin/suid-so" == ${SuidSo} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUID SHARED OBJECT BINARIES###${nocolor}"
echo -e "${blue}${SuidSo}${nocolor}"
else
echo -e "${red}[-]###NO SUID BINARIES FOUND FOR SUID-SO###${nocolor}"
fi
echo -e "\n"


###suid-env###

echo -e "${yellow}[!]###searching for suid-env binaries####${nocolor}"
SiudEnv=`find / type f -perm -u=s -print 2>/dev/null | grep /usr/local/bin/suid-env`
if [ "/usr/local/bin/suid-env" == ${SuidEnv} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUID ENVIRONMENT###${nocolor}"
echo -e "${blue}${SuidEnv}${nocolor}"
else
echo -e "${red}[-]###NO SUID BINARIES FOUND FOR SUID-ENV###${nocolor}"
fi
echo -e "\n"

###suid-env2

echo -e "${yellow}[!]###searching for suid-env2 binaries####${nocolor}"
echo -e "${yellow}[!]### Bash versions <4.2-048 ###${nocolor}"
SiudEnv2=`find / type f -perm -u=s -print 2>/dev/null | grep /usr/local/bin/suid-env2`
if [ "/usr/local/bin/suid-env2" == ${SuidEnv2} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUID ENVIRONMENT-2###${nocolor}"
echo -e "${blue}${SuidEnv}${nocolor}"
else
echo -e "${red}[-]###NO SUID BINARIES FOUND FOR SUID-ENV2####${nocolor}"
fi
echo -e "\n"


###nfs-exploits###

echo -e "${yellow}[!]###searching for nfs-exploits####${nocolor}"
Nfs=`cat /etc/exports | grep no_root_squash | cut -d "," -f 2`
if [ "no_root_squash" == ${Nfs} 2>/dev/null]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR NFS-EXPLOITS###${nocolor}"
echo -e "${blue}${Nfs}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://resources.infosecinstitute.com/topic/exploiting-nfs-share/"
else
echo -e "${red}[-]###NO NFS-EXPLOITS FOUND###${nocolor}"
fi
echo -e "\n"

###pkexec###

echo -e "${yellow}[!]###searching for pkexec binaries####${nocolor}"
PkExec=`find / type f -perm -u=s -print 2>/de/vnull | grep /usr/bin/pkexec`
if [ /usr/bin/pkexec == ${PkExec} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR PKEXEC-BINARIES###${nocolor}"
echo -e "${blue}${PkExec}${nocolor}"
else
echo -e "${red}[-]###NO SUID BINARIES FOUND FOR PKEXEC###${nocolor}"
fi
echo -e "\n"

###crontab###

echo -e "${yellow}[!]###searching for cronjobs###${nocolor}"

echo -e "${green}[+]###HAVE A LOOK AT /etc/crontab ###${nocolor}"

echo -e "\n"

###ld-preload###

echo -e "${yellow}[!]###searching for sudo env variables ###${nocolor}"
LdPre=`sudo -l | grep env_keep+=LD_PRELOAD | cut -d "," -f 2`
if [ "env_keep+=LD_PRELOAD" == ${LdPre} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES ###${nocolor}"
echo -e "${blue}${LdPre}${nocolor}"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES###${nocolor}"
fi
echo -e "\n"

###iftop###
echo -e "${yellow}[!]###searching for sudo env variables (iftop) ###${nocolor}"
IfTop=`sudo -l | grep  "/usr/sbin/iftop"`
if [ "(root) NOPASSWD: /usr/sbin/iftop" == ${IfTop} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(iftop) ###${nocolor}"
echo -e "${blue}${IfTop}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (iftop)###${nocolor}"
fi
echo -e "\n"

###find###

echo -e "${yellow}[!]###searching for sudo env variables (find) ###${nocolor}"
Find=`sudo -l | grep  "/usr/sbin/find"`
if [ "(root) NOPASSWD: /usr/bin/find" == ${Find} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(find) ###${nocolor}"
echo -e "${blue}${Find}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (find)###${nocolor}"
fi
echo -e "\n"

###nano###

echo -e "${yellow}[!]###searching for sudo env variables (nano) ###${nocolor}"
Nano=`sudo -l | grep  "/usr/bin/nano"`
if [ "(root) NOPASSWD: /usr/bin/nano" == ${Nano} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(nano) ###${nocolor}"
echo -e "${blue}${Nano}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (nano)###${nocolor}"
fi
echo -e "\n"

###vim###

echo -e "${yellow}[!]###searching for sudo env variables (vim) ###${nocolor}"
Vim=`sudo -l | grep  "/usr/bin/vim"`
if [ "(root) NOPASSWD: /usr/bin/vim" == ${Vim} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(vim) ###${nocolor}"
echo -e "${blue}${Vim}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (vim)###${nocolor}"
fi
echo -e "\n"


###man###

echo -e "${yellow}[!]###searching for sudo env variables (man) ###${nocolor}"
Man=`sudo -l | grep  "/usr/bin/man"`
if [ "(root) NOPASSWD: /usr/bin/man" == ${Man} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(man) ###${nocolor}"
echo -e "${blue}${Man}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (man)###${nocolor}"
fi
echo -e "\n"


###awk###
echo -e "${yellow}[!]###searching for sudo env variables (awk) ###${nocolor}"
Awk=`sudo -l | grep  "/usr/bin/awk"`
if [ "(root) NOPASSWD: /usr/bin/awk" == ${Awk} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(awk) ###${nocolor}"
echo -e "${blue}${Awk}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (awk)###${nocolor}"
fi
echo -e "\n"

###less###

echo -e "${yellow}[!]###searching for sudo env variables (less) ###${nocolor}"
Less=`sudo -l | grep  "/usr/bin/less"`
if [ "(root) NOPASSWD: /usr/bin/less" == ${Less} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(less) ###${nocolor}"
echo -e "${blue}${Less}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (less)###${nocolor}"
fi
echo -e "\n"

###ftp###

echo -e "${yellow}[!]###searching for sudo env variables (ftp) ###${nocolor}"
Ftp=`sudo -l | grep  "/usr/bin/ftp"`
if [ "(root) NOPASSWD: /usr/bin/ftp" == ${Ftp} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(ftp) ###${nocolor}"
echo -e "${blue}${Ftp}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (ftp)###${nocolor}"
fi
echo -e "\n"

###nmap### 

echo -e "${yellow}[!]###searching for sudo env variables (nmap) ###${nocolor}"
Nmap=`sudo -l | grep  "/usr/bin/nmap"`
if [ "(root) NOPASSWD: /usr/bin/nmap" == ${Nmap} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(nmap) ###${nocolor}"
echo -e "${blue}${Nmap}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (nmap)###${nocolor}"
fi
echo -e "\n"


###more###

echo -e "${yellow}[!]###searching for sudo env variables (more) ###${nocolor}"
More=`sudo -l | grep  "/usr/bin/more"`
if [ "(root) NOPASSWD: /usr/bin/more" == ${More} ]; then
echo -e "${green}[+]###A LOCAL PRIVESC FOR SUDO ENV VARIABLES(more) ###${nocolor}"
echo -e "${blue}${More}${nocolor}"
echo -e "###{yellow}[v]VISIT :--https://gtfobins.github.io/"
else
echo -e "${red}[-]###NO EXPLOITS FOUND FOR SUDO ENV VARIABLES (more)###${nocolor}"
fi
echo -e "\n"




















