veryfy_fun () {
SRC="/etc/ADM-db/sources" && [[ ! -d ${SRC} ]] && mkdir ${SRC}
unset ARQ
case $1 in
"BotGen.sh")ARQ="/etc/ADM-db/";;
*)ARQ="/etc/ADM-db/sources/";;
esac
mv -f $HOME/update/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}


download () {
echo -e "\033[1;33mDescargando archivos... ESPERE "

cd $HOME
wget -O $HOME/lista-arq https://www.dropbox.com/s/33x5314phepp5ju/lista?dl=0 -o /dev/null
echo 999 > ${CIDdir}/limit
n=1
[[ -d $HOME/update ]] && rm -rf $HOME/update/* || mkdir $HOME/update
cd $HOME/update && wget -i $HOME/lista-arq -o /dev/null
for arqx in `ls $HOME/update`; do
echo -ne "\033[1;33mFichero \033[1;31m[${n}.bot] "
[[ -e $HOME/update/$arqx ]] && veryfy_fun $arqx
n=$(($n + 1))
done

echo -ne "\033[1;31m[ ! ] RESTAUDANDO ADMINISTRADOR "
(
[[ -e /root/token ]] && mv /root/token /etc/ADM-db/token
[[ -e /root/resell ]] && mv /root/resell /etc/ADM-db/resell
[[ -e /root/Admin-ID ]] && mv /root/Admin-ID /etc/ADM-db/Admin-ID
[[ -e /root/User-ID ]] && mv /root/User-ID /etc/ADM-db/User-ID
[[ -e /root/ress ]] && mv /root/ress /etc/ADM-db/ress
[[ -e /root/limit ]] && mv /root/limit /etc/ADM-db/limit
[[ -e /root/num-key.cont ]] && mv /root/num-key.cont /etc/ADM-db/num-key.cont
) && echo -e "\033[1;32m [OK]" || echo -e "\033[1;31m [FAIL]"
[[ ! -e ${CIDdir}/resell ]] && echo "@Phreaker56" > ${CIDdir}/resell
[[ ! -e $(cat < /etc/mpayu) ]] && echo "Paypal : phreaker56@gmail.com" > /etc/mpayu && echo "50589148974" > /etc/numctc
# rm $HOME/lista-arq
sleep 3
 read -p "Presiona Enter para continuar"
 bot_gen
}
