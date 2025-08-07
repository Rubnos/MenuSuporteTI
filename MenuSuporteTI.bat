@echo off
title Menu de Suporte Técnico
color 0A
chcp 65001 >nul

:MAIN_MENU
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    MENU DE SUPORTE TÉCNICO                        ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Sistema                                                       ║
echo ║  [2] Rede                                                          ║
echo ║  [3] Disco                                                         ║
echo ║  [4] Impressoras                                                   ║
echo ║  [5] Limpeza                                                       ║
echo ║  [6] Utilitários                                                   ║
echo ║  [7] Domínio                                                       ║
echo ║  [8] Drivers                                                       ║
echo ║  [9] Instalar Programas                                            ║
echo ║  [0] Sair                                                          ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p opcao=Digite sua opção:

if "%opcao%"=="1" goto SISTEMA
if "%opcao%"=="2" goto REDE
if "%opcao%"=="3" goto DISCO
if "%opcao%"=="4" goto IMPRESSORAS
if "%opcao%"=="5" goto LIMPEZA
if "%opcao%"=="6" goto UTILITARIOS
if "%opcao%"=="7" goto DOMINIO
if "%opcao%"=="8" goto DRIVERS
if "%opcao%"=="9" goto INSTALAR_PROGRAMAS
if "%opcao%"=="0" goto SAIR
goto MAIN_MENU

:REDE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                           MENU REDE                               ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Diagnóstico de Rede                                           ║
echo ║  [2] Resetar Configurações TCP/IP                                  ║
echo ║  [3] Flush DNS                                                     ║
echo ║  [4] Teste de Conectividade                                        ║
echo ║  [5] Informações de Rede                                           ║
echo ║  [6] Verificar Interfaces de Rede Ativas e Velocidade              ║
echo ║  [7] Ativar/Desativar Firewall                                     ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p rede_opcao=Digite sua opção:

if "%rede_opcao%"=="1" goto DIAGNOSTICO_REDE
if "%rede_opcao%"=="2" goto RESET_TCPIP
if "%rede_opcao%"=="3" goto FLUSH_DNS
if "%rede_opcao%"=="4" goto TESTE_CONECTIVIDADE
if "%rede_opcao%"=="5" goto INFO_REDE
if "%rede_opcao%"=="6" goto VERIFICAR_INTERFACES
if "%rede_opcao%"=="7" goto MENU_FIREWALL
if "%rede_opcao%"=="0" goto MAIN_MENU
goto REDE

:MENU_FIREWALL
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    CONTROLE DE FIREWALL                           ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Verificar Status do Firewall                                  ║
echo ║  [2] Ativar Firewall (Todos os Perfis)                             ║
echo ║  [3] Desativar Firewall (Todos os Perfis)                          ║
echo ║  [4] Ativar Firewall Apenas Rede Pública                           ║
echo ║  [5] Ativar Firewall Apenas Rede Privada                           ║
echo ║  [6] Ativar Firewall Apenas Domínio                                ║
echo ║  [7] Restaurar Configurações Padrão do Firewall                    ║
echo ║  [0] Voltar ao Menu de Rede                                        ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p firewall_opcao=Digite sua opção:

if "%firewall_opcao%"=="1" goto VERIFICAR_FIREWALL
if "%firewall_opcao%"=="2" goto ATIVAR_FIREWALL_TODOS
if "%firewall_opcao%"=="3" goto DESATIVAR_FIREWALL_TODOS
if "%firewall_opcao%"=="4" goto ATIVAR_FIREWALL_PUBLICO
if "%firewall_opcao%"=="5" goto ATIVAR_FIREWALL_PRIVADO
if "%firewall_opcao%"=="6" goto ATIVAR_FIREWALL_DOMINIO
if "%firewall_opcao%"=="7" goto RESTAURAR_FIREWALL
if "%firewall_opcao%"=="0" goto REDE
goto MENU_FIREWALL

:VERIFICAR_FIREWALL
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                  STATUS ATUAL DO FIREWALL                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Verificando status do Windows Defender Firewall... [cite: 25]
echo.
netsh advfirewall show allprofiles state
echo.
echo ═══════════════════════════════════════════════════════════════════
echo Informações detalhadas:
echo.
[cite_start]powershell.exe -Command "Get-NetFirewallProfile | Select-Object Name, Enabled | Format-Table -AutoSize" [cite: 26]
echo.
pause
goto MENU_FIREWALL

:ATIVAR_FIREWALL_TODOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║              ATIVANDO FIREWALL (TODOS OS PERFIS)                  ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo ATENÇÃO: Esta operação ativará o Firewall para todos os perfis de rede. [cite: 28]
echo.
set /p confirma_ativar=Deseja continuar? (S/N)[cite_start]: [cite: 28, 29]
if /i "%confirma_ativar%" NEQ "S" goto MENU_FIREWALL

echo.
echo Ativando Firewall para todos os perfis...
netsh advfirewall set allprofiles state on
echo.
[cite_start]if errorlevel 1 ( [cite: 30]
    [cite_start]echo ❌ Erro ao ativar o Firewall. [cite: 30]
) else (
    [cite_start]echo ✅ Firewall ativado com sucesso em todos os perfis! [cite: 30]
    echo.
    [cite_start]echo Status atual: [cite: 30]
    netsh advfirewall show allprofiles state
)
echo.
[cite_start]pause [cite: 31]
goto MENU_FIREWALL

:DESATIVAR_FIREWALL_TODOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║             DESATIVANDO FIREWALL (TODOS OS PERFIS)                ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo ⚠️  ATENÇÃO: Desativar o Firewall pode deixar seu sistema vulnerável! [cite: 32]
[cite_start]echo Esta operação desativará a proteção de rede em todos os perfis. [cite: 33]
echo.
set /p confirma_desativar=Tem certeza que deseja continuar? (S/N)[cite_start]: [cite: 33, 34]
if /i "%confirma_desativar%" NEQ "S" goto MENU_FIREWALL

echo.
echo Desativando Firewall para todos os perfis...
netsh advfirewall set allprofiles state off
echo.
[cite_start]if errorlevel 1 ( [cite: 35]
    [cite_start]echo ❌ Erro ao desativar o Firewall. [cite: 35]
) else (
    [cite_start]echo ✅ Firewall desativado em todos os perfis. [cite: 35]
    [cite_start]echo ⚠️  Lembre-se de reativar o Firewall quando necessário! [cite: 35]
    echo.
    [cite_start]echo Status atual: [cite: 35]
    netsh advfirewall show allprofiles state
)
echo.
[cite_start]pause [cite: 36]
goto MENU_FIREWALL

:ATIVAR_FIREWALL_PUBLICO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║              ATIVANDO FIREWALL - REDE PÚBLICA                     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Ativando Firewall apenas para redes públicas... [cite: 37]
netsh advfirewall set publicprofile state on
echo.
[cite_start]if errorlevel 1 ( [cite: 38]
    [cite_start]echo ❌ Erro ao ativar o Firewall para rede pública. [cite: 38]
) else (
    [cite_start]echo ✅ Firewall ativado para redes públicas! [cite: 38]
)
echo.
[cite_start]pause [cite: 39]
goto MENU_FIREWALL

:ATIVAR_FIREWALL_PRIVADO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║              ATIVANDO FIREWALL - REDE PRIVADA                     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Ativando Firewall apenas para redes privadas... [cite: 40]
netsh advfirewall set privateprofile state on
echo.
[cite_start]if errorlevel 1 ( [cite: 41]
    [cite_start]echo ❌ Erro ao ativar o Firewall para rede privada. [cite: 41]
) else (
    [cite_start]echo ✅ Firewall ativado para redes privadas! [cite: 41]
)
echo.
[cite_start]pause [cite: 42]
goto MENU_FIREWALL

:ATIVAR_FIREWALL_DOMINIO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║               ATIVANDO FIREWALL - REDE DOMÍNIO                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Ativando Firewall apenas para redes de domínio... [cite: 43]
netsh advfirewall set domainprofile state on
echo.
[cite_start]if errorlevel 1 ( [cite: 44]
    [cite_start]echo ❌ Erro ao ativar o Firewall para rede de domínio. [cite: 44]
) else (
    [cite_start]echo ✅ Firewall ativado para redes de domínio! [cite: 44]
)
echo.
[cite_start]pause [cite: 45]
goto MENU_FIREWALL

:RESTAURAR_FIREWALL
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║            RESTAURANDO CONFIGURAÇÕES PADRÃO                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Esta operação irá restaurar todas as configurações do Firewall [cite: 46]
echo para os valores padrão do Windows.
echo.
set /p confirma_restaurar=Deseja continuar? (S/N)[cite_start]: [cite: 47]
if /i "%confirma_restaurar%" NEQ "S" goto MENU_FIREWALL

echo.
echo Restaurando configurações padrão do Firewall...
netsh advfirewall reset
echo.
[cite_start]if errorlevel 1 ( [cite: 48]
    [cite_start]echo ❌ Erro ao restaurar configurações do Firewall. [cite: 48]
) else (
    [cite_start]echo ✅ Configurações padrão do Firewall restauradas com sucesso! [cite: 48]
    echo.
    [cite_start]echo Status atual: [cite: 48]
    netsh advfirewall show allprofiles state
)
echo.
[cite_start]pause [cite: 49]
goto MENU_FIREWALL

:VERIFICAR_INTERFACES
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║            VERIFICANDO INTERFACES DE REDE ATIVAS                  ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Aguarde, coletando informações das interfaces de rede... [cite: 50]
echo.

:: Executa o comando PowerShell para verificar interfaces ativas e velocidade
[cite_start]powershell.exe -Command "Get-CimInstance -ClassName Win32_NetworkAdapter | Where-Object { $_.NetEnabled -eq $true } | Select-Object Name, @{Name = 'Tipo de Conexão'; Expression = { $speed = $_.Speed / 1e6; switch ($speed) { 100 { 'Fast Ethernet (100 Mbps)' } 1000 { 'Gigabit Ethernet (1000 Mbps)' } 2500 { '2.5 Gigabit Ethernet (2500 Mbps)' } 10000 { '10 Gigabit Ethernet (10000 Mbps)' } default { \"$speed Mbps\" } } }} | Format-Table -Property @{ Label = 'Name'; Expression = { $_.Name }; Width = 50 }, @{ Label = 'Tipo de Conexão'; Expression = { $_.'Tipo de Conexão' }; Width = 30 }" [cite: 50, 51]

echo.
[cite_start]echo ╔════════════════════════════════════════════════════════════════════╗ [cite: 52]
[cite_start]echo ║                    VERIFICAÇÃO CONCLUÍDA                          ║ [cite: 52]
[cite_start]echo ╚════════════════════════════════════════════════════════════════════╝ [cite: 52]
echo.
[cite_start]pause [cite: 53]
goto REDE

:DIAGNOSTICO_REDE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    DIAGNÓSTICO DE REDE                            ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Executando diagnóstico de rede... [cite: 54]
netsh wlan show profiles
ipconfig /all
echo.
pause
goto REDE

:RESET_TCPIP
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                 RESETANDO CONFIGURAÇÕES TCP/IP                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Resetando configurações de rede... [cite: 56]
netsh int ip reset
netsh winsock reset
echo.
echo Configurações resetadas. Reinicie o computador para aplicar as mudanças.
[cite_start]pause [cite: 57]
goto REDE

:FLUSH_DNS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                        LIMPANDO CACHE DNS                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Limpando cache DNS... [cite: 58]
ipconfig /flushdns
echo.
echo Cache DNS limpo com sucesso!
pause
goto REDE

:TESTE_CONECTIVIDADE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   TESTE DE CONECTIVIDADE                          ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Testando conectividade... [cite: 60]
ping google.com
ping 8.8.8.8
echo.
pause
goto REDE

:INFO_REDE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   INFORMAÇÕES DE REDE                             ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Coletando informações de rede... [cite: 61]
ipconfig /all
echo.
echo ═══════════════════════════════════════════════════════════════════
echo Informações de adaptadores de rede:
echo.
[cite_start]powershell.exe -Command "Get-NetAdapter | Select-Object Name, InterfaceDescription, LinkSpeed, Status | Format-Table -AutoSize" [cite: 62]
echo.
pause
goto REDE

:SISTEMA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         MENU SISTEMA                              ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Informações do Sistema                                        ║
echo ║  [2] Analisar e Reparar Arquivos Essenciais (DISM)                  ║
echo ║  [3] Verificar Integridade dos Arquivos (SFC)                      ║
echo ║  [4] Verificar Disco (CHKDSK)                                      ║
echo ║  [5] Informações de Hardware                                       ║
echo ║  [6] Gerenciador de Tarefas                                        ║
echo ║  [8] Verificar Memória (mdsched)                                   ║
echo ║  [7] Serviços do Windows                                           ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]if "%sistema_opcao%"=="2" goto DISM_SCAN [cite: 69]
[cite_start]if "%sistema_opcao%"=="8" goto MEMORIA [cite: 69]
set /p sistema_opcao=Digite sua opção:

if "%sistema_opcao%"=="1" goto INFO_SISTEMA
if "%sistema_opcao%"=="2" goto SFC_SCAN
if "%sistema_opcao%"=="3" goto CHKDSK
if "%sistema_opcao%"=="4" goto INFO_HARDWARE
if "%sistema_opcao%"=="5" goto TASKMGR
if "%sistema_opcao%"=="6" goto SERVICOS
if "%sistema_opcao%"=="0" goto MAIN_MENU
goto SISTEMA

:INFO_SISTEMA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   INFORMAÇÕES DO SISTEMA                          ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]systeminfo [cite: 71]
echo.
pause
goto SISTEMA

:SFC_SCAN
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║              VERIFICAÇÃO DE INTEGRIDADE (SFC)                     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Executando verificação de integridade dos arquivos do sistema... [cite: 72]
echo ATENÇÃO: Este processo pode demorar alguns minutos.
echo.
sfc /scannow
echo.
[cite_start]pause [cite: 73]
goto SISTEMA

:CHKDSK
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    VERIFICAÇÃO DE DISCO                           ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Discos disponíveis: [cite: 74]
[cite_start]powershell.exe -Command "Get-WmiObject -Class Win32_LogicalDisk | Select-Object DeviceID, @{Name='Size(GB)';Expression={[math]::Round($_.Size/1GB,2)}}, @{Name='FreeSpace(GB)';Expression={[math]::Round($_.FreeSpace/1GB,2)}} | Format-Table -AutoSize" [cite: 74]
echo.
[cite_start]set /p drive=Digite a letra do drive para verificar (ex: C): [cite: 75]
echo.
[cite_start]echo Executando verificação do disco %drive%... [cite: 76]
chkdsk %drive%: /f /r
echo.
pause
goto SISTEMA

:INFO_HARDWARE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   INFORMAÇÕES DE HARDWARE                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Processador: [cite: 78]
[cite_start]powershell.exe -Command "Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors | Format-Table -AutoSize" [cite: 78]
echo.
[cite_start]echo Memória RAM: [cite: 79]
[cite_start]powershell.exe -Command "Get-WmiObject -Class Win32_PhysicalMemory | Select-Object @{Name='Capacity(GB)';Expression={[math]::Round($_.Capacity/1GB,2)}}, Speed, Manufacturer | Format-Table -AutoSize" [cite: 79]
echo.
[cite_start]echo Placa de Vídeo: [cite: 80]
[cite_start]powershell.exe -Command "Get-WmiObject -Class Win32_VideoController | Select-Object Name, @{Name='RAM(MB)';Expression={[math]::Round($_.AdapterRAM/1MB,0)}} | Format-Table -AutoSize" [cite: 80]
echo.
pause
goto SISTEMA

:TASKMGR
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   ABRINDO GERENCIADOR DE TAREFAS                  ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]taskmgr [cite: 82]
goto SISTEMA

:SERVICOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   ABRINDO SERVIÇOS DO WINDOWS                     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]services.msc [cite: 83]
goto SISTEMA

:IMPRESSORAS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                      MENU IMPRESSORAS                             ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Listar Impressoras Instaladas                                 ║
echo ║  [2] Verificar Status das Impressoras                              ║
echo ║  [3] Limpar Fila de Impressão                                      ║
echo ║  [4] Reinstalar Drivers de Impressora                              ║
echo ║  [5] Configurações de Impressora                                   ║
echo ║  [6] Testar Página de Teste                                        ║
echo ║  [7] Corrigir Erro 0x0000011b                                      ║
echo ║  [8] Corrigir Erro 0x00000bcb                                      ║
echo ║  [9] Corrigir Erro 0x00000709                                      ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]set /p impressora_opcao=Digite sua opção: [cite: 90]

if "%impressora_opcao%"=="1" goto LISTAR_IMPRESSORAS
if "%impressora_opcao%"=="2" goto STATUS_IMPRESSORAS
if "%impressora_opcao%"=="3" goto LIMPAR_FILA
if "%impressora_opcao%"=="4" goto REINSTALAR_DRIVERS
if "%impressora_opcao%"=="5" goto CONFIG_IMPRESSORA
if "%impressora_opcao%"=="6" goto TESTE_IMPRESSAO
if "%impressora_opcao%"=="7" goto ERRO11B
if "%impressora_opcao%"=="8" goto ERRO0BCB
if "%impressora_opcao%"=="9" goto ERRO709
if "%impressora_opcao%"=="0" goto MAIN_MENU
goto IMPRESSORAS

:LISTAR_IMPRESSORAS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                 IMPRESSORAS INSTALADAS                            ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]powershell.exe -Command "Get-Printer | Select-Object Name, DriverName, PortName | Format-Table -AutoSize" [cite: 92]
echo.
pause
goto IMPRESSORAS

:STATUS_IMPRESSORAS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                 STATUS DAS IMPRESSORAS                            ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]powershell.exe -Command "Get-Printer | Select-Object Name, PrinterStatus, JobCount | Format-Table -AutoSize" [cite: 94]
echo.
pause
goto IMPRESSORAS

:LIMPAR_FILA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                 LIMPANDO FILA DE IMPRESSÃO                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Parando serviço de spooler... [cite: 96]
net stop spooler
echo.
[cite_start]echo Limpando arquivos da fila... [cite: 96]
del /Q /F %systemroot%\system32\spool\printers\*
echo.
[cite_start]echo Reiniciando serviço de spooler... [cite: 97]
net start spooler
echo.
echo Fila de impressão limpa com sucesso!
pause
goto IMPRESSORAS

:REINSTALAR_DRIVERS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║               GERENCIADOR DE DISPOSITIVOS                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Abrindo Gerenciador de Dispositivos para reinstalar drivers... [cite: 99]
devmgmt.msc
goto IMPRESSORAS

:CONFIG_IMPRESSORA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║               CONFIGURAÇÕES DE IMPRESSORA                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Abrindo Painel de Controle - Impressoras... [cite: 100]
control printers
goto IMPRESSORAS

:TESTE_IMPRESSAO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    TESTE DE IMPRESSÃO                             ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Verificando impressoras disponíveis... [cite: 101]
[cite_start]powershell.exe -Command "Get-Printer | Select-Object Name, Default | Format-Table -AutoSize" [cite: 101]
echo.
[cite_start]echo Escolha uma impressora para testar: [cite: 102]
[cite_start]powershell.exe -Command "$printers = Get-Printer; for($i=0; $i -lt $printers.Count; $i++) { Write-Host \"[$($i+1)] $($printers[$i].Name)\" }" [cite: 102]
echo [0] Voltar
echo.
[cite_start]set /p printer_choice=Digite o número da impressora: [cite: 103]

if "%printer_choice%"=="0" goto IMPRESSORAS

echo.
[cite_start]echo Enviando página de teste... [cite: 104]
powershell.exe -Command "$printers = Get-Printer; if (%printer_choice% -le $printers.Count -and %printer_choice% -gt 0) { $selectedPrinter = $printers[%printer_choice%-1].Name; Write-Host 'Enviando teste para:' $selectedPrinter; Add-Type -AssemblyName System.Drawing; Add-Type -AssemblyName System.Windows.Forms; $doc = New-Object System.Drawing.Printing.PrintDocument; $doc.PrinterSettings.PrinterName = $selectedPrinter; $doc.DocumentName = 'Página de Teste'; $doc.add_PrintPage({ param($sender, $e) $font = New-Object System.Drawing.Font('Arial', 12); $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Black); $e.Graphics.DrawString('=== PÁGINA DE TESTE ===', $font, $brush, 100, 100); $e.Graphics.DrawString('Impressora: ' + $selectedPrinter, $font, $brush, 100, 150); $e.Graphics.DrawString('Data/Hora: ' + (Get-Date), $font, $brush, 100, 200); $e.Graphics.DrawString('Sistema: ' + $env:COMPUTERNAME, $font, $brush, 100, 250); $e.Graphics.DrawString('Usuário: ' + $env:USERNAME, $font, $brush, 100, 300); $e.Graphics.DrawString('Teste realizado com sucesso!', $font, $brush, 100, 350); }); try { $doc.Print(); Write-Host 'Página de teste enviada com sucesso!' } catch { Write-Host 'Erro ao imprimir:' $_.Exception.Message } } else { Write-Host 'Opção inválida!' [cite_start]}" [cite: 104, 105, 106, 107]
echo.
pause
goto IMPRESSORAS

:ERRO11B
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   CORRIGIR ERRO 0x0000011b                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Este erro geralmente ocorre ao tentar conectar com impressoras compartilhadas
echo em rede após atualizações de segurança do Windows.
echo.
echo ATENÇÃO: Esta correção modificará o registro do Windows.
echo Certifique-se de ter privilégios de administrador.
echo.
set /p confirma_11b=Deseja continuar com a correção? (S/N):
if /i "%confirma_11b%" NEQ "S" goto IMPRESSORAS

echo.
[cite_start]echo Aplicando correção para erro 0x0000011b... [cite: 108]
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0 /f
echo.
if errorlevel 1 (
    echo ❌ Erro ao aplicar a correção. Verifique se está executando como Administrador.
) else (
    [cite_start]echo ✅ Erro 0x0000011b corrigido com sucesso! [cite: 109]
    echo.
    [cite_start]echo IMPORTANTE: Reinicie o computador ou o serviço de spooler para aplicar as mudanças. [cite: 109]
    echo.
    set /p reinicia_spooler=Deseja reiniciar o serviço de spooler agora? (S/N)[cite_start]: [cite: 110]
    if /i "!reinicia_spooler!" [cite_start]== "S" ( [cite: 110, 111]
        echo.
        echo Reiniciando serviço de spooler...
        net stop spooler
        net start spooler
        echo ✅ Serviço de spooler reiniciado.
    )
)
echo.
[cite_start]pause [cite: 112]
goto IMPRESSORAS

:ERRO0BCB
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   CORRIGIR ERRO 0x00000bcb                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Este erro ocorre quando há restrições de instalação de drivers de impressora [cite: 113]
[cite_start]echo para usuários não-administradores. [cite: 113]
echo.
[cite_start]echo ATENÇÃO: Esta correção modificará as políticas do sistema. [cite: 114]
echo Certifique-se de ter privilégios de administrador.
echo.
set /p confirma_bcb=Deseja continuar com a correção? (S/N)[cite_start]: [cite: 115]
if /i "%confirma_bcb%" NEQ "S" goto IMPRESSORAS

echo.
[cite_start]echo Aplicando correção para erro 0x00000bcb... [cite: 116]
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v RestrictDriverInstallationToAdministrators /t REG_DWORD /d 0 /f
echo.
[cite_start]if errorlevel 1 ( [cite: 117]
    echo ❌ Erro ao aplicar a correção. [cite_start]Verifique se está executando como Administrador. [cite: 117]
) else (
    [cite_start]echo ✅ Erro 0x00000bcb corrigido com sucesso! [cite: 117]
    echo.
    echo IMPORTANTE: Reinicie o computador para aplicar completamente as mudanças.
    echo.
    set /p reinicia_bcb=Deseja reiniciar o computador agora? (S/N):
    if /i "!reinicia_bcb!" == "S" (
        echo.
        echo Reiniciando o computador em 10 segundos...
        [cite_start]echo Pressione Ctrl+C para cancelar. [cite: 118]
        timeout /t 10
        shutdown /r /t 0
    )
)
echo.
[cite_start]pause [cite: 119]
goto IMPRESSORAS

:ERRO709
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   CORRIGIR ERRO 0x00000709                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Este erro ocorre em problemas de comunicação RPC com impressoras em rede. [cite: 120]
[cite_start]echo A correção força o uso do protocolo Named Pipe para RPC. [cite: 121]
echo.
[cite_start]echo ATENÇÃO: Esta correção modificará as configurações de RPC do sistema. [cite: 122]
echo Certifique-se de ter privilégios de administrador.
echo.
set /p confirma_709=Deseja continuar com a correção? (S/N)[cite_start]: [cite: 123]
if /i "%confirma_709%" NEQ "S" goto IMPRESSORAS

echo.
[cite_start]echo Aplicando correção para erro 0x00000709... [cite: 124]
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC" /v RpcUseNamedPipeProtocol /t REG_DWORD /d 1 /f
echo.
[cite_start]if errorlevel 1 ( [cite: 125]
    echo ❌ Erro ao aplicar a correção. [cite_start]Verifique se está executando como Administrador. [cite: 125]
) else (
    [cite_start]echo ✅ Erro 0x00000709 corrigido com sucesso! [cite: 125]
    echo.
    echo IMPORTANTE: Reinicie o computador ou o serviço de spooler para aplicar as mudanças.
    echo.
    set /p reinicia_709=Deseja reiniciar o serviço de spooler agora? (S/N):
    if /i "!reinicia_709!" == "S" (
        echo.
        echo Reiniciando serviço de spooler...
        [cite_start]net stop spooler [cite: 126]
        net start spooler
        echo ✅ Serviço de spooler reiniciado.
    )
)
echo.
[cite_start]pause [cite: 127]
goto IMPRESSORAS

:LIMPEZA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                        MENU LIMPEZA                               ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Limpeza de Disco (Disk Cleanup)                               ║
echo ║  [2] Limpar Arquivos Temporários                                   ║
echo ║  [3] Limpar Cache do DNS                                           ║
echo ║  [4] Limpar Histórico do Navegador                                 ║
echo ║  [5] Esvaziar Lixeira                                              ║
echo ║  [6] Limpeza Completa do Sistema                                   ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p limpeza_opcao=Digite sua opção:

if "%limpeza_opcao%"=="1" goto DISK_CLEANUP
if "%limpeza_opcao%"=="2" goto LIMPAR_TEMP
if "%limpeza_opcao%"=="3" goto LIMPAR_DNS_CACHE
if "%limpeza_opcao%"=="4" goto LIMPAR_NAVEGADOR
if "%limpeza_opcao%"=="5" goto ESVAZIAR_LIXEIRA
if "%limpeza_opcao%"=="6" goto LIMPEZA_COMPLETA
if "%limpeza_opcao%"=="0" goto MAIN_MENU
goto LIMPEZA

:DISK_CLEANUP
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    LIMPEZA DE DISCO                               ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Abrindo ferramenta de Limpeza de Disco... [cite: 134]
cleanmgr
goto LIMPEZA

:LIMPAR_TEMP
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║               LIMPANDO ARQUIVOS TEMPORÁRIOS                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Removendo arquivos temporários do usuário... [cite: 135]
del /s /q %temp%\*.*
echo.
[cite_start]echo Removendo arquivos temporários do Windows... [cite: 135]
del /s /q %windir%\temp\*.*
echo.
[cite_start]echo Limpeza de arquivos temporários concluída! [cite: 136]
pause
goto LIMPEZA

:LIMPAR_DNS_CACHE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   LIMPANDO CACHE DNS                              ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]ipconfig /flushdns [cite: 137]
echo.
echo Cache DNS limpo com sucesso!
pause
goto LIMPEZA

:LIMPAR_NAVEGADOR
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║               LIMPEZA DE NAVEGADORES                              ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Limpando cache do Chrome... [cite: 139]
taskkill /f /im chrome.exe 2>nul
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" 2>nul
echo.
[cite_start]echo Limpando cache do Edge... [cite: 140]
taskkill /f /im msedge.exe 2>nul
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" 2>nul
echo.
echo Limpeza de navegadores concluída!
[cite_start]pause [cite: 141]
goto LIMPEZA

:ESVAZIAR_LIXEIRA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   ESVAZIANDO LIXEIRA                              ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]powershell.exe -Command "Clear-RecycleBin -Force" [cite: 142]
echo.
echo Lixeira esvaziada com sucesso!
pause
goto LIMPEZA

:LIMPEZA_COMPLETA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   LIMPEZA COMPLETA                                ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Executando limpeza completa do sistema... [cite: 144]
echo.
[cite_start]echo [1/5] Limpando arquivos temporários... [cite: 144]
del /s /q %temp%\*.* 2>nul
del /s /q %windir%\temp\*.* 2>nul
echo.
[cite_start]echo [2/5] Limpando cache DNS... [cite: 145]
ipconfig /flushdns
echo.
[cite_start]echo [3/5] Esvaziando lixeira... [cite: 145]
powershell.exe -Command "Clear-RecycleBin -Force" 2>nul
echo.
[cite_start]echo [4/5] Limpando cache de navegadores... [cite: 146]
taskkill /f /im chrome.exe 2>nul
taskkill /f /im msedge.exe 2>nul
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" 2>nul
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" 2>nul
echo.
[cite_start]echo [5/5] Executando limpeza de disco... [cite: 147]
cleanmgr /sagerun:1
echo.
echo Limpeza completa finalizada!
pause
goto LIMPEZA

:UTILITARIOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                      MENU UTILITÁRIOS                             ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Editor do Registro (RegEdit)                                  ║
echo ║  [2] Configurações do Sistema (MSConfig)                           ║
echo ║  [3] Monitor de Recursos                                           ║
echo ║  [4] Informações do Sistema (MSInfo32)                             ║
echo ║  [5] Prompt de Comando como Admin                                  ║
echo ║  [6] PowerShell como Admin                                         ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]set /p util_opcao=Digite sua opção: [cite: 153]

if "%util_opcao%"=="1" goto REGEDIT
if "%util_opcao%"=="2" goto MSCONFIG
if "%util_opcao%"=="3" goto MONITOR_RECURSOS
if "%util_opcao%"=="4" goto MSINFO32
if "%util_opcao%"=="5" goto CMD_ADMIN
if "%util_opcao%"=="6" goto POWERSHELL_ADMIN
if "%util_opcao%"=="0" goto MAIN_MENU
goto UTILITARIOS

:REGEDIT
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                 ABRINDO EDITOR DO REGISTRO                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo ATENÇÃO: Seja cuidadoso ao editar o registro! [cite: 155]
pause
regedit
goto UTILITARIOS

:MSCONFIG
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║             ABRINDO CONFIGURAÇÕES DO SISTEMA                      ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]msconfig [cite: 157]
goto UTILITARIOS

:MONITOR_RECURSOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                 ABRINDO MONITOR DE RECURSOS                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]resmon [cite: 158]
goto UTILITARIOS

:MSINFO32
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║               ABRINDO INFORMAÇÕES DO SISTEMA                      ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]msinfo32 [cite: 159]
goto UTILITARIOS

:CMD_ADMIN
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║            ABRINDO PROMPT DE COMANDO COMO ADMIN                   ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]powershell.exe -Command "Start-Process cmd -Verb runAs" [cite: 160]
goto UTILITARIOS

:DOMINIO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         MENU DOMÍNIO                              ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Ingressar no Domínio                                          ║
echo ║  [2] Verificar Status do Domínio                                   ║
echo ║  [3] Sair do Domínio                                               ║
echo ║  [4] Informações do Computador                                     ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]set /p dominio_opcao=Digite sua opção: [cite: 165]

if "%dominio_opcao%"=="1" goto INGRESSAR_DOMINIO
if "%dominio_opcao%"=="2" goto STATUS_DOMINIO
if "%dominio_opcao%"=="3" goto SAIR_DOMINIO
if "%dominio_opcao%"=="4" goto INFO_COMPUTADOR
if "%dominio_opcao%"=="0" goto MAIN_MENU
goto DOMINIO

:INGRESSAR_DOMINIO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                      INGRESSAR NO DOMÍNIO                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Escolha o domínio para ingressar: [cite: 167]
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                                                                    ║
echo ║  [1] Dominio A                                                     ║
echo ║  [2] Dominio B                                                     ║
echo ║  [3] Dominio C                                                     ║
echo ║  [4] Dominio D                                                     ║
echo ║  [0] Voltar                                                        ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]set /p dominio_escolha=Digite sua opção: [cite: 172]

if "%dominio_escolha%"=="1" goto INGRESSAR_DOMINIO_A
if "%dominio_escolha%"=="2" goto INGRESSAR_DOMINIO_B
if "%dominio_escolha%"=="3" goto INGRESSAR_DOMINIO_C
if "%dominio_escolha%"=="4" goto INGRESSAR_DOMINIO_D
if "%dominio_escolha%"=="0" goto DOMINIO
goto INGRESSAR_DOMINIO

:INGRESSAR_DOMINIO_A
set "DOMAIN_NAME=dominioA.local"
set "OU_PATH=OU=Computadores,DC=dominioA,DC=local"
goto EXECUTAR_INGRESSO

:INGRESSAR_DOMINIO_B
set "DOMAIN_NAME=dominioB.local"
set "OU_PATH=OU=Computadores,DC=dominioB,DC=local"
goto EXECUTAR_INGRESSO

:INGRESSAR_DOMINIO_C
set "DOMAIN_NAME=dominioC.local"
set "OU_PATH=OU=Computadores,DC=dominioC,DC=local"
goto EXECUTAR_INGRESSO

:INGRESSAR_DOMINIO_D
set "DOMAIN_NAME=dominioD.local"
set "OU_PATH=OU=Computadores,DC=dominioD,DC=local"
goto EXECUTAR_INGRESSO

:EXECUTAR_INGRESSO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                      INGRESSAR NO DOMÍNIO                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo ATENÇÃO: Esta operação irá reiniciar o computador após o ingresso! [cite: 174]
echo.
[cite_start]echo Configurações selecionadas: [cite: 175]
echo - Domínio: %DOMAIN_NAME%
echo - OU: %OU_PATH%
echo.
set /p confirma=Deseja continuar? (S/N)[cite_start]: [cite: 175, 176]
if /i "%confirma%" NEQ "S" goto DOMINIO

echo.
echo Iniciando processo de ingresso no domínio %DOMAIN_NAME%...
echo.
powershell.exe -Command "& { $DomainName = '%DOMAIN_NAME%'; $OUPath = '%OU_PATH%'; Write-Host '==========================' -ForegroundColor Cyan; Write-Host '     INGRESSAR DOMÍNIO' -ForegroundColor Cyan; Write-Host '==========================' -ForegroundColor Cyan; Write-Host; $Credential = Get-Credential -Message \"Digite as credenciais de um usuário com permissão para ingressar no domínio $DomainName\"; if ($Credential -eq $null) { Write-Host '❌ Operação cancelada pelo usuário.' -ForegroundColor Red; return }; $ComputerSystem = Get-WmiObject Win32_ComputerSystem; if ($ComputerSystem.PartOfDomain) { Write-Host \"💡 Este computador já faz parte do domínio: $($ComputerSystem.Domain)\" -ForegroundColor Yellow; return }; try { if ($OUPath -ne '') { Add-Computer -DomainName $DomainName -Credential $Credential -OUPath $OUPath -ErrorAction Stop } else { Add-Computer -DomainName $DomainName -Credential $Credential -ErrorAction Stop }; Write-Host '✅ Computador adicionado ao domínio com sucesso!' [cite_start]-ForegroundColor Green; Write-Host; Write-Host '🔄 O computador será reiniciado em 10 segundos...' -ForegroundColor Yellow; Start-Sleep -Seconds 10; Restart-Computer -Force } catch { Write-Host \"❌ Erro ao ingressar no domínio: $_\" -ForegroundColor Red; Write-Host; Write-Host 'Pressione qualquer tecla para continuar...'; Read-Host } }" [cite: 177, 178, 179]

pause
goto DOMINIO

:STATUS_DOMINIO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    STATUS DO DOMÍNIO                              ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]powershell.exe -Command "& { $ComputerSystem = Get-WmiObject Win32_ComputerSystem; Write-Host 'Nome do Computador:' $ComputerSystem.Name -ForegroundColor Green; Write-Host 'Workgroup/Domínio:' $ComputerSystem.Workgroup -ForegroundColor Green; if ($ComputerSystem.PartOfDomain) { Write-Host '✅ Status: Membro do Domínio' -ForegroundColor Green; Write-Host 'Domínio:' $ComputerSystem.Domain -ForegroundColor Green; try { $Domain = Get-WmiObject -Class Win32_NTDomain; Write-Host 'Controlador de Domínio:' $Domain.DomainControllerName -ForegroundColor Green } catch { Write-Host 'Não foi possível obter informações do DC' -ForegroundColor Yellow } } else { Write-Host '⚠️  Status: Não é membro de domínio (Workgroup)' -ForegroundColor Yellow } }" [cite: 181]
echo.
[cite_start]pause [cite: 182]
goto DOMINIO

:SAIR_DOMINIO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                       SAIR DO DOMÍNIO                             ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo ATENÇÃO: Esta operação irá remover o computador do domínio! [cite: 183]
echo O computador será reiniciado após a operação.
echo.
set /p confirma_saida=Deseja realmente sair do domínio? (S/N)[cite_start]: [cite: 184]
if /i "%confirma_saida%" NEQ "S" goto DOMINIO

echo.
powershell.exe -Command "& { $ComputerSystem = Get-WmiObject Win32_ComputerSystem; if (-not $ComputerSystem.PartOfDomain) { Write-Host '💡 Este computador não está em um domínio.' -ForegroundColor Yellow; return }; Write-Host 'Removendo do domínio:' $ComputerSystem.Domain -ForegroundColor Yellow; $Credential = Get-Credential -Message 'Digite as credenciais de um usuário com permissão para remover computadores do domínio'; if ($Credential -eq $null) { Write-Host '❌ Operação cancelada pelo usuário.' [cite_start]-ForegroundColor Red; return }; try { Remove-Computer -Credential $Credential -PassThru -Verbose -Restart -Force } catch { Write-Host \"❌ Erro ao sair do domínio: $_\" -ForegroundColor Red } }" [cite: 185, 186, 187]
pause
goto DOMINIO

:INFO_COMPUTADOR
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                 INFORMAÇÕES DO COMPUTADOR                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]powershell.exe -Command "& { $ComputerSystem = Get-WmiObject Win32_ComputerSystem; $OS = Get-WmiObject Win32_OperatingSystem; Write-Host '=== INFORMAÇÕES GERAIS ===' -ForegroundColor Cyan; Write-Host 'Nome do Computador:' $ComputerSystem.Name; Write-Host 'Sistema Operacional:' $OS.Caption; Write-Host 'Versão:' $OS.Version; Write-Host 'Usuário Logado:' $ComputerSystem.UserName; Write-Host; Write-Host '=== INFORMAÇÕES DE DOMÍNIO ===' -ForegroundColor Cyan; if ($ComputerSystem.PartOfDomain) { Write-Host 'Status: Membro do Domínio' -ForegroundColor Green; Write-Host 'Domínio:' $ComputerSystem.Domain; Write-Host 'Função:' $ComputerSystem.DomainRole } else { Write-Host 'Status: Workgroup' -ForegroundColor Yellow; Write-Host 'Workgroup:' $ComputerSystem.Workgroup } }" [cite: 189]
echo.
[cite_start]pause [cite: 190]
goto DOMINIO

:DRIVERS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         MENU DRIVERS                              ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Fazer Backup dos Drivers                                      ║
echo ║  [2] Restaurar Drivers do Backup                                   ║
echo ║  [3] Listar Drivers Instalados                                     ║
echo ║  [4] Verificar Drivers sem Assinatura Digital                      ║
echo ║  [5] Atualizar Drivers via Windows Update                          ║
echo ║  [6] Exportar Lista de Drivers para Arquivo                        ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]set /p driver_opcao=Digite sua opção: [cite: 195]

if "%driver_opcao%"=="1" goto BACKUP_DRIVERS
if "%driver_opcao%"=="2" goto RESTAURAR_DRIVERS
if "%driver_opcao%"=="3" goto LISTAR_DRIVERS
if "%driver_opcao%"=="4" goto VERIFICAR_DRIVERS_NAO_ASSINADOS
if "%driver_opcao%"=="5" goto ATUALIZAR_DRIVERS
if "%driver_opcao%"=="6" goto EXPORTAR_LISTA_DRIVERS
if "%driver_opcao%"=="0" goto MAIN_MENU
goto DRIVERS

:BACKUP_DRIVERS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                     BACKUP DOS DRIVERS                            ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Este processo irá fazer backup de todos os drivers instalados. [cite: 197]
echo.
[cite_start]set /p pasta_backup=Digite o caminho para salvar o backup (ex: C:\DriverBackup): [cite: 198]

if "%pasta_backup%"=="" (
    set pasta_backup=C:\DriverBackup
    echo Usando caminho padrão: C:\DriverBackup
)

echo.
[cite_start]echo Criando pasta de backup: %pasta_backup% [cite: 199]
if not exist "%pasta_backup%" (
    mkdir "%pasta_backup%" 2>nul
    if errorlevel 1 (
        echo ❌ Erro ao criar pasta de backup.
        pause
        goto DRIVERS
    )
)

echo.
[cite_start]echo ✅ Iniciando backup dos drivers... [cite: 200]
[cite_start]echo Aguarde, este processo pode demorar alguns minutos... [cite: 200]
echo.
[cite_start]:: Fazer backup usando DISM [cite: 201]
[cite_start]dism /online /export-driver /destination:"%pasta_backup%" [cite: 201]

if errorlevel 1 (
    echo.
    echo ❌ Erro durante o backup com DISM. Tentando método alternativo...
    echo.
    :: Método alternativo usando PowerShell
    powershell.exe -Command "Export-WindowsDriver -Online -Destination '%pasta_backup%'"
    
    if errorlevel 1 (
        echo ❌ Erro no backup dos drivers.
        echo Verifique se você tem permissões administrativas.
    ) else (
        [cite_start]echo ✅ Backup dos drivers concluído com sucesso! [cite: 202]
        [cite_start]echo Localização: %pasta_backup% [cite: 202]
    )
) else (
    echo.
    echo ✅ Backup dos drivers concluído com sucesso!
    echo Localização: %pasta_backup%
    
    :: Mostrar estatísticas do backup
    echo.
    echo ═══════════════════════════════════════════════════════════════════
    echo Estatísticas do backup:
    for /f %%i in ('dir "%pasta_backup%" /s /b *.inf ^| find /c /v ""') do echo Total de drivers: %%i arquivos
    [cite_start]echo. [cite: 203]
)

pause
goto DRIVERS

:RESTAURAR_DRIVERS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   RESTAURAR DRIVERS DO BACKUP                     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo ⚠️  ATENÇÃO: Esta operação irá instalar drivers do backup. [cite: 204]
echo Certifique-se de que o backup seja confiável.
echo.
[cite_start]set /p pasta_restaurar=Digite o caminho do backup dos drivers: [cite: 205]

if "%pasta_restaurar%"=="" (
    echo ❌ Caminho não informado.
    pause
    goto DRIVERS
)

if not exist "%pasta_restaurar%" (
    echo ❌ Pasta não encontrada: %pasta_restaurar%
    pause
    goto DRIVERS
)

echo.
set /p confirma_restaurar=Deseja continuar com a restauração? (S/N)[cite_start]: [cite: 206]
if /i "%confirma_restaurar%" NEQ "S" goto DRIVERS

echo.
[cite_start]echo Restaurando drivers do backup... [cite: 207]
pnputil /add-driver "%pasta_restaurar%\*.inf" /subdirs /install

if errorlevel 1 (
    echo ❌ Erro durante a restauração dos drivers.
) else (
    echo ✅ Drivers restaurados com sucesso!
    echo Recomenda-se reiniciar o computador.
)

pause
goto DRIVERS

:LISTAR_DRIVERS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    DRIVERS INSTALADOS                             ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Listando drivers instalados no sistema... [cite: 209]
echo.

:: Listar drivers usando PowerShell
[cite_start]powershell.exe -Command "Get-WindowsDriver -Online | Select-Object Driver, Date, Version, ClassName | Sort-Object ClassName | Format-Table -AutoSize" [cite: 209]

echo.
[cite_start]echo ═══════════════════════════════════════════════════════════════════ [cite: 210]
[cite_start]echo Drivers de terceiros (não Microsoft): [cite: 210]
echo.
[cite_start]powershell.exe -Command "Get-WindowsDriver -Online | Where-Object {$_.ProviderName -ne 'Microsoft'} | Select-Object Driver, ProviderName, Date, Version | Format-Table -AutoSize" [cite: 210]

pause
goto DRIVERS

:VERIFICAR_DRIVERS_NAO_ASSINADOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║              VERIFICANDO DRIVERS SEM ASSINATURA                   ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Verificando drivers sem assinatura digital... [cite: 212]
echo.

:: Verificar drivers não assinados
[cite_start]powershell.exe -Command "Get-WindowsDriver -Online | Where-Object {$_.DigitalSigner -eq ''} | Select-Object Driver, ProviderName, Date, Version | Format-Table -AutoSize" [cite: 212]

echo.
[cite_start]echo ═══════════════════════════════════════════════════════════════════ [cite: 213]
[cite_start]echo Verificação de integridade dos drivers do sistema: [cite: 213]
echo.
verifier /query

pause
goto DRIVERS

:ATUALIZAR_DRIVERS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║               ATUALIZAR DRIVERS VIA WINDOWS UPDATE                ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Iniciando busca por atualizações de drivers... [cite: 215]
echo.

:: Tentar atualizar drivers via Windows Update
[cite_start]powershell.exe -Command "Start-Process 'ms-settings:windowsupdate-opcionalsearch' -Wait" [cite: 215]

echo.
[cite_start]echo Verificando se há drivers disponíveis para atualização... [cite: 216]
pnputil /enum-drivers

echo.
[cite_start]echo ✅ Processo concluído! [cite: 216]
[cite_start]echo Verifique o Windows Update para drivers opcionais. [cite: 217]

pause
goto DRIVERS

:EXPORTAR_LISTA_DRIVERS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                EXPORTAR LISTA DE DRIVERS                          ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Escolha onde salvar o arquivo: [cite: 219]
echo.
echo [1] Desktop do usuário atual
echo [2] Pasta Documentos
echo [3] Pasta personalizada
echo [4] Pasta atual do script
echo.
[cite_start]set /p local_opcao=Digite sua opção (1-4): [cite: 220]

if "%local_opcao%"=="1" (
    set "pasta_destino=%USERPROFILE%\Desktop"
    set "local_nome=Desktop"
) else if "%local_opcao%"=="2" (
    set "pasta_destino=%USERPROFILE%\Documents"
    set "local_nome=Documentos"
) else if "%local_opcao%"=="3" (
    set /p pasta_destino=Digite o caminho completo da pasta:
    set "local_nome=pasta personalizada"
    if not exist "%pasta_destino%" (
        echo ❌ Pasta não encontrada: %pasta_destino%
        pause
        goto DRIVERS
    )
) else (
    [cite_start]set "pasta_destino=%~dp0" [cite: 221]
    [cite_start]set "local_nome=pasta do script" [cite: 221]
)

echo.
[cite_start]set /p arquivo_export=Digite o nome do arquivo (ex: drivers_list.txt): [cite: 222]
if "%arquivo_export%"=="" set arquivo_export=drivers_list_%date:~6,4%-%date:~3,2%-%date:~0,2%.txt

set "caminho_completo=%pasta_destino%\%arquivo_export%"

echo.
[cite_start]echo Exportando lista de drivers para: [cite: 223]
echo Local: %local_nome%
echo Arquivo: %caminho_completo%
echo.
[cite_start]:: Exportar lista detalhada [cite: 224]
[cite_start]echo === LISTA DE DRIVERS INSTALADOS === > "%caminho_completo%" [cite: 224]
[cite_start]echo Data de geração: %date% %time% >> "%caminho_completo%" [cite: 224]
[cite_start]echo Computador: %COMPUTERNAME% >> "%caminho_completo%" [cite: 224]
[cite_start]echo Usuário: %USERNAME% >> "%caminho_completo%" [cite: 224]
echo.
>> [cite_start]"%caminho_completo%" [cite: 225]

powershell.exe -Command "Get-WindowsDriver -Online | Select-Object Driver, ProviderName, Date, Version, ClassName | Sort-Object ClassName | Format-Table -AutoSize | Out-String -Width 120" >> "%caminho_completo%"

echo.
>> [cite_start]"%caminho_completo%" [cite: 226]
[cite_start]echo === DRIVERS DE TERCEIROS === >> "%caminho_completo%" [cite: 226]
echo. >> [cite_start]"%caminho_completo%" [cite: 226]

powershell.exe -Command "Get-WindowsDriver -Online | Where-Object {$_.ProviderName -ne 'Microsoft'} | Select-Object Driver, ProviderName, Date, Version | Format-Table -AutoSize | Out-String -Width 120" >> "%caminho_completo%"

if errorlevel 1 (
    echo ❌ Erro ao exportar lista de drivers.
) else (
    echo ✅ Lista de drivers exportada com sucesso!
    echo.
    echo 📄 Arquivo salvo em: %caminho_completo%
    echo 📁 Para abrir a pasta: explorer "%pasta_destino%"
    echo.
    [cite_start]set /p abrir_pasta=Deseja abrir a pasta onde foi salvo? (S/N): [cite: 227]
    [cite_start]if /i "!abrir_pasta!"=="S" explorer "%pasta_destino%" [cite: 227]
)

pause
goto DRIVERS

:POWERSHELL_ADMIN
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║              ABRINDO POWERSHELL COMO ADMIN                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]powershell.exe -Command "Start-Process powershell -Verb runAs" [cite: 229]
goto UTILITARIOS

:INSTALAR_PROGRAMAS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    INSTALAR PROGRAMAS                             ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Google Chrome                                                 ║
echo ║  [2] Mozilla Firefox                                               ║
echo ║  [3] Adobe Reader                                                  ║
echo ║  [4] Foxit Reader                                                  ║
echo ║  [5] Google Drive                                                  ║
echo ║  [6] LibreOffice                                                   ║
echo ║  [7] CrystalDiskInfo                                               ║
echo ║  [8] CrystalDiskMark                                               ║
echo ║  [9] CPU-Z                                                         ║
echo ║  [10] Instalar Todos                                               ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]set /p programa_opcao=Digite sua opção: [cite: 237]

if "%programa_opcao%"=="1" goto INSTALAR_CHROME
if "%programa_opcao%"=="2" goto INSTALAR_FIREFOX
if "%programa_opcao%"=="3" goto INSTALAR_ADOBE
if "%programa_opcao%"=="4" goto INSTALAR_FOXIT
if "%programa_opcao%"=="5" goto INSTALAR_GDRIVE
if "%programa_opcao%"=="6" goto INSTALAR_LIBREOFFICE
if "%programa_opcao%"=="7" goto INSTALAR_CRYSTALDISKINFO
if "%programa_opcao%"=="8" goto INSTALAR_CRYSTALDISKMARK
if "%programa_opcao%"=="9" goto INSTALAR_CPUZ
if "%programa_opcao%"=="10" goto INSTALAR_TODOS
if "%programa_opcao%"=="0" goto MAIN_MENU
goto INSTALAR_PROGRAMAS

:INSTALAR_CHROME
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    INSTALANDO GOOGLE CHROME                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Verificando Winget... [cite: 239]
winget --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Winget não está disponível neste sistema.
    echo Por favor, instale o App Installer da Microsoft Store.
    pause
    goto INSTALAR_PROGRAMAS
)
echo ✅ Winget disponível. [cite_start]Instalando Google Chrome... [cite: 239, 240]
winget install Google.Chrome --accept-package-agreements --accept-source-agreements
echo.
if errorlevel 1 (
    echo ❌ Erro na instalação do Google Chrome.
) else (
    echo ✅ Google Chrome instalado com sucesso!
)
pause
goto INSTALAR_PROGRAMAS

:INSTALAR_FIREFOX
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    INSTALANDO MOZILLA FIREFOX                     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Instalando Mozilla Firefox... [cite: 242]
winget install Mozilla.Firefox --accept-package-agreements --accept-source-agreements
echo.
if errorlevel 1 (
    echo ❌ Erro na instalação do Mozilla Firefox.
) else (
    echo ✅ Mozilla Firefox instalado com sucesso!
)
pause
goto INSTALAR_PROGRAMAS

:INSTALAR_ADOBE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    INSTALANDO ADOBE READER                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Instalando Adobe Acrobat Reader... [cite: 244]
winget install Adobe.Acrobat.Reader.64-bit --accept-package-agreements --accept-source-agreements
echo.
if errorlevel 1 (
    echo ❌ Erro na instalação do Adobe Reader.
) else (
    echo ✅ Adobe Reader instalado com sucesso!
)
pause
goto INSTALAR_PROGRAMAS

:INSTALAR_FOXIT
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                     INSTALANDO FOXIT READER                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Instalando Foxit Reader... [cite: 246]
winget install Foxit.FoxitReader --accept-package-agreements --accept-source-agreements
echo.
if errorlevel 1 (
    echo ❌ Erro na instalação do Foxit Reader.
) else (
    echo ✅ Foxit Reader instalado com sucesso!
)
pause
goto INSTALAR_PROGRAMAS

:INSTALAR_GDRIVE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    INSTALANDO GOOGLE DRIVE                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Instalando Google Drive... [cite: 248]
winget install Google.GoogleDrive --accept-package-agreements --accept-source-agreements
echo.
if errorlevel 1 (
    echo ❌ Erro na instalação do Google Drive.
) else (
    echo ✅ Google Drive instalado com sucesso!
)
pause
goto INSTALAR_PROGRAMAS

:INSTALAR_LIBREOFFICE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    INSTALANDO LIBREOFFICE                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Instalando LibreOffice... [cite: 250]
winget install TheDocumentFoundation.LibreOffice --accept-package-agreements --accept-source-agreements
echo.
if errorlevel 1 (
    echo ❌ Erro na instalação do LibreOffice.
) else (
    echo ✅ LibreOffice instalado com sucesso!
)
pause
goto INSTALAR_PROGRAMAS

:INSTALAR_CRYSTALDISKINFO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   INSTALANDO CRYSTALDISKINFO                      ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Instalando CrystalDiskInfo... [cite: 252]
winget install CrystalDewWorld.CrystalDiskInfo --accept-package-agreements --accept-source-agreements
echo.
if errorlevel 1 (
    echo ❌ Erro na instalação do CrystalDiskInfo.
) else (
    echo ✅ CrystalDiskInfo instalado com sucesso!
)
pause
goto INSTALAR_PROGRAMAS

:INSTALAR_CRYSTALDISKMARK
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   INSTALANDO CRYSTALDISKMARK                      ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Instalando CrystalDiskMark... [cite: 254]
winget install CrystalDewWorld.CrystalDiskMark --accept-package-agreements --accept-source-agreements
echo.
if errorlevel 1 (
    echo ❌ Erro na instalação do CrystalDiskMark.
) else (
    echo ✅ CrystalDiskMark instalado com sucesso!
)
pause
goto INSTALAR_PROGRAMAS

:INSTALAR_CPUZ
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                      INSTALANDO CPU-Z                             ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Instalando CPU-Z... [cite: 256]
winget install CPUID.CPU-Z --accept-package-agreements --accept-source-agreements
echo.
if errorlevel 1 (
    echo ❌ Erro na instalação do CPU-Z.
) else (
    echo ✅ CPU-Z instalado com sucesso!
)
pause
goto INSTALAR_PROGRAMAS

:INSTALAR_TODOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   INSTALAÇÃO EM LOTE                              ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo ATENÇÃO: Esta opção irá instalar todos os programas listados. [cite: 258]
echo O processo pode demorar alguns minutos.
echo.
set /p confirma_todos=Deseja continuar? (S/N)[cite_start]: [cite: 259]
if /i "%confirma_todos%" NEQ "S" goto INSTALAR_PROGRAMAS

echo.
[cite_start]echo Verificando Winget... [cite: 260]
winget --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Winget não está disponível neste sistema.
    echo Por favor, instale o App Installer da Microsoft Store.
    pause
    goto INSTALAR_PROGRAMAS
)

echo ✅ Winget disponível. [cite_start]Iniciando instalação em lote... [cite: 260, 261]
echo.
[cite_start]echo [1/9] Instalando Google Chrome... [cite: 261]
winget install Google.Chrome --accept-package-agreements --accept-source-agreements --silent
echo.
[cite_start]echo [2/9] Instalando Mozilla Firefox... [cite: 262]
winget install Mozilla.Firefox --accept-package-agreements --accept-source-agreements --silent
echo.
echo [3/9] Instalando Adobe Reader...
winget install Adobe.Acrobat.Reader.64-bit --accept-package-agreements --accept-source-agreements --silent
echo.
[cite_start]echo [4/9] Instalando Foxit Reader... [cite: 263]
winget install Foxit.FoxitReader --accept-package-agreements --accept-source-agreements --silent
echo.
echo [5/9] Instalando Google Drive...
winget install Google.GoogleDrive --accept-package-agreements --accept-source-agreements --silent
echo.
[cite_start]echo [6/9] Instalando LibreOffice... [cite: 264]
winget install TheDocumentFoundation.LibreOffice --accept-package-agreements --accept-source-agreements --silent
echo.
echo [7/9] Instalando CrystalDiskInfo...
winget install CrystalDewWorld.CrystalDiskInfo --accept-package-agreements --accept-source-agreements --silent
echo.
[cite_start]echo [8/9] Instalando CrystalDiskMark... [cite: 265]
winget install CrystalDewWorld.CrystalDiskMark --accept-package-agreements --accept-source-agreements --silent
echo.
echo [9/9] Instalando CPU-Z...
winget install CPUID.CPU-Z --accept-package-agreements --accept-source-agreements --silent
echo.
[cite_start]echo ╔════════════════════════════════════════════════════════════════════╗ [cite: 266]
[cite_start]echo ║                 INSTALAÇÃO EM LOTE CONCLUÍDA                      ║ [cite: 266]
[cite_start]echo ╚════════════════════════════════════════════════════════════════════╝ [cite: 266]
echo.
[cite_start]echo ✅ Processo de instalação finalizado! [cite: 267]
echo Verifique se todos os programas foram instalados corretamente.
pause
goto INSTALAR_PROGRAMAS

:SAIR
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   OBRIGADO POR USAR O SISTEMA!                    [cite_start]║ [cite: 285]
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
pause
exit
:DISM_SCAN
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║     ANALISAR E REPARAR ARQUIVOS ESSENCIAIS (DISM)                 ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Executando DISM para reparar arquivos corrompidos... [cite: 287]
echo ATENÇÃO: Este processo pode demorar vários minutos.
echo.
DISM.exe /Online /Cleanup-image /Restorehealth
echo.
[cite_start]pause [cite: 288]
goto SISTEMA

:MEMORIA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    VERIFICAÇÃO DE MEMÓRIA                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Este processo irá reiniciar o computador e iniciar o diagnóstico de memória. [cite: 289]
echo.
set /p confirma_memoria=Deseja continuar com a verificação de memória? (S/N)[cite_start]: [cite: 290]
if /i "%confirma_memoria%" NEQ "S" goto SISTEMA

echo.
[cite_start]echo Iniciando ferramenta de verificação de memória... [cite: 291]
mdsched
goto SISTEMA


:DISCO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                           MENU DISCO                              ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Informações do Disco                                          ║
echo ║  [2] Desfragmentar Disco                                           ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]set /p disco_opcao=Digite sua opção: [cite: 295]

if "%disco_opcao%"=="1" goto INFO_DISCO
if "%disco_opcao%"=="2" goto DEFRAG_DISCO
if "%disco_opcao%"=="0" goto MAIN_MENU
goto DISCO

:INFO_DISCO
cls
echo.
echo ════════════════════════════════════════════════════════════════════
echo ║                   INFORMAÇÕES DO DISCO                            ║
echo ════════════════════════════════════════════════════════════════════
echo.
[cite_start]echo Discos Físicos: [cite: 297]
echo.
[cite_start]powershell.exe -Command "Get-PhysicalDisk | Select-Object @{Name='Nome'; Expression={$_.FriendlyName}}, @{Name='Tipo de Mídia'; Expression={$_.MediaType}}, @{Name='Tamanho (GB)'; Expression={[math]::Round($_.Size / 1GB, 2)} }, @{Name='Número de Série'; Expression={$_.SerialNumber} } | Format-Table -AutoSize -Wrap" [cite: 297]
echo.
[cite_start]echo Volumes e Partições: [cite: 298]
echo.
[cite_start]powershell.exe -Command "Get-Volume | Where-Object { $_.DriveLetter } | Select-Object @{Name='Letra da Unidade'; Expression={$_.DriveLetter}}, @{Name='Rótulo'; Expression={$_.FileSystemLabel}}, @{Name='Sistema de Arquivos'; Expression={$_.FileSystem}}, @{Name='Espaço Livre (GB)'; Expression={[math]::Round($_.SizeRemaining / 1GB, 2)} }, @{Name='Tamanho Total (GB)'; Expression={[math]::Round($_.Size / 1GB, 2)} } | Format-Table -AutoSize -Wrap" [cite: 298]
echo.
[cite_start]pause [cite: 299]
goto DISCO


:DEFRAG_DISCO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                  DESFRAGMENTAR DISCO                              ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
[cite_start]echo Discos disponíveis: [cite: 300]
[cite_start]powershell.exe -Command "Get-Volume | Where-Object { $_.DriveLetter } | Select-Object DriveLetter, FileSystemLabel | Format-Table -AutoSize" [cite: 300]
echo.
[cite_start]set /p letra_disco=Digite a letra do disco a ser desfragmentado (ex: C): [cite: 301]
defrag %letra_disco%: /U /V
echo.
pause
goto DISCO
```
