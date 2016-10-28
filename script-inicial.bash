#!/bin/bash
#
# Autor: Lucas de Oliveira.
# http://github.com/martinslo
#
# Coautor: Franklin Vinicius Moraes.
# http://gitgub.com/fvmoraes
#
# Script de pós instalação para Ubuntu 16.04.
#
principal()	#Função principal, inicio
{	
	clear	#Limpa a tela.
	echo "Script de pós instalação para Ubuntu 16.04 LTS"	#Escreve na tela as opções para uso.
	echo "Escolha uma opção:"	#Solicita ao usuário escolher uma opção
	echo "                  "
	#Aqui começa as opções.
	echo "[1] Atualizar a lista de repositórios"
	echo "[2] Atualizar os programas e opções de segurança"
	echo "[3] Atualizar kernel e programas"
	echo "[4] Atualização completa do sistema"
	echo "[5] Atualizar referências do sistema"
	echo "[6] Ferramentas de rede"
	echo "[7] Retirar conta de convidado"
	#Aqui termina as opções

	read opcao	#Aguarda o usuário escolher uma opção.
	case $opcao in	#inicia o switch/case e utiliza o captado pela variável $opcao para selecionar uma das seguintes opções;
	#Aqui começa as opções.
	1)
	clear	#Limpa a tela.
	atualiza_repositorio	#Chama a função atualiza_repositorio
	;;

	2)
	clear	#Limpa a tela.
	atualiza_programas	#Chama a função atualiza_programas.
	;;

	3)
	clear	#Limpa a tela.
	atualiza_kernel	#Chama a função atualiza_kernel.
	;;

	4)
	clear	#Limpa a tela.
	atualiza_tudo	#Chama a função atualiza_tudo.
	;;

	5)
	clear	#Limpa a tela.
	atualizadb	#Chama a função atualizadb
	;;

	6)
	clear	#Limpa a tela.
	ferramentas_rede	#Chama a função ferramentas_rede
	;;

	7)
	clear	#Limpa a tela.
	retira_conta	#Chama a função retira_conta
	#Aqui termina as opções
	esac	#Termina o switch/case
}	#Função principal, fim

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
instalar_zenmap()
{
	clear
	sudo apt-get install -y zenmap
	clear
	echo "ZenMap instalado com sucesso"
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
