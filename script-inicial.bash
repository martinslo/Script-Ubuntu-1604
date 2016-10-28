#!/bin/bash
#
# Autor: Lucas de Oliveira.
# http://github.com/martinslo
#
# Coautor: Franklin Vinicius Moraes.
# http://github.com/fvmoraes
#
# Script de pós instalação para Ubuntu 16.04.
#
principal()	#Função principal, inicio.
{	
	clear	#Limpa a tela.
	echo "Script de pós instalação para Ubuntu 16.04 LTS"	#Escreve na tela as opções para uso.
	echo "Escolha uma opção:"	#Solicita ao usuário escolher uma opção.
	echo ""	#Espaçamento para melhorar a visualização.
	#Aqui começa as opções.
	echo "[1] Atualizar a lista de repositórios"
	echo "[2] Atualizar os programas e opções de segurança"
	echo "[3] Atualizar kernel e programas"
	echo "[4] Atualização completa do sistema"
	echo "[5] Atualizar referências do sistema"
	echo "[6] Ferramentas de rede"
	echo "[7] Retirar conta de convidado"
	#Aqui termina as opções.

	read opcao	#Aguarda o usuário escolher uma opção.
	case $opcao in	#inicia o switch/case e utiliza o captado pela variável $opcao para selecionar uma das seguintes opções;
	#Aqui começa as opções do case.
	1)
	clear	#Limpa a tela.
	atualiza_repositorio	#Chama a função atualiza_repositorio.
	;;	#Fim desta opção do case.

	2)
	clear	#Limpa a tela.
	atualiza_programas	#Chama a função atualiza_programas.
	;;	#Fim desta opção do case.

	3)
	clear	#Limpa a tela.
	atualiza_kernel	#Chama a função atualiza_kernel.
	;;	#Fim desta opção do case.

	4)
	clear	#Limpa a tela.
	atualiza_tudo	#Chama a função atualiza_tudo.
	;;	#Fim desta opção do case.

	5)
	clear	#Limpa a tela.
	atualizadb	#Chama a função atualizadb.
	;;	#Fim desta opção do case.

	6)
	clear	#Limpa a tela.
	ferramentas_rede	#Chama a função ferramentas_rede.
	;;	#Fim desta opção do case.

	7)
	clear	#Limpa a tela.
	retira_conta	#Chama a função retira_conta.
	;;	#Fim desta opção do case.
	
	# ESTA OPÇÃO [*)] OBRIGATORIAMENTE PRECISA FICAR ABAIXO DE TODAS, POR ULTIMO, [POIS ELA ACEITA *ALL*]!!!
	*)
	clear	#Limpa a tela.
	opcao_desconhecida	#Chama a função opcao_desconhecida.
	principal	#Chama a função principal
	;;	#Fim desta opção do case
	#Aqui termina as opções do case.
	esac	#Termina o switch/case.
}	#Função principal, fim.

atualiza_repositorio()	#Função atualiza_repositorio, inicio.
{
	clear	#Limpa a tela.
	sudo apt update	#Comando de update de sistemas Ubuntu, usando apenas APT.
	clear	#Limpa a tela.
	echo "Lista de repositórios atualizada com sucesso"	#Infomação ao usuário.
	echo ""	#Espaçamento para melhorar a visualização.
	echo "Pressione ENTER para continuar"	#Solicitação de interação para prosseguir.
	read pause	#Comando para aguardar interação[ENTER]
	principal	#Retorno a função principal de menus
}	#Função atualiza_repositorio, fim.
atualiza_programas()	#Função atualiza_programas, inicio.
{
	clear	#Limpa a tela.
	sudo apt update	#Comando de update de sistemas Ubuntu, usando apenas APT.
	sudo apt upgrade -y	#Comando de upgrade de sistemas Ubuntu, usando apenas APT e o parametro -y para já aceitar a atualização.
	clear	#Limpa a tela.
	echo "Programas e opções de segurança atualizados com sucesso"	#Infomação ao usuário.
	echo ""	#Espaçamento para melhorar a visualização.
	echo "Pressione ENTER para continuar"	#Solicitação de interação para prosseguir.
	read pause	#Comando para aguardar interação[ENTER]
	principal	#Retorno a função principal de menus
}	#Função atualiza_programas, fim.
atualiza_kernel()	#Função atualiza_kernel, inicio.
{
	clear	#Limpa a tela.
	sudo apt update	#Comando de update de sistemas Ubuntu, usando apenas APT.
	sudo apt dist-upgrade -y #Comando de upgrade de sistemas Ubuntu, usando apenas APT e o parametro -y para já aceitar a atualização.
	clear	#Limpa a tela.
	echo "Kernel e programas atualizados com sucesso"	#Infomação ao usuário.
	echo ""	#Espaçamento para melhorar a visualização.
	echo "Pressione ENTER para continuar"	#Solicitação de interação para prosseguir.
	read pause	#Comando para aguardar interação[ENTER]
	principal	#Retorno a função principal de menus
}	#Função atualiza_kernel, fim.
atualiza_tudo()	#Função atualiza_tudo, inicio.
{
	clear	#Limpa a tela.
	sudo apt update	#Comando de update de sistemas Ubuntu, usando apenas APT.
	sudo apt full-upgrade -y	#Comando de upgrade de sistemas Ubuntu, usando apenas APT e o parametro -y para já aceitar a atualização.
	clear	#Limpa a tela.
	echo "O sistema foi atualizado com sucesso"	#Infomação ao usuário.
	echo ""	#Espaçamento para melhorar a visualização.
	echo "Pressione ENTER para continuar"	#Solicitação de interação para prosseguir.
	read pause	#Comando para aguardar interação[ENTER]
	principal	#Retorno a função principal de menus
}	#Função atualiza_tudo, fim.
atualizadb()	#Função atualizadb, inicio.
{
	clear	#Limpa a tela.
	sudo updatedb -v
	sudo update-grub && sudo update-grub2
	clear	#Limpa a tela.
	echo "As referências do sistema foram reassociadas com sucesso"	#Infomação ao usuário.
	echo ""	#Espaçamento para melhorar a visualização.
	echo "Pressione ENTER para continuar"	#Solicitação de interação para prosseguir.
	read pause	#Comando para aguardar interação[ENTER]
	principal	#Retorno a função principal de menus
}	#Função atualizadb, fim.
ferramentas_rede()	#Função ferramentas_rede, inicio
{
	clear	#Limpa a tela.
	echo "Ferramentas de rede"	#Escreve na tela as opções para uso.
	echo "Escolha uma opção:"	#Solicita ao usuário escolher uma opção.
	echo ""	#Espaçamento para melhorar a visualização.
	#Aqui começa as opções.
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
	#Aqui termina as opções.

	read opcaoRede	#Aguarda o usuário escolher uma opção.
	case $opcaoRede in	#inicia o switch/case e utiliza o captado pela variável $opcaoRede para selecionar uma das seguintes opções;
	#Aqui começa as opções do case.
	1)
	clear	#Limpa a tela.
	instalar_nmap	#Chama a função instalar_nmap.
	;;	#Fim desta opção do case.

	2)
	clear	#Limpa a tela.
	instalar_zenmap	#Chama a função instalar_zenmap.
	;;	#Fim desta opção do case.

	3)
	clear	#Limpa a tela.
	instalar_putty	#Chama a função instalar_putty.
	;;	#Fim desta opção do case.
	
	4)
	clear	#Limpa a tela.
	instalar_iptraf	#Chama a função instalar_iptraf.
	;;	#Fim desta opção do case.

	5)
	clear	#Limpa a tela.
	instalar_tcpdump	#Chama a função instalar_tcpdump.
	;;	#Fim desta opção do case.

	6)
	clear	#Limpa a tela.
	instalar_vnstat	#Chama a função instalar_vnstat.
	;;	#Fim desta opção do case.
	
	7)
	clear	#Limpa a tela.
	instalar_iperf	#Chama a função instalar_iperf.
	;;	#Fim desta opção do case.
	
	8)
	clear	#Limpa a tela.
	instalar_wireshark	#Chama a instalar_wireshark.
	;;	#Fim desta opção do case.

	9)
	clear	#Limpa a tela.
	instalar_remmina	#Chama a função instalar_remmina.
	;;	#Fim desta opção do case.

	10)
	clear	#Limpa a tela.
	principal	#Chama a função principal.
	;;	#Fim desta opção do case
	# ESTA OPÇÃO [*)] OBRIGATORIAMENTE PRECISA FICAR ABAIXO DE TODAS, POR ULTIMO, [POIS ELA ACEITA *ALL*]!!!
	*)
	clear	#Limpa a tela.
	opcao_desconhecida	#Chama a função opcao_desconhecida.
	ferramentas_rede	#Chama a funçao ferramentas_rede.
	;;	#Fim desta opção do case
	#Aqui termina as opções do case.
	esac	#Termina o switch/case.
}	#Função ferramentas_rede, fim.
instalar_nmap()	#Função instalar_nmap, inicio.
{
	clear	#Limpa a tela.
	sudo apt-get install -y nmap
	clear	#Limpa a tela.
	echo "NMap instalado com sucesso"	#Infomação ao usuário.
	echo ""	#Espaçamento para melhorar a visualização.
	echo "Pressione ENTER para continuar"	#Solicitação de interação para prosseguir.
	read pause	#Comando para aguardar interação[ENTER].
	ferramentas_rede	#Retorno a função ferramentas_rede de sub-menu.
}	#Função instalar_nmap, fim.
instalar_zenmap()	#Função instalar_znmap, inicio.
{
	clear	#Limpa a tela.
	sudo apt-get install -y zenmap
	clear	#Limpa a tela.
	echo "ZenMap instalado com sucesso"	#Infomação ao usuário.
	echo ""	#Espaçamento para melhorar a visualização.
	echo "Pressione ENTER para continuar"	#Solicitação de interação para prosseguir.
	read pause	#Comando para aguardar interação[ENTER].
	ferramentas_rede	#Retorno a função ferramentas_rede de sub-menu.
}	#Função instalar_znmap, fim.
retira_conta()	#Função retira_conta, inicio.
{
	clear	#Limpa a tela.
	sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'
	clear	#Limpa a tela.
	echo "A conta de convidade foi removida com sucesso"	#Infomação ao usuário.
	echo ""	#Espaçamento para melhorar a visualização.
	echo "Pressione ENTER para continuar"	#Solicitação de interação para prosseguir.
	read pause	#Comando para aguardar interação[ENTER].
	principal	#Retorno a função principal de menus.
}	#Função instalar_znmap, fim.
opcao_desconhecida()	#Função opcao_desconhecida, inicio.
{
	clear	#Limpa a tela.
	echo "Esta opção é desconhecida!"	#Infomação ao usuário.
	echo ""	#Espaçamento para melhorar a visualização.
	echo "Pressione ENTER para continuar"	#Solicitação de interação para prosseguir.
	read pause	#Comando para aguardar interação[ENTER].
}	#Função opcao_desconhecida, fim.
principal	#Chama a função principal.
