---
title: Introduction to the Use of Genomic Data in Phylogenetic Systematics
summary: A tutorial for processing genomic/transcriptomic data for phylogentics used in the UFMG grad course
date: 2021-10-1
type: docs
math: false
#tags:
#  - Bioinformatic
image:
  caption: ''
---

# Objetivos

Quando lidamos com dados genômicos, temos que manipular e organizar muitos arquivos de *input* e *output*, o que parece muito complicado. Porém, quando sabemos utilizar linha de comando, essas tarefas tornam-se mais simples.
O objetivo deste tutorial (e da aula como um todo) é dar uma visão geral sobre como comunicar com seu computador através da linha de comando para executar tarefas que seriam muito complicadas de executar com cliques do mouse. Esperamos que no final da disciplina você tenha uma base para trabalhar com dados de sequenciamento massivo, e para desenvolver melhor suas habilidades em bioinformática, caso tenha interesse no futuro. Lembre-se que o google tem muitas respostas para suas perguntas sobre programação. Só é necessário saber perguntar.


# O que é a *Shell*


*Shell* é um programa que permite você se comunicar com o sistema operacional do seu computador através de comandos usando o teclado, sem a necessidade de uma interface gráfica (*Graphical User Interface*, GUI) que você opera com o mouse.  

A comunicação com o computador através de GUI é intuitiva e prática para tarefas do dia a dia. Porém, quando há a necessidade de fazer tarefas repetitivas, o *shell* pode te poupar muitas horas.  

Existem vários programas que você pode usar para acessar o *shell* do seu computador. No Windows, os mais comuns são o *Command Prompt* e o *Power Shell*. Em sistemas Unix (Mac, Linux) temos o *Bash*. A linguagem utilizada pelo *shell* do Windows é diferente da linguagem utilizada no Unix. Como a maioria dos programas são feitos para Mac e Linux, aqui vamos focar na linguagem *Bash*.  

Se você tem uma máquina com o Windows instalado, não se preocupe. Foi lançado recentemente um aplicativo que permite você abrir um terminal em *Bash*: o *Windows Subsystem for Linux* (WSL). 

Siga as [instruções](https://www.windowscentral.com/install-windows-subsystem-linux-windows-10) para instalar e escolha qual distribuiçã do Ubuntu você deseja instalar. 
  
  

  

# Utilizando a *Shell* 


Abra o WSL (ou o aplicativo chamado Terminal no MAC/Linux).

Você verá algo parecido com a Figura 1.

![WSL](/home/ghfa/GHFA/Classes/Filogenomica_UFMG/Images/WSL.jpg)


O sinal “~” indica que você está no *user home directory*. Seria análogo à sua “área de trabalho” no Windows.

Para exibir o caminho completo do diretório em que estamos trabalhando, utilizamos o comando ‘pwd’ 
(Neste Tutorial, a caixa escura contem os comandos que você deve executar em seu terminal. Recomendo você digitar o comando para memorizar, ao invés de apenas copiar e colar. Linhas com ‘#’ são comentários, não comandos. Elas são ignoradas pela *shell*.)

``` bash
pwd
```

Observe que você estará na pasta “/home/seu_nome_de_usuario”, onde seu_nome_de_usuario é o nome que você escolheu quando instalou o Ubuntu. O “~” é uma simplificação para o *home* do usuário. 

Para navegar pelas pastas, utilizamos o comando ‘cd’ (de *change directory*). Você pode ir para a pasta *home* (note que aqui é o home do sistema) digitando:

```bash
cd /home
```

Para saber o que tem nesta pasta em que estamos agora, podemos utilizar o comando ‘ls’ (de *list*)

```bash
ls
```

Use o comando ‘cd’ para acessar a sua pasta novamente. Você pode usar o nome dela como argumento para o ‘cd’ ou simplesmente usar:

```bash
cd ~
```


Observe que se você usar ‘ls’ nada acontecerá, pois, sua pasta está vazia.

Para criar um arquivo você pode usar o comando ‘touch’.

```bash
touch exemplo.txt
```
 
Use o comando ‘ls’ agora e veja que o arquivo estará na sua pasta.
Existem vários editores de texto. Nano e Vim são bastante comuns e normalmente já vem instalados nos sistemas Unix. Eu particularmente uso o Vim. Uma maneira fácil de saber se um programa está instalado no seu computador é usando o comando ‘which’, seguido pelo nome do programa.


```bash
which vim
```

Caso esteja instalado, o comando retorna o caminho para a o programa, neste caso ‘/usr/bin/vim’

Você pode acessar o manual de um programa com o comando ‘man’ (de *manual*).

```bash
man nano
```

```bash
man vim
```

Utilize o vim para abrir o arquivo que criamos anteriormente

```bash
vi exemplo.txt
```

Observe que o arquivo está em branco. Para editar você tem que digitar primeiro ‘i’ para ativar o *insert mode*.

Escreva “Isso é um exemplo de arquivo”

Quando terminar, aperte a tecla “Esc” para sair do *Insert*. Para salvar digite ‘:wq’ (*write and quit*). Caso vc queira sair sem salvar alteraçOes no documento, digite apenas ‘:q’.

Leia o manual com calma em algum momento, caso queira saber mais detalhes sobre como usar a aplicação. Tente editar o arquivo com o Nano e veja qual você prefere.

Outra forma de criar um arquivo é através do próprio programa de edição, utilizando como input o nome de um arquivo que não existe.


```bash
vi exemplo2.txt
```

Escreva algo no arquivo, salve e feche-o.

Existem algumas maneiras de ver o arquivo sem editar. Uma delas é utilizando o comando ‘cat’ (de *concatenated*). Veremos outras formas em breve.

```bash
cat exemplo2.txt
```

Uma forma de escrever em arquivos é utilizando o comando ‘echo’. Este comando mostra um texto no terminal.

```bash
echo Olá, tudo bem?
```

Podemos utilizar o sinal ‘>’ para que o resultado de um comando seja enviado para um arquivo


```bash
echo Olá, tudo bem? > exemplo3.txt

vi exmplo3.txt
```

Caso o arquivo especificado como output não exista, ele será criado. Caso contrário, o que está nele será apagado e substituído pelo novo output.

```bash
echo Tudo bem, e com você? > exemplo3.txt

vi exmplo3.txt
```

Para adicionar algo a um arquivo sem apagar, use ‘>>’

```bash
echo Olá, tudo bem? >> exemplo4.txt
echo Tudo bem, e você? >> exemplo4.txt
cat exmplo4.txt
```

Você pode usar o ‘cat’ para concatenar dois arquivos

```bash
echo Eu estou bem tambem >> exemplo5.txt
cat exemplo4.txt exemplo5.txt

# para salvar oresultado em um outro arquivo 
cat exemplo4.txt exemplo5.txt > exemplo6.txt

cat exemplo6.txt
```

Use o ‘ls’ para listar os arquivos na pasta

Muitos comandos possuem opções que podem ser utilizadas para controlar melhor o output. Para ver rapidamente como usar um programa/comando sem precisar abrir o manual, podemos utilizar o argumento ‘--help’ ou muitas vezes somente ‘-h’ basta.


```bash
ls --help 
```

Para exibir os arquivos em uma lista detalhada, utilize ‘ls -l’

```bash
ls -l
```

A primeira coluna indica o tipo de arquivo e as permissões.
Veja a Figura 2 obtida do site [Data Carpentry](https://datacarpentry.org/)

![Permissões]( /home/ghfa/GHFA/Classes/Filogenomica_UFMG/Images/rwx_figure.jpg)


Para mudar as permissões, usamos o comando ‘chmod’

```bash
# Para tornar o arquivo executável podemos utilizar o comando abaixo.
# (por exemplo no caso de programa que criou ou baixou) 

chmod +x exemplo6.txt

ls -l

```

Para criar uma pasta usamos o comando ‘mkdir’ (*make directory*)

```bash
mkdir aula_01

mkdir aula_01/pasta1
mkdir aula_01/pasta2

```
O comando acima cria uma pasta dentro da pasta que havia sido criada anteriormente. Podemos usar o ls seguido de -lR para listar em detalhe e recursivamente o conteúdo dentro as pastas que criamos.

```bash
ls -lR
```

Para copiar arquivos usamos o comando ‘cp’ (*copy*), seguido do arquivo que queremos copiar e o local de destino


```bash
cp exemplo6.txt aula_01/exemplo6.txt
cp exemplo5.txt aula_01/pasta1/exemplo6.txt

ls -lR
```

Para remover utilizamos o comando ‘rm’ (*remove*) seguido pelo arquivo que desejamos remover.

```bash
rm exemplo6.txt

# Obs: Para remover uma pasta, usamos a opção -r (recusrsively)

rm -r aula_01/pasta1

ls -lR

```

**Lembre-se: o shell não te pergunta se você tem certeza da ação que você está tomando. E também não existe “lixeira”. Uma vez deletado, já era... Tome cuidado e tenha sempre backup de arquivos importantes.**

Para mover um arquivo usamos ‘mv’ (*move*) seguido pelo caminho pro arquivo de origem e pelo destino. 

```bash
mv exemplo5.txt aula_01/exemplo5.txt

ls -lR
```

Podemos renomear o arquivo mudando o nome de destino.

```bash
mv exemplo4.txt novo_nome_para_o_exemplo4.txt
ls -lh
```

Podemos usar caracteres coringas (*wild cards*) para executar operações em muitos arquivos. Por exemplo, para copiar todos os arquivos .txt para uma pasta

```bash
cp *.txt aula_01/
ls -l aula_01

# Note que o ls acima lista apenas o conteúdo da pasta aula_01

```

Remova todos os arquivos e pastas que você criou até agora neste tutorial e limpe o terminal. (Tenha certeza que vc está na pasta certa)

```bash
rm -r *

# O ‘-r’ significa recursivamente (para deletar pastas)
# o ‘*’ é um caractere coringa. 
# Como não tem nenhum outro caractere especificado, 
# ele vai deletar tudo que está na pasta.

clear

# O comando acima limpa o seu terminal

```

Se você quiser salvar os comandos que você executou, vc pode usar o comando ‘history’. Este comando exibe no terminal todos os comandos utilizados (mesmo comandos utilizados a muito tempo atás). Você pode usar ‘>’ para salvar essa história em um arquivo. Veja a ajuda do programa para como limpar seu histórico.  
Mais a frente no tutorial vamos ver comandos que podem ser úteis para salvar apenas os últimos comandos.

```bash
history > terminal_history_2021_.txt
```
 


Agora que você já tem uma noção de alguns comandos básicos, vamos instalar programas. Ao longo dos tutorias vamos introduzir novos comandos úteis. Você também pode dar uma olhada com calma em outros sites como o [Data Carpentry](https://datacarpentry.org/shell-genomics/06-organization/index.html) ou [SoftwareCarpentry]( https://swcarpentry.github.io/shell-novice/03-create/index.html) que contém alguns tutoriais e exercícios. 
  
  
# Instalando programas

Muitos programas hoje em dia apresentam bons manuais *online* que ensinam o passo a passo de como instalar programas. Aqui, vamos ensinar algumas dicas, mas é sempre importante ler em detalhe a página do programa antes de instalá-lo.

Para facilitar, vamos criar uma pasta que usaremos para baixar programas quando necessário.  
  
```bash
mkdir progs

cd progs
```


Uma forma fácil de instalar programas é usando ferramentas que te ajudam a instalar e administrar pacotes de programas (*package manager*). Uma dessas ferramentas que vem com o Ubuntu é o programa APT.
A desvantagem do APT é que é necessário acesso a raiz do sistema (se você não é o administrador a instalação não é possível). Além disso, muitas vezes é necessário instalar outros programas (dependências) antes de instalar o programa desejado. Para usar os privilégios de administrador, você precisa usar o comando ‘sudo’ andes do comando ‘apt’ e fornecer sua senha de usuário criada durante a instalação do programa.
Use os comandos abaixo para instalar o programa R em seu sistema Linux. Para mais detalhes da instalação veja este [site](https://linuxize.com/post/how-to-install-r-on-ubuntu-20-04/)

 ```bash
# Primeiro atualize o apt
sudo apt update

# Instale as dependências para o R.
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common

# Adicione o repositório CRAN para a lista do seu sistema
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

# Instale o R
sudo apt install r-base

# Instale o programa para poder compilar pacotes do R
sudo apt install build-essential

# Para abrir o R no terminal, apenas digite R
R

# Agora o seu terminal está falando a linguagem R
# Comandos em bash não serão reconhecidos
pwd

# Para sair do R e voltar barra a linguagem bash, digite
q()

# Não salve o workspace.
```

Um administrador de pacote muito útil é o [Conda]( https://docs.conda.io/en/latest/). Com ele podemos instalar e desinstalar pacotes facilmente e sem acesso à raiz. Embora seja escrito em Python, ele pode ser usado para instalar programas que foram escritos em várias outras linguagens. 
O Conda vem em dois principais sabores: Anaconda e Miniconda. [Miniconda]( https://docs.conda.io/en/latest/miniconda.html) é uma versão menor e mais básica, e geralmente tem tudo o que precisamos. Por isso vamos utilizá-la.
  
Para instalar o conda precisamos baixar o instalador da internet. Para isso podemos usar o comando ‘wget’. 



Abra a página que contém os instaladores para [Miniconda](https://docs.conda.io/en/latest/miniconda.html#linux-installers) e vá até parte correspondente ao seu sistema operacional. (Lembre-se, se vc está usando o WSL, seu sistema operacional é Linux)
Click com o botão direito e copie o endereço.
No Terminal, digite ‘wget’ e cole o endereço copiado
(**Não use ‘Ctrl + V’. Apenas clique com o botão direito do mouse**)
(**Lembre-se também de ‘Ctrl + C’ no Unix shell serve para cancelar um processo, não para copiar.**)


```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```
  
O arquivo baixado é um script em bash que vai instalar o Miniconda. Podemos abri-lo com o Vim ou nano para vê-lo.

```bash
vi Miniconda3-latest-Linux-x86_64.sh
```
  
Feche o arquivo sem salvar alterações digitando ‘:q’


Execute o arquivo que você baixou. Como é um script em bash, utilizamos:

```bash
bash Miniconda3-latest-Linux-x86_64.sh
```

Siga as intruções e aceite o *default*.

Agora você pode usar conda para instalar programas. Você pode procurar por pacotes de interesse no repositório do [Anaconda](https://anaconda.org/) ou utilizar a busca no próprio terminal.


Por exemplo, o programa [gdown](https://anaconda.org/conda-forge/gdown) é interessante para baixar arquivos grandes do google drive. O Comando abaixo busca pelo programa

```bash
conda search gdown 
```

Para instalar use:

```bash
conda install gdown

# Caso queira uma versão específica
conda install gdown=4.2.0

# Caso queira um canal específico para baixar use a opção -c 
conda install -c conda-forge gdown

# Para mais detalhes
conda install --help
```

Uma vantagem do conda é que podemos criar ambientes com pacotes específicos. Por exemplo, se vamos começar um projeto novo e queremos usar sempre determinadas versões de programas, podemos criar um ambiente com esses programas e ativá-lo sempre que formos trabalhar naquele projeto.

Por exemplo, podemos criar um ambiente para o [phyluce](https://phyluce.readthedocs.io/en/latest/index.html), programa que utilizaremos para UCEs. (A versão mais recente do Phyluce não está disponível em um repositório conda. Assim, temos que baixar o arquivo).


```bash
# Baixe o arquivo para o seu sistema operacional.
# No caso do exemplo abaixo, Linux
# Para MacOS veja:
# https://github.com/faircloth-lab/phyluce/releases
wget \

https://raw.githubusercontent.com/faircloth-lab/phyluce/v1.7.1/distrib/phyluce-1.7.1-py36-Linux-conda.yml 

# Use conda para instalar usando arquivo baixado
conda env create -n phyluce-1.7.1 --file phyluce-1.7.1-py36-Linux-conda.yml
```

Os argumentos ‘env create’ indica que é para criar um ambiente (*create environment*) 
O argumento após a opção ‘-n’ determina o nome do ambiente (no caso phyluce-1.7.1, mas poderia ser qualquer um a sua escolha) e a opção ‘--file’ determina que é para usar o arquivo indicado no argumento seguinte (ou seja, não é para o conda buscar na internet e baixar)

Para ativar o ambiente criado use

```bash
source activate phyluce-1.7.1

# O programa illumiprocessor faz parte do phyluce
# veja a ajuda desse programam
illumiprocessor –-help

# Para desativar o ambiente

conda deactivate

# Note que agora não é possível usar o illumiprocessor
illumiprocessor –-help
```

Um outro programa muito usado para instalar pacotes em Python é o [Pip](https://pypi.org/project/pip/). Visite o website e instale o programa. 

Ao longo da disciplina instalaremos mais programas. Caso tenha tempo, você pode navegar pelos tutoriais e instalar os programas antecipadamente.

# Acessando pastas do Windows com WSL

Embora estejamos utilizando o Linux, podemos querer acessar documentos que estão em pastas do Windows. Os arquivos do Windows ficam “escondidos” na raiz do WSL. Não utilize o WSL para manipular arquivos de sistema do Windows, use apenas para arquivos comuns do seu projeto.
 
Lembre-se que estamos na pasta “progs”. Podemos conferir usando ‘pwd’.
Para voltar um nível na pasta podemos utilizar o atalho ‘..’

```bash
cd ..
```

Temos que chegar na raiz do sistema. Podemos utilizar várias vezes o ‘cd ..’ ou podemos utilizar o atalho ‘/’ (que sempre te leva pra raiz)

```bash
cd /

# visualize o conteúdo do diretório
ls -l


```

A unidade de disco estará na pasta ‘mnt’

```bash
cd mnt
```

Acesse a unidade de disco em que o Windows está instalado (Possivelmente unidade ‘c’) ou a unidade em que prefira trabalhar com seus arquivos (por exemplo se você tem uma unidade maior para manter arquivos e outra apenas para o sistema operacional). Neste tutorial vamos acessar a unidade em que o Windows está instalado para usar a área de trabalho do Windows, mas você pode escolher a pasta que preferir em seu computador.

```bash
cd c
ls -l
```

Procure por uma pasta chamada “Users” ou “Usuários”. Dentro dela terá uma outra pasta com o seu nome de usuário do Windows (Substitua no comando abaixo pelo nome adequado). 


```bash
cd Users
ls
cd nome_do_seu_usuario_windows
ls
cd Desktop

# Ou simplesmente
cd Users/nome_do_seu_usuario_windows/Desktop

ls
```

Observe que todos os seus arquivos da área de trabalho do Windows aparecem listados no terminal.
Crie uma pasta na área de trabalho (ou no seu local preferido) para a disciplina

```bash
mkdir filogenomica
```

**Dicas:**   
1. Não use espaço nem caracteres especiais (‘, ~, !, * ...) ’_’ ou '-' estão OK (mas melhor evitar '-')  
2. Use nomes curtos e fáceis (porém informativo) para pastas e arquivos  
3. Lembre-se que “filogenomica” é diferente de “Filogenomica”   

Para ficar mais fácil acessar essa pasta do WSL, vamos criar um atalho na pasta /home/$USER do Linux.

Primeiro, acesse a pasta da disciplina e imprima no terminal o seu caminho completo.

```bash
cd filogenomica
pwd
```
Copie (selecione e clique com o botão direito) o caminho para a pasta
Volte para a pasta home do seu usuário de Linux. Lembre-se que podemos usar o atalho ‘~’

```bash
cd ~
```

Use o comando ‘ln’ (*link*) para criar um link para a pasta filogenomica. Como estamos copiando uma pasta, o comando exige que usemos links simbólicos com a opção ‘-s’. O argumento utilizado é o caminho completo para a pasta (ou arquivo) que queremos criar o link. 
Você pode copiar e colar (selecione e clique com o botão direito duas vezes) o caminho para a pasta resultante do ‘pwd’ usado acima.


```bash
ln -s /mnt/c/Users/seu_usuario_windows/Desktop/filogenomica
ls -l
```

Observe que a cor da pasta é diferente e o caminho para a pasta é indicado ao lado.
Sempre que quisermos acessar essa pasta do terminal WSL podemos usar:

```bash
cd ~/filogenomica 
````

Ou podemos acessar ela pelo Windows normalmente


Na pasta filogenomica use a linha de comando para criar as pastas “data”, “docs”, “scripts” e “misc”


Crie o arquivo “bash_cheatsheat.csv” na pasta "misc"

Da maneira que preferir (mas usando o terminal), escreva nesse arquivo o seguinte (Não use espaço):
Comando,descrição,opções_uteis,uso  

Use esse arquivo para ter acesso rápido a comandos úteis que você vai utilizar frequentemente.
Adicione os comandos que você aprendeu hoje. Ao longo da disciplina você pode usar o comando ‘echo’ com o output ‘>> ~/filogenomica/misc/bash_cheatsheat.csv’ para escrever nesse arquivo sempre que quiser.
   
No Windows, você pode abrir o arquivo usando um editor de texto (sugiro o [notepad++](https://notepad-plus-plus.org/downloads/)) ou até mesmo o Excel ou outro editor de planilhas.
  
  
# Obtendo Sequências – *Sequence Read Archive*

[*Sequence Read Archive* (SRA)](https://www.ncbi.nlm.nih.gov/sra) é um repositório do GenBank para sequencias cruas resultantes de sequenciamento massivo (*high throughput sequencing*) de bibliotecas genômicas. Você pode navegar pelo site do SRA para buscar sequencias dos organismos que você tem interesse a baixar pelo site. Porém, uma vez que temos o número de acesso, é mais fácil utilizar uma ferramenta chamada [SRA Toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software). Podemos instalar usando ‘wget’ para baixar o arquivo, como mostrado nas [instruções](https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit) do GitHub do programa, ou podemos usar o apt-get ou o conda. A versão no repositório do conda não é a mais recente:

```bash
conda search sra-tools

# Compare o resultado do comando acima com a versão indicada no site:
# https://github.com/ncbi/sra-tools/wiki/01.-Downloading-SRA-Toolkit
```

Par facilitar, usaremos o conda. Caso queire a mais recente, siga as [instruções no site do programa](https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit)

```bash
conda install sra-tools

# Caso queira instalar no mesmo ambiente em que o Phyluce está instalado,
# ative o ambiente primeiro e instale usando o comando acima.

# Caso queira instalar em um ambiente diferente use:
conda create -n nome_do_ambiente sra-tools
# Se for o caso, lembre-se de ativá-lo antes de usar. 

```

O SRA Toolkit possui uma ferramenta chamada ‘fastq-dump’. É ela que usaremos para baixar as sequencias. As sequências que utilizaremos são de aranhas saltadoras publicadas por [Leduc-Robert and Maddison, 2018](https://doi.org/10.1186/s12862-018-1137-x). Para baixar, precisamos do número de acesso da corrida que pode ser encontrado na página (Figura 1).  

![Número de acesso à corrida do SRA](/home/ghfa/GHFA/Classes/Filogenomica_UFMG/Images/SRAweb.JPG)  
  
  
Acesse a pasta “data” que você criou no tutorial passado e crie uma outra pasta para os dados de RNA-seq.  

```bash
cd ~/filogenomica/data
mkdir raw-rnaseq
cd raw-rnaseq
```
Vamos utilizar as corridas: SRR6381066, SRR6381055, SRR6381090, SRR6381065.

A forma mais simples de baixar os das é apenas usar o comando ‘fastq-dump’ seguido pelas número de acesso. Porém, muitas vezes é melhor já preparar um pouco o arquivo para usar como input para outros programas. Podemos fazer isso da seguinte maneira: 

  
```bash
fastq-dump --defline-seq '@$ac $ri $rl' --defline-qual '+$ac $ri $rl' --gzip --clip \
--split-files --qual-filter -v \
SRR6381066 SRR6381055 SRR6381090 SRR6381065
```
  

Onde:  
--defline-seq '@$ac $ri $rl': renomeia cada sequencia no arquivo usando variáveis do SRATools (número de acesso, número da leitura, e tamanho da leitura). Alguns programas podem ter problemas com a forma que o fastq-dump nomeia as sequencias, por isso renomeamos. Essa maneira parece funcionar para mim, mas caso tenha problemas, você pode mudar essa opção. Veja o manual e a ajuda do programa para opções.  
  
--defline-qual '+$ac $ri $rl': o mesmo que o anterior, porém renomeia a linha antes a qualidade da sequência.  
  
--gzip: opção para compactar o arquivo.  
  
--clip: opção para remover adaptadores das sequências 
  
--split-files: separa as leituras em dois arquivos diferentes, uma para a primeira leitura, outro para a segunda leitura 
  
--qual-filter: remover leituras e partes das sequencias com qualidade ruim.  
  
-v: *verbose*, serve para o programa relatar informações no terminal enquanto processa.
  
SRR6381066 SRR6381055 ...: lista de números de acesso.  
  

No tutorial seguinte vamos processar esses dados que baixamos
  
  

 


