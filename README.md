# Menu de Suporte Técnico - Ferramenta de Automação em Batch

Um script de automação completo para diagnóstico, manutenção e otimização de sistemas Windows, projetado para técnicos de TI e usuários avançados.

 \#\# 📝 Descrição

Esta ferramenta é um script de lote (`.bat`) que fornece uma interface de menu de texto para executar uma vasta gama de tarefas de suporte técnico. Ele automatiza comandos comuns e complexos do Windows, utilizando uma combinação de `CMD` e `PowerShell` para oferecer funcionalidades que vão desde a limpeza de disco e diagnóstico de rede até o gerenciamento de drivers e a instalação de softwares essenciais.

## ✨ Funcionalidades Principais

  * [cite\_start]**Diagnóstico de Sistema**: Verifique a integridade de arquivos do sistema (`SFC`, `DISM`), cheque o disco em busca de erros (`CHKDSK`) e analise a memória RAM[cite: 65, 66, 67].
  * [cite\_start]**Gerenciamento de Rede**: Realize diagnósticos, resete configurações TCP/IP, limpe o cache DNS e gerencie o Firewall do Windows[cite: 12, 13, 15].
  * [cite\_start]**Manutenção de Disco**: Obtenha informações detalhadas sobre os discos e realize desfragmentação[cite: 292, 293].
  * [cite\_start]**Solução de Problemas de Impressora**: Limpe a fila de impressão, gerencie drivers e aplique correções para erros comuns de rede (`0x0000011b`, `0x00000bcb`, `0x00000709`)[cite: 85, 87, 88].
  * [cite\_start]**Gerenciamento de Drivers**: Faça backup, restaure, liste e exporte os drivers do sistema[cite: 191, 192, 193].
  * [cite\_start]**Instalação de Software**: Automatize a instalação de programas essenciais usando `winget`[cite: 7].
  * [cite\_start]**Utilitários de Sistema**: Acesso rápido a ferramentas como `RegEdit`, `MSConfig`, Monitor de Recursos e Prompt de Comando como Administrador[cite: 149, 150, 151].
  * [cite\_start]**Gerenciamento de Domínio**: Facilita o ingresso, a saída e a verificação de status de um computador em um domínio do Active Directory[cite: 161, 162, 163].

## 📂 Estrutura do Menu

A ferramenta é organizada em menus e submenus para fácil navegação.

\<details\>
\<summary\>\<strong\>Ver Estrutura Completa do Menu\</strong\>\</summary\>

  * [cite\_start]**[1] Sistema** [cite: 2]

      * [cite\_start]`[1]` Informações do Sistema [cite: 64]
      * [cite\_start]`[2]` Analisar e Reparar Arquivos Essenciais (DISM) [cite: 65]
      * [cite\_start]`[3]` Verificar Integridade dos Arquivos (SFC) [cite: 65]
      * [cite\_start]`[4]` Verificar Disco (CHKDSK) [cite: 66]
      * [cite\_start]`[5]` Informações de Hardware [cite: 66]
      * [cite\_start]`[6]` Gerenciador de Tarefas [cite: 66]
      * [cite\_start]`[7]` Serviços do Windows [cite: 67]
      * [cite\_start]`[8]` Verificar Memória (mdsched) [cite: 67]

  * [cite\_start]**[2] Rede** [cite: 3]

      * [cite\_start]`[1]` Diagnóstico de Rede [cite: 12]
      * [cite\_start]`[2]` Resetar Configurações TCP/IP [cite: 13]
      * [cite\_start]`[3]` Flush DNS [cite: 13]
      * [cite\_start]`[4]` Teste de Conectividade [cite: 14]
      * [cite\_start]`[5]` Informações de Rede [cite: 14]
      * [cite\_start]`[6]` Verificar Interfaces de Rede Ativas e Velocidade [cite: 14]
      * [cite\_start]`[7]` Ativar/Desativar Firewall [cite: 15]
          * [cite\_start]Verificar Status do Firewall [cite: 19]
          * [cite\_start]Ativar/Desativar para Todos os Perfis [cite: 19, 20]
          * [cite\_start]Ativar por Perfil (Pública, Privada, Domínio) [cite: 20, 21]
          * [cite\_start]Restaurar Padrões do Firewall [cite: 21]

  * [cite\_start]**[3] Disco** [cite: 4]

      * [cite\_start]`[1]` Informações do Disco [cite: 292]
      * [cite\_start]`[2]` Desfragmentar Disco [cite: 293]

  * [cite\_start]**[4] Impressoras** [cite: 4]

      * [cite\_start]`[1]` Listar Impressoras Instaladas [cite: 84]
      * [cite\_start]`[2]` Verificar Status das Impressoras [cite: 85]
      * [cite\_start]`[3]` Limpar Fila de Impressão [cite: 85]
      * [cite\_start]`[4]` Reinstalar Drivers de Impressora [cite: 85]
      * [cite\_start]`[5]` Configurações de Impressora [cite: 86]
      * [cite\_start]`[6]` Testar Página de Teste [cite: 86]
      * [cite\_start]`[7]` Corrigir Erro 0x0000011b [cite: 87]
      * [cite\_start]`[8]` Corrigir Erro 0x00000bcb [cite: 87]
      * [cite\_start]`[9]` Corrigir Erro 0x00000709 [cite: 88]

  * [cite\_start]**[5] Limpeza** [cite: 5]

      * [cite\_start]Limpeza de Disco (Disk Cleanup) [cite: 128]
      * [cite\_start]Limpar Arquivos Temporários [cite: 129]
      * [cite\_start]Limpar Cache do DNS [cite: 129]
      * [cite\_start]Limpar Histórico do Navegador [cite: 130]
      * [cite\_start]Esvaziar Lixeira [cite: 130]
      * [cite\_start]Limpeza Completa do Sistema [cite: 130]

  * [cite\_start]**[6] Utilitários** [cite: 5]

      * [cite\_start]Editor do Registro (RegEdit) [cite: 149]
      * [cite\_start]Configurações do Sistema (MSConfig) [cite: 149]
      * [cite\_start]Monitor de Recursos [cite: 150]
      * [cite\_start]Informações do Sistema (MSInfo32) [cite: 150]
      * [cite\_start]Prompt de Comando como Admin [cite: 151]
      * [cite\_start]PowerShell como Admin [cite: 151]

  * [cite\_start]**[7] Domínio** [cite: 6]

      * [cite\_start]`[1]` Ingressar no Domínio (Iketani, Labsi, Premazon, Densimagen) [cite: 161, 168, 169, 170]
      * [cite\_start]`[2]` Verificar Status do Domínio [cite: 162]
      * [cite\_start]`[3]` Sair do Domínio [cite: 162]
      * [cite\_start]`[4]` Informações do Computador [cite: 163]

  * [cite\_start]**[8] Drivers** [cite: 6]

      * [cite\_start]`[1]` Fazer Backup dos Drivers [cite: 191]
      * [cite\_start]`[2]` Restaurar Drivers do Backup [cite: 192]
      * [cite\_start]`[3]` Listar Drivers Instalados [cite: 192]
      * [cite\_start]`[4]` Verificar Drivers sem Assinatura Digital [cite: 192]
      * [cite\_start]`[5]` Atualizar Drivers via Windows Update [cite: 193]
      * [cite\_start]`[6]` Exportar Lista de Drivers para Arquivo [cite: 193]

  * [cite\_start]**[9] Instalar Programas** [cite: 7]

      * [cite\_start]Google Chrome [cite: 230]
      * [cite\_start]Mozilla Firefox [cite: 231]
      * [cite\_start]Adobe Reader [cite: 231]
      * [cite\_start]Foxit Reader [cite: 232]
      * [cite\_start]Google Drive [cite: 233]
      * [cite\_start]LibreOffice [cite: 233]
      * [cite\_start]CrystalDiskInfo [cite: 234]
      * [cite\_start]CrystalDiskMark [cite: 234]
      * [cite\_start]CPU-Z [cite: 235]
      * [cite\_start]Instalar Todos [cite: 235]

  * [cite\_start]**[10] Ativar Windows e Office** [cite: 7]

      * [cite\_start]`[1]` Abrir Ativador [cite: 273]
      * [cite\_start]`[2]` Verificar Status de Ativação [cite: 273]

\</details\>

## ⚙️ Requisitos

  * **Sistema Operacional**: Windows 10 ou superior.
  * **Privilégios**: **Execução como Administrador é obrigatória** para a maioria das funções.
  * **Conexão com a Internet**: Necessária para a instalação de programas via `winget` e para a função de ativação.
  * [cite\_start]**Winget**: O Gerenciador de Pacotes do Windows (`winget`) deve estar instalado para que o menu "Instalar Programas" funcione[cite: 239].

## 🚀 Como Usar

1.  Faça o download do arquivo `version2.bat`.
2.  Clique com o botão direito no arquivo e selecione **"Executar como administrador"**.
3.  Navegue pelos menus utilizando os números correspondentes a cada opção e pressione `Enter`.
4.  Siga as instruções de cada submenu.

## ⚠️ Avisos Importantes

  * **Risco de Uso**: Este é um script poderoso que realiza alterações profundas no sistema. Use por sua conta e risco. O autor não se responsabiliza por qualquer dano causado pelo uso indevido da ferramenta.
  * [cite\_start]**Modificações no Registro**: Funções como as correções de erros de impressora (`0x0000011b`, `0x00000bcb`, `0x00000709`) modificam o Registro do Windows[cite: 108, 116, 124]. Faça backups antes de prosseguir.
  * [cite\_start]**Scripts de Terceiros**: A seção "Ativar Windows e Office" utiliza um script externo baixado da internet (`irm https://get.activated.win | iex`)[cite: 278]. Tenha ciência do que este comando faz e dos riscos de segurança associados antes de executá-lo.
  * **Backup de Dados**: Sempre tenha um backup completo dos seus dados importantes antes de executar ferramentas de manutenção como esta.

## 🤝 Contribuições

Sinta-se à vontade para fazer um *fork* deste repositório, criar *issues* para relatar bugs ou sugerir novas funcionalidades. Pull requests são bem-vindos\!
