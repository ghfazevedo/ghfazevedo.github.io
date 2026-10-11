---
title: Introduction to the Use of Genomic Data in Phylogenetic Systematics
label: Tutorial · English / Português · 2021
summary: Tutorial used in the UFMG graduate course — from the command line to aligned orthologous genes.
date: 2021-11-30
toc: true
link_text: Open tutorial →
weight: 1
# Language switch shown at the top of the page
lang_label: English
translations:
  - label: Português
    url: /teaching/phylogenomics/
# The images are stored with the Portuguese version
resources_from: /teaching/Phylogenomics
---

*This tutorial was originally written in Portuguese for the graduate course in Zoology at UFMG (2021) and translated into English. The commands are the same in both versions; only the example file and folder names were translated.*

## Class 1
### Objectives

When working with genomic data, we have to handle and organize many *input* and *output* files, which can seem very complicated. However, once we know how to use the command line, these tasks become much simpler.
The goal of this tutorial (and of the class as a whole) is to give an overview of how to communicate with your computer through the command line to carry out tasks that would be very complicated to do with mouse clicks. We hope that by the end of the course you will have a foundation for working with high-throughput sequencing data, and for further developing your bioinformatics skills if you are interested in the future. Remember that Google has many answers to your programming questions. You just need to know how to ask.


### What is the *Shell*


The *shell* is a program that lets you communicate with your computer's operating system through keyboard commands, without the need for a graphical interface (*Graphical User Interface*, GUI) that you operate with the mouse.

Communicating with the computer through a GUI is intuitive and practical for everyday tasks. However, when you need to perform repetitive tasks, the *shell* can save you many hours.

There are several programs you can use to access your computer's *shell*. On Windows, the most common are *Command Prompt* and *PowerShell*. On Unix systems (Mac, Linux) we have *Bash*. The language used by the Windows *shell* is different from the language used on Unix. Since most programs are made for Mac and Linux, here we will focus on the *Bash* language.

If you have a machine with Windows installed, don't worry. An application was recently released that lets you open a *Bash* terminal: the *Windows Subsystem for Linux* (WSL).

Follow the [instructions](https://www.windowscentral.com/install-windows-subsystem-linux-windows-10) to install it and choose which Ubuntu distribution you want to install.


### Using the *Shell*


Open WSL (or the application called Terminal on Mac/Linux).

You will see something similar to Figure 1.

![WSL](/images/WSL.jpg)


The "~" sign indicates that you are in the *user home directory*. It would be analogous to your "Desktop" on Windows.

To display the full path of the directory we are working in, we use the command 'pwd'
(In this tutorial, the dark box contains the commands you should run in your terminal. I recommend typing the commands to memorize them, rather than just copying and pasting. Lines starting with '#' are comments, not commands. They are ignored by the *shell*.)

``` bash
pwd
```

Notice that you will be in the folder "/home/your_user_name", where your_user_name is the name you chose when you installed Ubuntu. The "~" is a shortcut for the user's *home*.

To navigate through folders, we use the command 'cd' (from *change directory*). You can go to the *home* folder (note that here it is the system's home) by typing:

```bash
cd /home
```

To see what is in the folder we are in now, we can use the command 'ls' (from *list*)

```bash
ls
```

Use the 'cd' command to go back to your folder. You can use its name as an argument for 'cd' or simply use:

```bash
cd ~
```


Notice that if you use 'ls' nothing will happen, because your folder is empty.

To create a file you can use the command 'touch'.

```bash
touch example.txt
```

Now use the 'ls' command and see that the file is in your folder.
There are several text editors. Nano and Vim are quite common and usually come pre-installed on Unix systems. I personally use Vim. An easy way to find out whether a program is installed on your computer is the 'which' command, followed by the name of the program.


```bash
which vim
```

If it is installed, the command returns the path to the program, in this case '/usr/bin/vim'

You can access a program's manual with the command 'man' (from *manual*).

```bash
man nano
```

```bash
man vim
```

Use vim to open the file we created earlier

```bash
vi example.txt
```

Notice that the file is blank. To edit it, you must first type 'i' to activate *insert mode*.

Write "This is an example file"

When you are done, press the "Esc" key to leave *Insert* mode. To save, type ':wq' (*write and quit*). If you want to quit without saving changes to the document, type just ':q'.

Read the manual carefully at some point if you want more details on how to use the application. Try editing the file with Nano and see which one you prefer.

Another way to create a file is through the editing program itself, using as input the name of a file that does not exist.


```bash
vi example2.txt
```

Write something in the file, save it and close it.

There are a few ways to view a file without editing it. One of them is the 'cat' command (from *concatenate*). We will see other ways soon.

```bash
cat example2.txt
```

One way to write to files is with the 'echo' command. This command displays a text in the terminal.

```bash
echo Hello, how are you?
```

We can use the '>' sign to send the result of a command to a file


```bash
echo Hello, how are you? > example3.txt

vi example3.txt
```

If the file specified as output does not exist, it will be created. Otherwise, its contents will be erased and replaced by the new output.

```bash
echo I am fine, and you? > example3.txt

vi example3.txt
```

To add something to a file without erasing it, use '>>'

```bash
echo Hello, how are you? >> example4.txt
echo I am fine, and you? >> example4.txt
cat example4.txt
```

You can use 'cat' to concatenate two files

```bash
echo I am fine too >> example5.txt
cat example4.txt example5.txt

# to save the result in another file
cat example4.txt example5.txt > example6.txt

cat example6.txt
```

Use 'ls' to list the files in the folder

Many commands have options that can be used to better control the output. To quickly see how to use a program/command without opening the manual, we can use the argument '--help', or often just '-h' is enough.


```bash
ls --help
```

To display the files in a detailed list, use 'ls -l'

```bash
ls -l
```

The first column indicates the file type and permissions.
See Figure 2, taken from the [Data Carpentry](https://datacarpentry.org/) website

![Permissions]( /images/rwx_figure.jpg)


To change permissions, we use the command 'chmod'

```bash
# To make the file executable we can use the command below
# (for example, for a program you created or downloaded)

chmod +x example6.txt

ls -l

```

To create a folder we use the command 'mkdir' (*make directory*)

```bash
mkdir class_01

mkdir class_01/folder1
mkdir class_01/folder2

```
The commands above create folders inside the folder that was created first. We can use ls followed by -lR to list in detail, and recursively, the contents of the folders we created.

```bash
ls -lR
```

To copy files we use the command 'cp' (*copy*), followed by the file we want to copy and the destination


```bash
cp example6.txt class_01/example6.txt
cp example5.txt class_01/folder1/example6.txt

ls -lR
```

To remove we use the command 'rm' (*remove*) followed by the file we want to remove.

```bash
rm example6.txt

# Note: To remove a folder, we use the -r option (recursively)

rm -r class_01/folder1

ls -lR

```

**Remember: the shell does not ask whether you are sure about the action you are taking. And there is no "recycle bin". Once deleted, it's gone... Be careful and always keep backups of important files.**

To move a file we use 'mv' (*move*) followed by the path to the source file and the destination.

```bash
mv example5.txt class_01/example5.txt

ls -lR
```

We can rename a file by changing the destination name.

```bash
mv example4.txt new_name_for_example4.txt
ls -lh
```

We can use *wild cards* to run operations on many files at once. For example, to copy all .txt files to a folder

```bash
cp *.txt class_01/
ls -l class_01

# Note that the ls above lists only the contents of the class_01 folder

```

Remove all files and folders you have created so far in this tutorial and clear the terminal. (Make sure you are in the right folder)

```bash
rm -r *

# '-r' means recursively (to delete folders)
# '*' is a wild card.
# Since no other character is specified,
# it will delete everything in the folder.

clear

# The command above clears your terminal

```

If you want to save the commands you have run, you can use the 'history' command. This command displays in the terminal all the commands you have used (even commands used a long time ago). You can use '>' to save this history to a file. See the program's help for how to clear your history.
Later in the tutorial we will see commands that can be useful to save only the most recent commands.

```bash
history > terminal_history_2021_.txt
```



Now that you have a sense of some basic commands, let's install programs. Throughout the tutorials we will introduce new useful commands. You can also take your time to look at other websites such as [Data Carpentry](https://datacarpentry.org/shell-genomics/06-organization/index.html) or [Software Carpentry]( https://swcarpentry.github.io/shell-novice/03-create/index.html), which have tutorials and exercises.


### Installing programs

Many programs nowadays have good *online* manuals that teach, step by step, how to install them. Here we will give a few tips, but it is always important to read the program's page in detail before installing it.

To make things easier, let's create a folder that we will use to download programs when needed.

```bash
mkdir progs

cd progs
```


An easy way to install programs is with tools that help you install and manage software packages (*package managers*). One of these tools that comes with Ubuntu is APT.
The disadvantage of APT is that it requires root access to the system (if you are not the administrator, installation is not possible). In addition, it is often necessary to install other programs (dependencies) before installing the desired program. To use administrator privileges, you need to use the 'sudo' command before the 'apt' command and provide the user password you created when installing Ubuntu.
Use the commands below to install R on your Linux system. For more installation details see this [website](https://linuxize.com/post/how-to-install-r-on-ubuntu-20-04/)

 ```bash
# First update apt
sudo apt update

# Install the dependencies for R.
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common

# Add the CRAN repository to your system's list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

# Install R
sudo apt install r-base

# Install the tools needed to compile R packages
sudo apt install build-essential

# To open R in the terminal, just type R
R

# Now your terminal is speaking the R language
# Bash commands will not be recognized
pwd

# To quit R and go back to the bash language, type
q()

# Do not save the workspace.
```

A very useful package manager is [Conda]( https://docs.conda.io/en/latest/). With it we can install and uninstall packages easily and without root access. Although it is written in Python, it can be used to install programs written in many other languages.
Conda comes in two main flavors: Anaconda and Miniconda. [Miniconda]( https://docs.conda.io/en/latest/miniconda.html) is a smaller, more basic version and usually has everything we need. That is why we will use it.

To install conda we need to download the installer from the internet. For that we can use the 'wget' command.



Open the page with the installers for [Miniconda](https://docs.conda.io/en/latest/miniconda.html#linux-installers) and go to the section for your operating system. (Remember, if you are using WSL, your operating system is Linux)
Right-click and copy the link address.
In the Terminal, type 'wget' and paste the copied address
(**Do not use 'Ctrl + V'. Just right-click with the mouse**)
(**Also remember that 'Ctrl + C' in the Unix shell cancels a process; it does not copy.**)


```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```

The downloaded file is a bash script that will install Miniconda. We can open it with Vim or nano to look at it.

```bash
vi Miniconda3-latest-Linux-x86_64.sh
```

Close the file without saving changes by typing ':q'


Run the file you downloaded. Since it is a bash script, we use:

```bash
bash Miniconda3-latest-Linux-x86_64.sh
```

Follow the instructions and accept the *defaults*.

Now you can use conda to install programs. You can search for packages of interest in the [Anaconda](https://anaconda.org/) repository or search directly from the terminal.


For example, the program [gdown](https://anaconda.org/conda-forge/gdown) is useful for downloading large files from Google Drive. The command below searches for the program

```bash
conda search gdown
```

To install it, use:

```bash
conda install gdown

# If you want a specific version
conda install gdown=4.2.0

# If you want a specific channel to download from, use the -c option
conda install -c conda-forge gdown

# For more details
conda install --help
```

One advantage of conda is that we can create environments with specific packages. For example, if we are starting a new project and always want to use particular versions of programs, we can create an environment with those programs and activate it whenever we work on that project.

For example, we can create an environment for [phyluce](https://phyluce.readthedocs.io/en/latest/index.html), a program we will use for UCEs. (The most recent version of Phyluce is not available in a conda repository, so we have to download the file.)


```bash
# Download the file for your operating system.
# In the example below, Linux
# For MacOS see:
# https://github.com/faircloth-lab/phyluce/releases
wget \

https://raw.githubusercontent.com/faircloth-lab/phyluce/v1.7.1/distrib/phyluce-1.7.1-py36-Linux-conda.yml

# Use conda to install using the downloaded file
conda env create -n phyluce-1.7.1 --file phyluce-1.7.1-py36-Linux-conda.yml
```

The arguments 'env create' indicate that an environment should be created (*create environment*).
The argument after the '-n' option sets the name of the environment (here phyluce-1.7.1, but it could be any name you choose), and the '--file' option tells conda to use the file given in the next argument (that is, conda should not search for and download it from the internet).

To activate the environment you created, use

```bash
source activate phyluce-1.7.1

# The illumiprocessor program is part of phyluce
# see the help for this program
illumiprocessor --help

# To deactivate the environment

conda deactivate

# Note that now it is not possible to use illumiprocessor
illumiprocessor --help
```

Another program widely used to install Python packages is [Pip](https://pypi.org/project/pip/). Visit the website and install it.

We will install more programs throughout the course. If you have time, you can browse the tutorials and install the programs in advance.

### Accessing Windows folders with WSL

Although we are using Linux, we may want to access documents stored in Windows folders. Windows files are "hidden" in the WSL root. Do not use WSL to handle Windows system files; use it only for regular project files.

Remember that we are in the "progs" folder. We can check with 'pwd'.
To go up one folder level we can use the shortcut '..'

```bash
cd ..
```

We need to get to the system root. We can use 'cd ..' several times, or we can use the shortcut '/' (which always takes you to the root)

```bash
cd /

# view the contents of the directory
ls -l


```

The disk drives are in the 'mnt' folder

```bash
cd mnt
```

Go to the drive where Windows is installed (probably drive 'c') or the drive where you prefer to keep your files (for example, if you have a larger drive for files and another one just for the operating system). In this tutorial we will use the drive where Windows is installed to work on the Windows Desktop, but you can choose any folder you prefer on your computer.

```bash
cd c
ls -l
```

Look for a folder called "Users" (or "Usuários"). Inside it there will be another folder with your Windows user name (replace it with the right name in the command below).


```bash
cd Users
ls
cd your_windows_user_name
ls
cd Desktop

# Or simply
cd Users/your_windows_user_name/Desktop

ls
```

Notice that all the files on your Windows Desktop are listed in the terminal.
Create a folder on the Desktop (or wherever you prefer) for the course

```bash
mkdir phylogenomics
```

**Tips:**
1. Do not use spaces or special characters (', ~, !, * ...); '_' or '-' are OK (but better to avoid '-')
2. Use short, simple (but informative) names for folders and files
3. Remember that "phylogenomics" is different from "Phylogenomics"

To make this folder easier to reach from WSL, let's create a shortcut in the Linux /home/$USER folder.

First, go to the course folder and print its full path in the terminal.

```bash
cd phylogenomics
pwd
```
Copy (select and right-click) the path to the folder.
Go back to your Linux user's home folder. Remember that we can use the shortcut '~'

```bash
cd ~
```

Use the 'ln' (*link*) command to create a link to the phylogenomics folder. Since we are linking a folder, the command requires a symbolic link, with the '-s' option. The argument is the full path to the folder (or file) we want to link.
You can copy and paste (select, then right-click twice) the folder path printed by the 'pwd' used above.


```bash
ln -s /mnt/c/Users/your_windows_user/Desktop/phylogenomics
ls -l
```

Notice that the folder color is different and the path to the folder is shown next to it.
Whenever we want to access this folder from the WSL terminal we can use:

```bash
cd ~/phylogenomics
```

Or we can open it from Windows as usual.


In the phylogenomics folder, use the command line to create the folders "data", "docs", "scripts" and "misc"


Create the file "bash_cheatsheat.csv" in the "misc" folder

In whatever way you prefer (but using the terminal), write the following in this file (do not use spaces):
Command,description,useful_options,usage

Use this file to have quick access to useful commands you will use frequently.
Add the commands you learned today. Throughout the course you can use the 'echo' command with the output '>> ~/phylogenomics/misc/bash_cheatsheat.csv' to write to this file whenever you want.

On Windows, you can open the file with a text editor (I suggest [notepad++](https://notepad-plus-plus.org/downloads/)) or even with Excel or another spreadsheet editor.


### Getting Sequences – *Sequence Read Archive*

The [*Sequence Read Archive* (SRA)](https://www.ncbi.nlm.nih.gov/sra) is a GenBank repository for raw reads from high-throughput sequencing of genomic libraries. You can browse the SRA website to search for sequences of the organisms you are interested in and download them from the website. However, once we have the accession number, it is easier to use a tool called the [SRA Toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software). We can install it using 'wget' to download the file, as shown in the [instructions](https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit) on the program's GitHub, or we can use apt-get or conda. The version in the conda repository is not the most recent one:

```bash
conda search sra-tools

# Compare the result of the command above with the version listed on the website:
# https://github.com/ncbi/sra-tools/wiki/01.-Downloading-SRA-Toolkit
```

To keep things simple, we will use conda. If you want the most recent version, follow the [instructions on the program's website](https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit)

```bash
conda install sra-tools

# If you want to install it in the same environment where Phyluce is installed,
# activate that environment first and install with the command above.

# If you want to install it in a different environment, use:
conda create -n environment_name sra-tools
# If so, remember to activate it before using it.

```

The SRA Toolkit includes a tool called 'fastq-dump'. This is what we will use to download the sequences. The sequences we will use are from jumping spiders published by [Leduc-Robert and Maddison, 2018](https://doi.org/10.1186/s12862-018-1137-x). To download them, we need the run accession number, which can be found on the page (Figure 1).

![SRA run accession number](/images/SRAweb.JPG)


Go to the "data" folder you created in the previous tutorial and create another folder for the RNA-seq data.

```bash
cd ~/phylogenomics/data
mkdir raw-rnaseq
cd raw-rnaseq
```
We will use the runs: SRR6381066, SRR6381055, SRR6381090, SRR6381065.

The simplest way to download the data is to use the 'fastq-dump' command followed by the accession numbers. However, it is often better to prepare the files a little so they can be used as input for other programs. We can do this as follows:


```bash
fastq-dump --defline-seq '@$ac $ri $rl' --defline-qual '+$ac $ri $rl' --gzip --clip \
--split-files --qual-filter -v \
SRR6381066 SRR6381055 SRR6381090 SRR6381065
```


Where:
--defline-seq '@$ac $ri $rl': renames each sequence in the file using SRA Toolkit variables (accession number, read number and read length). Some programs may have problems with the way fastq-dump names sequences, so we rename them. This format seems to work for me, but if you run into problems you can change this option. See the program's manual and help for options.

--defline-qual '+$ac $ri $rl': the same as the previous one, but renames the line before the sequence quality.

--gzip: option to compress the file.

--clip: option to remove adapters from the sequences

--split-files: splits the reads into two different files, one for the first read and another for the second read

--qual-filter: removes reads and parts of sequences with poor quality.

-v: *verbose*, makes the program report information in the terminal while it is running.

SRR6381066 SRR6381055 ...: list of accession numbers.


In the next tutorial we will process the data we downloaded.



## Class 2


### Objectives

Introduce the processing of genomic data obtained with high-throughput sequencing, using transcriptome libraries (RNA-seq) as an example. Although RNA-seq has many other uses (e.g. studying differential expression), we will focus on processing the data for phylogenomics. By the end of the tutorial we will have aligned sequences of orthologous genes.


### The FASTQ file

In the previous tutorial, we downloaded some sequences in FASTQ format. Go to the folder where they were saved so we can examine them.

```bash
cd ~/phylogenomics/data/raw-rnaseq
```

Since the file is compressed (.gz), the editors we have seen may not work. We can use 'gzip' to decompress a file. However, since we work with very large files, it is better to keep them compressed. For very large compressed files (.gz), the 'zless' program is an efficient way to view them. Look at one of the files we just downloaded:

```bash
zless SRR6381066_1.fastq.gz
```

Notice that in the first and third lines of each sequence we have the information we asked to change with the options --defline-seq and --defline-qual.

Another way to view files is with the 'head' and 'tail' commands, which print the first or last lines of a file in the terminal. Again, because the format is .gz, these commands will not work directly. However, we can use a *pipe* to temporarily decompress the file and run the command.


```bash
gunzip -c SRR6381066_1.fastq.gz | head -n 16
```

Here, '-c' tells gunzip not to change the original file, only to decompress it and keep the result temporarily in memory as *standard output*. The '|' sign (*pipe*) means that the output of the previous program will be used as input for the next command, 'head'. The '-n' option tells it to print only the first 16 lines (the command's default is 10).
The 'tail' command works the same way, but prints the last lines of the file.
Use what you have learned so far to create a file with the last 80 lines of the file SRR6381066_1.fastq.gz. Save this file as "last_lines.fastq" in the "exercises" folder inside the phylogenomics folder.

The same idea can be used with the 'cat' command (which prints all lines) to count the number of sequences in each file. Remember that each sequence in a fastq file is represented by 4 lines. We can use the wc (*word count*) command with the '-l' option to count the lines of the file opened with 'cat'.

```bash
 gunzip -c SRR6381066_1.fastq.gz | cat | wc -l

# The result is the total number of lines.
# Divide it by four and you will know the number of reads in the file.
```

If we want to do this for every file in the folder, we can use a *loop* with *wild cards* and variables.
Variables are created with the "=" sign and are called by putting "\$" in front of the name chosen for the variable. If they contain a command or an operation, we define the variable with "\=\$(command)". Example:

```bash
Name='Guilherme'
Age=35
City='Belo Horizonte'
Birth=$((2021-$Age))


echo Hello, my name is $Name, I am $Age years old and I was born in $City in $Birth.

Files=$(ls -1 | wc -l)

echo There are $Files files in this folder

```

What we want in this case is: for each file "i" in the folder ending in .fastq.gz, use gunzip in a pipe to print (invisibly) the whole file and count the number of lines. Then we want to divide this number of lines by 4 and print the file name in the terminal followed by the number of reads. Translating this into bash, we can write:

```bash
for i in *.fastq.gz
 do
  lines=$(gunzip -c $i | cat | wc -l)
  seqs=$(($lines/4))
  echo $i $seqs
 done
```



### Cleaning and preparing the sequences


Now that we have the sequences, let's remove reads with poor quality and reads that contain adapters. For this we will use [trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic). Installing Phyluce automatically installs trimmomatic. You can simply load the environment where Phyluce is installed and use trimmomatic. If you need, or want, to install it in a different environment, you can use conda or whatever way you think is best.

```bash
conda install trimmomatic
```

There are many parameters that can be explored in trimmomatic, but here we will use options similar to the phyluce defaults. For more details see the program's [manual](http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf) and [page](https://github.com/usadellab/Trimmomatic).
One of the parameters to pay attention to is ILLUMINACLIP, which searches for adapters. It depends on how the library was built. Here we will use the "TruSeq3-PE" standard. Download the fasta file from the GitHub page:

```bash
cd ~/phylogenomics/data
wget https://github.com/usadellab/Trimmomatic/blob/main/adapters/TruSeq3-PE.fa
```


These adapters are generally used by the HiSeq and MiSeq platforms, but they may not be appropriate for some libraries. If you do not know exactly which adapters were used, you can create custom files, or use a file concatenating all the adapter types provided by trimmomatic (see the [manual](http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf)).


Trimmomatic processes one file at a time. To be more efficient, let's write a *loop* to make our work easier.

First, let's create an output folder called "clean_rnaseq" in the phylogenomics/data folder

```bash
cd ~/phylogenomics/data
mkdir clean_rnaseq
```

Create a csv file in which each line has the reads and the name of the sample you want to process, separated by commas. Save it as "inputs.csv". You can do it in Excel or in a text file. You can also use the command line if you want to practice.

```bash
echo 'SRR6381066_1.fastq.gz,SRR6381066_2.fastq.gz,Habronattus_roberti
SRR6381055_1.fastq.gz,SRR6381055_2.fastq.gz,Habronattus_sansoni
SRR6381090_1.fastq.gz,SRR6381090_2.fastq.gz,Habronattus_aztecanus
SRR6381065_1.fastq.gz,SRR6381065_2.fastq.gz,Habronattus_altanus
' > input_files.csv
```

Now, let's use this file to create a variable in the *shell*.

To create our variable with the inputs for trimmomatic we can use:

```bash
Inputs=$(cat input_files.csv)

echo $Inputs
```


We also need to create a variable with the path to the folder with the fastq files and to the output folder

```bash
rawreadspath=~/phylogenomics/data/raw-rnaseq
outdir=~/phylogenomics/data/clean_rnaseq
```

Now we can start our *loop*. What we want to do is: for each element "i" in the "Inputs" list, use the first element before the comma as the argument for the file with reads 1, the second element as the file with reads 2, and the third element as the output name. We also want the output to be organized in a way that phyluce can use (you will see the details later). Translated into bash, it looks like this:




```bash
for i in $Inputs
  do
    # Selects the first comma-delimited element of $i and creates
    # a variable for it called r1
    r1=$(echo $i | cut -f1 -d",")

    # Second element
    r2=$(echo $i | cut -f2 -d",")

    # Last element, which is the species name
    sp_name=$(echo $i | cut -f3 -d",")

    # Prints a message in the terminal just to know which file the loop is processing
    echo "Processing "$sp_name""

    # runs trimmomatic to process sample $i.
    # Adjust the number of threads for your computer
    trimmomatic PE -threads 14 \
       $rawreadspath/$r1 \
       $rawreadspath/$r2 \
       $sp_name"-READ1.fastq.gz" \
       $sp_name"-READ1-single.fastq.gz" \
       $sp_name"-READ2.fastq.gz" \
       $sp_name"-READ2-single.fastq.gz" \
       ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads \
       LEADING:5 TRAILING:15 SLIDINGWINDOW:4:15 MINLEN:40

    # Since phyluce merges the unpaired reads 1 and 2,
    # we do the same using cat and remove the original unpaired files
    cat $sp_name"-READ1-single.fastq.gz" \
        $sp_name"-READ2-single.fastq.gz" \
        > $sp_name"-READ-singleton.fastq.gz"
    rm $sp_name"-READ1-single.fastq.gz" $sp_name"-READ2-single.fastq.gz"

    # We organize the files in folders the way Phyluce needs them
    mkdir $outdir/$sp_name
    mkdir $outdir/$sp_name/split-adapter-quality-trimmed
    cd $outdir/$sp_name/split-adapter-quality-trimmed
    mv ../../../*READ*.fastq.gz .
    cd ../../..

 done
```


At the end you should have one folder for each species and, inside it, a folder called "split-adapter-quality-trimmed" with the clean sequences.

## Class 3


### Quality Control


In the previous tutorial, we cleaned the sequences. Probably many were removed because of low quality or length.
Think of a way to count the number of sequences in each file, as we did before for the *raw reads*. Compare the numbers before and after trimmomatic.

To check the quality of the sequences, we can use [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/). Use conda to install the program.

```bash
conda install fastqc
```

FastQC takes a list of fastq files as input. It looks for common problems, such as the presence of adapters and low sequence quality. Since our files are organized in different folders, we have to create a loop to go into each folder and use the files as input. We also want to copy all outputs to a single folder. Try to think of a way to do this before looking at how I do it. Check the fastqc help to learn about the options.

```bash
cd ~/phylogenomics/data
mkdir fastqc_output
cd fastqc_output
out_dir=$(pwd)
cd ../clean_rnaseq
species_folders=$(ls)

for species in $species_folders
  do
    cd $species/split-adapter-quality-trimmed
    fastqc -o $out_dir *.fastq.gz
    cd ../..
  done
cd $out_dir
rm -r *.zip
cd ..
```

Try to understand what was done above and what each command means.
Open the results (on Windows) and compare them with what is explained in the program's [manual](https://dnacore.missouri.edu/PDF/FastQC_Manual.pdf).


### *Assembly*


Two programs are most commonly used for *assembly*: [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki) and [SPAdes](https://github.com/ablab/spades). Both can be installed easily with conda. [Studies](https://doi.org/10.1093/gigascience/giz039) show that the two are very similar and work well in most cases. Depending on the goal, one may be more suitable than the other (e.g. for quantifying isoforms Trinity may be slightly better). For phylogenies in which we want many single-copy orthologous genes, SPAdes often works better ([Holzer and Marz, 2019](https://doi.org/10.1093/gigascience/giz039)). From my own experience I have preferred SPAdes (it usually recovers more loci, and the loci are longer), but you can experiment and see what works best for your data.
SPAdes has several modules (spades, rnaspades, metaspades...). For RNA we can use either spades or rnaspades, and spades with some specific settings may be better than rnaspades ([Holzer and Marz, 2019](https://doi.org/10.1093/gigascience/giz039)). Here we will use it this way to assemble the clean sequences we processed earlier. SPAdes is installed with phyluce and you can use it by activating the phyluce environment (but check the version; if I am not mistaken it may not be the most recent one). Alternatively, you can install it in another environment. This tutorial was tested with version 3.15.2 and may not work with older versions (3.13, for example).

```bash
conda install spades=3.15.2
```


SPAdes takes the clean sequences as input (*read* 1, *read* 2 and *single*). Let's write a *loop* to go into each folder and process the files, sending the output to another folder.
The program has many options that can be explored (see the instructions on the [website](https://github.com/ablab/spades)). Here we will use the options suggested by [Holzer and Marz (2019)](https://doi.org/10.1093/gigascience/giz039), similar to those used in phyluce: --sc --careful --cov-cutoff auto. The options:
1. '--sc' (*single cell*) is suitable for RNA-seq and UCEs because genome coverage is uneven.
2. '--careful' tries to reduce mismatches and short *indels* (may not be good for large genomes).
3. '--cov-cutoff auto' removes contigs with low coverage, selecting a threshold automatically.

```bash
cd ~/phylogenomics/data

mkdir spades_assembly
cd spades_assembly
outfolder=$(pwd)
cd ..

cd clean_rnaseq
speciesfolders=$(ls)

# in the command below, adjust the memory and the number of threads (-t) for your computer
for i in $speciesfolders
  do
    echo "Processing "$i""
    spades.py --sc --careful --cov-cutoff auto --memory 24 -t 12 \
     -1 $i/split-adapter-quality-trimmed/*-READ1.fastq.gz \
     -2 $i/split-adapter-quality-trimmed/*-READ2.fastq.gz \
     -s $i/split-adapter-quality-trimmed/*-READ-singleton.fastq.gz \
     -o $outfolder/$i
done
```

**Note:** For some samples in the chosen dataset, the file with single reads may have 0 sequences. In that case, remove the -s line from the SPAdes command.

Assembly may take a while depending on the computer and the size of each file.


## Class 4


### Assembly - continued

In the last tutorial we left SPAdes running. If it has not finished, cancel the process and download the folder with the results to continue.
Make sure you are in the folder we chose for the output
```bash
cd ~/phylogenomics/data/spades_assembly
```

Notice that SPAdes generates many files and folders for each species.

```bash
ls -lh
ls -lh Habronattus_roberti

# note the -lh option (human readable) to show file sizes in KBytes.
```


Check the output to see whether there was any problem. We can look at the last lines of the spades.log file. If something unusual happened during the run, the program saves a file called "warnings.log". You can check which species had warnings across all folders with a *loop* and 'grep'. We can use the 'grep' command to print lines that contain a given character or word. See the command's help and note the '-c' option: with it, instead of printing the line, we count how many times a line with the pattern appears. We use 'ls' to list the files and grep to count how many times the file "warnings.log" appears in each folder.

```bash
for i in $(ls)
  do
    warning=$(ls $i | grep -c "warnings.log")
	echo $i $warning
  done
```

The command above printed the species names with 0 for those without warnings and 1 for those with warnings. Check the message.


The file we are really interested in is "contigs.fasta". We want to copy all these files to a single folder and rename them with the name of each species.
First, let's create a folder for the contigs.

```bash
cd ~/phylogenomics/data
finalcontigsfolder=spades_contigs
mkdir $finalcontigsfolder
```

Now we create an *ARRAY* variable (a list, or vector) with the names of the folders in the SPAdes output folder. If you are working continuously and have not closed the terminal, you already created a variable with the path to the output folder ("$outfolder") in the previous *loop*, and you can use the same variable for this loop. Otherwise, define the variable again.

```bash
cd ~/phylogenomics/data
outfolder=spades_assembly
resultsfolder=$(ls $outfolder)

for i in $resultsfolder
do
  cp $outfolder/$i/contigs.fasta $finalcontigsfolder/$i.fasta
done
```

Done! Now we have the contigs in a single folder, organized as one fasta file per species. We can count the number of contigs per species. In a fasta file, sequences are marked by the ">" sign, so we can use 'grep -c' again. You can use a wild card to count for all species in the folder

```bash
grep -c ">" spades_contigs/*.fasta
```

You can use what you have learned to save this result in a .txt file.


Try doing the same, but using the RNA option of SPAdes. Use the program's help ('spades.py --help') and the [manual](https://cab.spbu.ru/files/release3.14.1/rnaspades_manual.html).

Also try installing and using [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki) in a similar way to what we did here! Since the Trinity output is a little different, you will have to make more adjustments to your script. Compare the results of the three methods.

### Removing Isoforms

A gene can be transcribed in several ways through alternative *splicing*. When we use Trinity and rnaSPAdes, possible isoforms are identified in the process. For phylogenies, isoforms are not of interest. Although, depending on the method we use, they may not interfere with orthology detection, the redundancy of sequences can make the process slower. Trinity has a helper script that keeps only the longest isoform. You can download the script [here](https://github.com/trinityrnaseq/trinityrnaseq/tree/master/util/misc) and use it if you assembled with Trinity or rnaSPAdes. Adapt the loop below to your case. If you did not run Trinity or rnaSPAdes, skip the script below.

```bash
cd ~/phylogenomics/data

wget \
https://github.com/trinityrnaseq/trinityrnaseq/blob/master\
/util/misc/get_longest_isoform_seq_per_trinity_gene.pl

# Create an output folder and a variable with its path
mkdir contigs_isormoved
cd contigs_isormoved
output_folder=$(pwd)
cd ..

# define a variable with the path to the folder
folder_with_contigs=path/to/your/folder/with/the/contigs

filelist=$(ls $folder_with_contigs)
cd $folder_with_contigs
for file in $filelist
 do
   perl ../get_longest_isoform_seq_per_trinity_gene.pl $file > $output_folder/$file
 done
```


Since we used SPAdes in the example, the script above will not work. To remove redundancy from assemblies made with SPAdes, we will use [CD-HIT](http://weizhong-lab.ucsd.edu/cd-hit/).



```bash
cd ~/phylogenomics/data

conda install cd-hit

# Define the input folder as a variable
cd spades_contigs
inputfolder=$(pwd)
cd ..


# define the output folder
mkdir spades_contigs_cd-hitout
cd spades_contigs_cd-hitout
output=$(pwd)
cd ..


names=$(ls $inputfolder)

for file in $names
  do
    cd-hit-est -i $inputfolder/$file -o $output/$file \
               -c 0.95 -n 10 -M 0 -T 20 -sf 1
  done

# The program generates two output files for each input file
# To keep things tidy, let's move the .clstr files to another folder

mkdir spades_contigs_cd-hitout_clstrfiles
mv spades_contigs_cd-hitout/*.clstr spades_contigs_cd-hitout_clstrfiles

```

How many sequences were removed? Use what you have learned to create a file with the number of sequences for each species before and after.


**Note:** CD-HIT, although widely used, may not perform well ([Chen et al., 2019](https://doi.org/10.1093/bioinformatics/btz620); [Behera et al., 2020](https://doi.org/10.1145/3388440.3412424)). When the genome has many long introns, alignments can be difficult, as explained in the [manual](https://github.com/weizhongli/cdhit/wiki/3.-User's-Guide#CDHIT2D). However, most tests focus on differential expression, and few focus on phylogenetic analyses. SPAdes with the '--sc' option recovers single-copy orthologs well and tends to group isoforms into the same contig ([Holzer and Marz, 2019](https://doi.org/10.1093/gigascience/giz039)). Therefore, combining SPAdes --sc with CD-HIT may be efficient.


## Class 5


### Inferring Orthology

There are several methods to infer orthology among contigs, reviewed in [Fernandez et al. (2020)](https://hal.archives-ouvertes.fr/hal-02535414) and [Nichio et al. (2017)](https://doi.org/10.3389/fgene.2017.00165). Phylogenies built from transcriptomes can be sensitive to orthology inference in some cases ([Cheon et al., 2020](https://doi.org/10.1093/molbev/msaa181)). Here we will use two commonly used methods that have proven efficient: [OrthoFinder](https://github.com/davidemms/OrthoFinder) and [BUSCO](https://busco.ezlab.org/).

#### OrthoFinder

Install OrthoFinder using conda

```bash
conda install orthofinder
```

OrthoFinder is very simple to run. We only need a small extra script to add the species name to the sequence headers in the contigs file. For this we will use the 'sed' command (*Stream Editor*). Its help and manual are not very clear about how to use it, but there are good explanations on the internet, such as [this one](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/) or [this one]( https://www.linuxteck.com/sed-commands-in-linux/). A simple way to use the command is 'sed -i "s/what_goes_out/what_goes_in/g" target.file' where:
-i means the substitution is made in the original file (instead of printing to the screen)
 s means the operation is a substitution
 / marks the boundary between the expressions that will be substituted
 g means the operation is applied to all occurrences in the line (*global*)

Example:
```bash
echo Hello, I am Guilherme. > example_file.txt

sed "s/Guilherme/Doug/" example_file.txt

# Note that the file was not modified, although the substitution was shown on the screen

cat example_file.txt

# To substitute in the file we use -i

sed -i "s/Guilherme/Doug/" example_file.txt
cat example_file.txt

# If we do not use g we get:
sed -i "s/ /_/" example_file.txt
cat example_file.txt

# Using g
sed -i "s/ /_/g" example_file.txt
cat example_file.txt

rm example_file.txt
```



Open the assembly file and notice that the sequences have names like ">NODE_1_length_6859_cov_1401.737360", and we want them to look like ">Genus_species | NODE_1_length_6859_cov_1401.737360". Before looking at the way suggested below, think about how you would do it.


What we suggest here is simply to replace ">" with ">Genus_species | ".


First, let's create an output folder by copying the original folder under another name, to make sure that if something goes wrong we do not lose what we did in the last step.

```bash
cd ~/phylogenomics/data

cp -r spades_contigs_cd-hitout spades_contigs_cd-hitout_renamed

cd spades_contigs_cd-hitout_renamed
files=$(ls)

for file in $files
  do
    echo "Processing $file"
    name=$(echo $file | cut -f1 -d".")
    string_to_add=">"$name" | "
    sed -i "s/>/$string_to_add/g" $file
  done

cd ..
```

Check the result using whichever command you prefer.

OrthoFinder has many options that you can learn more about on its [website](https://github.com/davidemms/OrthoFinder). Here we will use it in the simplest way, which takes the folder with the sequences as input. We also have to specify that the data are DNA and not amino acids with the '-d' option, and the number of processors (-t). We can also set the output with '-o', although it is not required.

```bash
cd ~/phylogenomics/data

orthofinder -d -f spades_contigs_cd-hitout_renamed -t 14 -o OrthoFinderResults
```

Read the details about the output on the program's [page](https://github.com/davidemms/OrthoFinder). For phylogenetic analyses we are generally most interested in the single-copy genes, which will be in the *Single_Copy_Orthologue_Sequences* folder. There we have the sequences ready to be aligned.

**Note:** OrthoFinder looks for single-copy genes present in all (or nearly all) species (100% completeness). In some cases the result may be 0 single-copy orthologs, even though there could be many of them if we accept more missing species in each orthogroup. In any case, it can be useful to allow genes with missing species to increase the number of genes. That requires somewhat more complicated scripts that I will not cover in this class. If you have few species and genes, you can open the output Orthogroups.GeneCount.tsv in the Orthogroups folder to filter the genes and copy them from the Orthogroup_Sequences folder to a new folder.

#### BUSCO

Install BUSCO using conda

```bash
conda install busco
```

For more details on BUSCO options, see the [manual](https://busco.ezlab.org/busco_userguide.html#running-busco). Here we will use the simplest one, in transcriptome mode ('-m transcriptome'). BUSCO uses a database of curated genes based on a set of genomes. We should choose the database containing the organisms closest to our group. You can see the list of datasets with the command:
```bash
busco --list-datasets
```
If you are using the spider dataset we downloaded, you should choose arachnida_odb10. Remember to adjust the number of CPUs (-c).


```bash
cd ~/phylogenomics/data

busco -i spades_contigs_cd-hitout -o BuscoResults -m transcriptome -l arachnida_odb10 -c 14
```


In the output folder, notice that there is one folder for each species. The single-copy genes are in the folder "BuscoResults/Genus_species/run_arachnida_odb10/busco_sequences/single_copy_busco_sequences". Notice that we have one file per gene, and each file has one sequence (because they are single-copy). Since the same database was used for all species, the gene names are the same, and therefore the file names are the same. Note that we used the contigs folder without the species names, because BUSCO does not accept the way we renamed them. So we have to rename the output before combining all species into one file per gene. Look at the outputs and think about how you could do this. Try it; if you can't, there is a script below. Try to understand what the script is doing.


```bash
cd BuscoResults
folder_list=$(ls -d *.fasta)
n_species=$(ls -1 -d *.fasta | wc -l)

mkdir single_busco_combined
cd single_busco_combined
out_folder=$(pwd)
cd ..

for species_folder in $folder_list
  do
    species_name=$(echo $species_folder | cut -f1 -d".")
    cd $species_folder"/run_arachnida_odb10/busco_sequences"
    cp -r single_copy_busco_sequences single_copy_busco_sequences_renamed
    cd single_copy_busco_sequences_renamed
    file_list=$(ls *.faa)
    for i in $file_list;
	  do
        to_be_replaced=$(grep ">" $i)
        new_name=">"$species_name
        sed -i "s/$to_be_replaced/$new_name/g" $i
	done
    for i in $file_list
      do
    	cat $i >> $out_folder/$i
	done
  	cd ../../../..
  done
 ```

Now we can apply filters to the matrix, for example removing genes with fewer than 3 terminals, since we cannot infer a tree from them. For this we need a new tool: *if statements*. Put simply, *if* works like this: 'if [ *condition* ]; then *commands* fi'. For the *condition* we use operators such as:
-lt less than
-gt greater than
-eq equal
... among others (see more details in Figure 2 and at [this link](https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php)).

![*if operators*](/images/if_statement.JPG)

Example:
```bash
A=100
B=50

if [[ $A -gt $B ]]
  then
      echo $A is greater than $B
fi
```


The script below must be run after (without closing the terminal) the script that combined all species into one file per gene, because it uses the same variables.


```bash
cd $out_folder
file_list=$(ls *.*)
for i in $file_list
  do
    n_seq=$(grep -c ">" $i)
    if [[ $n_seq -lt 4 ]]; then
      rm $i
    fi
  done

cd ..
```

Now we can select matrices with different completeness, for example excluding all genes with fewer than 50% of the species present, or a 100% complete matrix. (In this example the 50% matrix will not exist, because we eliminated everything with fewer than 3 terminals, but the script is useful for other datasets.)

```bash
cp -r $out_folder $out_folder"_50p"
cd $out_folder"_50p"
file_list=$(ls *.*)
m50p=$(( $n_species / 2 ))
for i in $file_list
  do
    n_seq=$(grep -c ">" $i)
    if [[ $n_seq -lt $m50p ]]; then
      rm $i
    fi
  done
cd ..

cp -r $out_folder $out_folder"_100p"
cd $out_folder"_100p"
file_list=$(ls *.*)
for i in $file_list
  do
    n_seq=$(grep -c ">" $i)
    if [[ $n_seq -lt $n_species ]]; then
      rm $i
    fi
  done
cd ..
```

How many genes do we have in each matrix? Use your bash knowledge to count them.

The genes in these folders are ready for alignment. Note that these are amino-acid matrices, not nucleotides. For recent divergences this may not be ideal. With more complex scripts, it is possible to obtain the nucleotide sequences corresponding to each gene.


Note: There is a Python script made available by Jamie McGowan (2020) at this [link](https://github.com/jamiemcg/BUSCO_phylogenomics) to convert BUSCO output for phylogenomics.

### Alignment

To align, we can use mafft in a *loop* over the files in the folders obtained earlier.
To align the genes resulting from OrthoFinder, run the loop below in the program's output folder

```bash
cd ~/phylogenomics/data/OrthoFinderResults
cd Results_Dec03

input_folder=Single_Copy_Orthologue_Sequences

outputfolder=$(echo $input_folder"_mafft")

mkdir $outputfolder

cd $input_folder

files=$(ls)

for file in $files
  do
    echo "Aligning" $file
    outname=$(echo $file"-aligned")
    mafft --thread 16 --adjustdirectionaccurately --localpair --maxiterate 1000 $file > $outname
    mv $outname ../$outputfolder/$file
done

# since we used the --adjustdirectionaccurately option,
# we have to remove the _R_ that is added when a sequence is reverse-complemented.

cd ../$outputfolder
sed -i 's/>_R_/>/g' *.fa

echo "Alignment Finished"
```

Align the sequences resulting from BUSCO. Make the necessary adjustments to the commands.
