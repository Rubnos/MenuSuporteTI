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

<details>
<summary><strong>Ver Estrutura Completa do Menu</strong></summary>

* **[1] Sistema**
    * `[1]` Informações do Sistema
    * `[2]` Analisar e Reparar Arquivos Essenciais (DISM)
    * `[3]` Verificar Integridade dos Arquivos (SFC)
    * `[4]` Verificar Disco (CHKDSK)
    * `[5]` Informações de Hardware
    * `[6]` Gerenciador de Tarefas
    * `[7]` Serviços do Windows
    * `[8]` Verificar Memória (mdsched)

* **[2] Rede**
    * `[1]` Diagnóstico de Rede
    * `[2]` Resetar Configurações TCP/IP
    * `[3]` Flush DNS
    * `[4]` Teste de Conectividade
    * `[5]` Informações de Rede
    * `[6]` Verificar Interfaces de Rede Ativas e Velocidade
    * `[7]` Ativar/Desativar Firewall
        * Verificar Status do Firewall
        * Ativar/Desativar para Todos os Perfis
        * Ativar por Perfil (Pública, Privada, Domínio)
        * Restaurar Padrões do Firewall

* **[3] Disco**
    * `[1]` Informações do Disco
    * `[2]` Desfragmentar Disco

* **[4] Impressoras**
    * `[1]` Listar Impressoras Instaladas
    * `[2]` Verificar Status das Impressoras
    * `[3]` Limpar Fila de Impressão
    * `[4]` Reinstalar Drivers de Impressora
    * `[5]` Configurações de Impressora
    * `[6]` Testar Página de Teste
    * `[7]` Corrigir Erro 0x0000011b
    * `[8]` Corrigir Erro 0x00000bcb
    * `[9]` Corrigir Erro 0x00000709

* **[5] Limpeza**
    * Limpeza de Disco (Disk Cleanup)
    * Limpar Arquivos Temporários
    * Limpar Cache do DNS
    * Limpar Histórico do Navegador
    * Esvaziar Lixeira
    * Limpeza Completa do Sistema

* **[6] Utilitários**
    * Editor do Registro (RegEdit)
    * Configurações do Sistema (MSConfig)
    * Monitor de Recursos
    * Informações do Sistema (MSInfo32)
    * Prompt de Comando como Admin
    * PowerShell como Admin

* **[7] Domínio**
    * `[1]  Ingressar no Domínio (Iketani, Labsi, Premazon, Densimagen)`
    * `[2]` Verificar Status do Domínio
    * `[3]` Sair do Domínio
    * `[4]` Informações do Computador

* **[8] Drivers**
    * `[1]` Fazer Backup dos Drivers
    * `[2]` Restaurar Drivers do Backup
    * `[3]` Listar Drivers Instalados
    * `[4]` Verificar Drivers sem Assinatura Digital
    * `[5]` Atualizar Drivers via Windows Update
    * `[6]` Exportar Lista de Drivers para Arquivo

* **[9] Instalar Programas**
    * Google Chrome
    * Mozilla Firefox
    * Adobe Reader
    * Foxit Reader
    * Google Drive
    * LibreOffice
    * CrystalDiskInfo
    * CrystalDiskMark
    * CPU-Z
    * Instalar Todos

* **[10] Ativar Windows e Office**
    * `[1]` Abrir Ativador
    * `[2]` Verificar Status de Ativação

</details>
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
