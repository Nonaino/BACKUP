#!/bin/bash
######################################
######################################
## Backup local/remoto automatizado ##
##          NONAINO  11/2019        ##
######################################
######################################
#
#
source ./backup.conf
echo "" >> $HOME/.backup/log/backup_$fecha.log
echo "************************************" >> $HOME/.backup/log/backup_$fecha.log
echo "*********** $hora ***************" >> $HOME/.backup/log/backup_$fecha.log
echo "************************************"  >> $HOME/.backup/log/backup_$fecha.log
echo "" >> $HOME/.backup/log/backup_$fecha.log
# cambiar purto de conexion SSH
rsync -avzh --partial --delete --suffix=-$fecha -b --backup-dir=$versiones -e 'ssh -p 22' $orig $usuario@$servidor$dest 1>>$HOME/.backup/log/backup_$fecha.log 2>/dev/null
echo ""  >> $HOME/.backup/log/backup_$fecha.log
echo "========================================================================================================================="  >> $HOME/.backup/log/backup_$fecha.log
echo ""  >> $HOME/.backup/log/backup_$fecha.log
# /usr/bin/notify-send -u normal -t 30000 -i /ruta/imagen.png 'BACKUP CON EXISTO:' "Backup de <b>Documentos</b> terminado con exito a las <b>$(date +%H:%M)</b>"
sleep 1s
exit
