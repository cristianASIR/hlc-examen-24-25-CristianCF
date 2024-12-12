#!/bin/bash
set -e

source /root/admin/usuarios/usuarios.sh
source /root/admin/ssh/ssh.sh

chmod +x /root/admin/usuarios/usuarios.sh
chmod +x /root/admin/ssh/ssh.sh

main(){
   newUser  

   newSSH

 exec /usr/sbin/sshd -D &
}

main