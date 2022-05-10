PHPMyAdmin=v5.1.1

green="$(tput setaf 2)"


datenbank() {
  clear
  bash <(curl -s https://raw.githubusercontent.com/GermanJag/PHPMyAdminInstaller/main/install.sh)

}




tx_options(){
    echo -e  Please select your option:
    echo -e  [1] TxAdmin Newest Version with Database/PHPMyAdmin ${PHPMyAdmin} 
    echo -e  [2] Only TxAdmin. Newest Version
    read -r choice
    case $choice in
        1 ) txoption=1

            ;;
        2 ) txoption=2
        
            ;;   
        * ) 
            tx_options
    esac
}





txadmin() { 
  echo -e https://github.com/rico-dev/tx-admin-installer
 
  sleep 15

  cd /home/

  string=`wget -qO- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ | egrep -m 3 -o "............................................./*\/fx.tar.xz"`
  
	newstring=$( echo $string | cut -c113- )

  wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$newstring

  tar -Jxvf fx.tar.xz

  rm -r fx.tar.xz

  clear

  ./run.sh +set serverProfile dev_server +set txAdminPort 40120

}


 if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit 3
    fi

tx_options

case $txoption in 
        1) datenbank
           echo -e This is you Database Data. Please save it, you have 15s
           txadmin
             ;;
        2) txadmin
             ;;
esac
