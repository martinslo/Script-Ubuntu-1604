#!/bin/bash
#
# Baseado no script de Franklin Moraes
# http://gitgub.com/fvmoraes
#
# Autor: Lucas de Oliveira
# http://github.com/lmoliveira
#
# Script de pós instalação para Ubuntu 16.04
#
principal()
{	
	clear #limpa a tela
	echo "Script de pós instalação para Ubuntu 16.04 LTS" #escreve na tela
	echo "Escolha uma opção:"
	echo "                  "
	echo "[1] Atualizar a lista de repositórios"
	echo "[2] Atualizar os programas e opções de segurança"
	echo "[3] Atualizar kernel e programas"
	echo "[4] Atualização completa do sistema"
	echo "[5] Atualizar referências do sistema"
	echo "[6] Ferramentas de rede"
	echo "[7] Retirar conta de convidado"

	read opcao
	case $opcao in

	1)
	clear
	atualiza_repositorio
	;;

	2)
	clear
	atualiza_programas
	;;

	3)
	clear
	atualiza_kernel
	;;

	4)
	clear
	atualiza_tudo
	;;

	5)
	clear
	atualizadb
	;;

	6)
	clear
	ferramentas_rede
	;;

	7)
	clear
	retira_conta
	esac
}

atualiza_repositorio()
{
	clear
	sudo apt update
	clear
	echo "Lista de repositórios atualizada com sucesso"
	echo ""
	echo "Pressione ENTER para continuar"
	read pause
	principal
}
atualiza_programas()
{
	clear
	sudo apt update
	sudo apt upgrade -y
	clear
	echo "Programas e opções de segurança atualizados com sucesso"
	echo ""
	echo "Pressione ENTER para continuar"
	read pause
	principal
}
atualiza_kernel()
{
	clear
	sudo apt update
	sudo apt dist-upgrade -y
	clear
	echo "Kernel e programas atualizados com sucesso"
	echo ""
	echo "Pressione ENTER para continuar"
	read pause
	principal
}
atualiza_tudo()
{
	clear
	sudo apt update
	sudo apt full-upgrade -y
	clear
	echo "O sistema foi atualizado com sucesso"
	echo ""
	echo "Pressione ENTER para continuar"
	read pause
	principal
}
atualizadb()
{
	clear
	sudo updatedb -v
	sudo update-grub && sudo update-grub2
	clear
	echo "As referências do sistema foram reassociadas com sucesso"
	echo ""
	echo "Pressione ENTER para continuar"
	read pause
	principal
}
ferramentas_rede()
{
	clear
	echo "Ferramentas de rede"
	echo "Escolha uma opção:"
	echo ""
	echo "[1] Instalar NMap"
	echo "[2] Instalar ZenMap"
	echo "[3] Instalar Putty"
	echo "[4] Instalar IpTraf"
	echo "[5] Instalar TCPDump"
	echo "[6] Instalar VNStat"
	echo "[7] Instalar Iperf"
	echo "[8] Instalar Wireshark"
	echo "[9] Instalar Remmina"
	echo "[10] Voltar"

	read opcaoRede
	case $opcaoRede in

	1)
	clear
	instalar_nmap
	;;

	2)
	clear
	instalar_zenmap
	;;

	3)
	clear
	instalar_putty
	;;
	
	4)
	clear
	instalar_iptraf
	;;

	5)
	clear
	instalar_tcpdump
	;;

	6)
	clear
	instalar_vnstat
	;;
	
	7)
	clear
	instalar_iperf
	;;
	
	8)
	clear
	instalar_wireshark
	;;

	9)
	clear
	instalar_remmina
	;;

	10)
	clear
	principal
	esac
}
instalar_nmap()
{
	clear
	sudo apt-get install -y nmap
	clear
	echo "NMap instalado com sucesso"
	echo ""
	echo "Pressione ENTER para continuar"
	read pause
	ferramentas_rede
}
retira_conta()
{
	clear
	sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'
	clear
	echo "A conta de convidade foi removida com sucesso"
	echo ""
	echo "Pressione ENTER para continuar"
	read pause
	principal
}
principal
