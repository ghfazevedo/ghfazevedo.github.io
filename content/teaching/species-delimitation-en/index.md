---
title: Molecular Methods in Species Delimitation
label: Tutorial · English / Português · 2017 / 2022
summary: Hands-on tutorials for species delimitation with molecular data used in the UFMG graduate course — from PHASE and recombination tests to BEAST2, GMYC, PTP, BPP and STACEY (updated from 2017 version).
date: 2022-11-01
toc: true
link_text: Open tutorial →
weight: 2
lead: "Arley Camargo, Caroline Batistim Oswald, Rafael Félix de Magalhães & Guilherme H. F. Azevedo · November 2022"
# Language switch shown at the top of the page
lang_label: English
translations:
  - label: Português
    url: /teaching/species-delimitation/
# The images are stored with the Portuguese version
resources_from: /teaching/species-delimitation
---

*This tutorial was originally written in Portuguese for a graduate course on species delimitation (2022) and translated into English. Commands, file names and screenshots are the same in both versions.*

## Links to online platforms and program downloads

- **Notepad++** — <https://notepad-plus-plus.org/downloads/>
- **GenBank** — <https://www.ncbi.nlm.nih.gov/genbank/>
- **Sequence Matrix** — <http://gaurav.github.io/taxondna/>
- **AliView** — <http://ormbunkar.se/aliview/>
- **MAFFT Server** — <https://mafft.cbrc.jp/alignment/server/>
- **Gblocks** — <http://phylogeny.lirmm.fr/phylo_cgi/one_task.cgi?task_type=gblocks>
- **PGDSpider** — <http://www.cmpg.unibe.ch/software/PGDSpider/>
- **jModelTest2** — <https://github.com/ddarriba/jmodeltest2>
- **MEGA 11** — <http://www.megasoftware.net/>
- **PHASE v. 2.1.1** — <http://stephenslab.uchicago.edu/phase/download.html>
- **SeqPHASE** — <https://eeg-ebe.github.io/SeqPHASE/>
- **Indelligent v. 1.2** — <http://dmitriev.speciesfile.org/indel.asp>
- **DnaSP v. 6** — <http://www.ub.edu/dnasp/>
- **TOPALi v. 2** — <http://www.topali.org/>
- **SplitsTree4** — <http://software-ab.cs.uni-tuebingen.de/download/splitstree4/welcome.html>
- **Mesquite** — <http://mesquiteproject.org/>
- **PopART** — <http://popart.maths.otago.ac.nz/>
- **BEAST2 package** — <http://www.beast2.org/>
- **Tracer** — <https://github.com/beast-dev/tracer/releases/tag/v1.7.2>
- **FigTree** — <http://tree.bio.ed.ac.uk/software/figtree/>
- **R** — <https://www.r-project.org/>
- **Rtools** — <https://cran.r-project.org/bin/windows/Rtools/>
- **RStudio** — <https://www.rstudio.com/>
- ***b*GMYC** — <https://sites.google.com/site/noahmreid/software>
- ***splits*** — <https://r-forge.r-project.org/R/?group_id=333>
- **mPTP web server** — <https://mptp.h-its.org/#/tree>
- **Structure** — <https://web.stanford.edu/group/pritchardlab/structure.html>
- **Structure Harvester** — <http://taylor0.biology.ucla.edu/structureHarvester/>
- **CLUMPP** — <https://rosenberglab.stanford.edu/clumpp.html>
- **distruct** — <https://rosenberglab.stanford.edu/distruct.html>
- **BPP** — <http://abacus.gene.ucl.ac.uk/software.html>
- **iBPP** — <https://github.com/cecileane/iBPP/blob/master/man/winexe.md>
- **Geneland** — <https://github.com/gilles-guillot/Geneland>

## 1. PHASE

PHASE is an algorithm that estimates the haplotype phases of heterozygous gene fragments. Phases are estimated by comparison with homozygous individuals.

For this task, you will need:

1. The sequences of each nuclear marker, separated, aligned and in FASTA format;
2. The PHASE executable;
3. Internet access to use the SeqPHASE web platform. This platform works in two steps. (1) It converts your FASTA file into the PHASE input formats. (2) From the analysis outputs, SeqPHASE converts the results back into FASTA files.

### Step by step

1. Open the SeqPHASE link, click “Step 1” and load your FASTA file in the “genotypes to be phased” option. Click “Run SeqPhase”.

![](images/image3.png)

![](images/image2.png)

2. Save the two files produced by the conversion (.inp and .const). This step is important, because you will need the ‘.const’ file to convert your results back into FASTA.

![](images/image6.png)

3. Open the Windows command prompt and drag the PHASE.exe file into it. Also drag the .inp file and give a name to the output (.out). We will use the syntax suggested by SeqPHASE (figure above). By default, PHASE only considers haplotypes with PP > 0.9 as resolved. However, we will use a 70% probability threshold to accept the estimated haplotype phases as correct (see **Garrick *et al*., 2010. Nuclear gene phylogeography using PHASE: dealing with unresolved genotypes, lost alleles, and systematic bias in parameter estimation. *BMC Evolutionary Biology*, 10: 118**). For this, we will use the option `-p0.7`.

![](images/image8.png)

4. When the run finishes, several output files will be generated. Two of them are important. The *.out* file has the consensus of the runs (haplotypes with PP < 0.7 keep their heterozygous positions). The *.out_pair* file lists all recovered pairs of haplotype phases and the probability of each pair. Open SeqPHASE, step 2, load the *.const* and *.out* files, uncheck the ‘Reduce sequences’ option and click ‘Run SeqPHASE’. After the conversion, click ‘Click here to download the generated Fasta file’.

![](images/image3.png)

![](images/image9.png)

Done! You now have the reconstructed haplotype phases of the nuclear genes.

> [!TIP]
> **Bonus!** If the chromatograms of your sequences show almost every position as heterozygous from a certain point onward, don’t despair. Your sequences are not bad. What happens is that the two haplotype copies are heterozygous for insertions and deletions (indels). The solution is easy! Manually add the codes for the heterozygous positions (e.g., M for C and A) and submit your sequence to the online tool **Indelligent**. This tool phases haplotypes that are heterozygous for indels and uses an algorithm different from PHASE.

## 2. Recombination Tests

Most of the coalescent models we will work with in this course have assumptions. One of them is the absence of recombination within gene fragments. In this course, we will learn how to run two of these tests. The first is the difference of sums of squares test (DSS) and the other is the Φ test for recombination.

For this task, you will need:

1. The sequences of each nuclear marker, aligned and in FASTA format (the metazoan mitochondrial genome is assumed not to recombine);
2. TOPALi and SplitsTree4 installed on your computer.

### 2.1 Difference of sums of squares (DSS)

**Step by step**

1. In TOPALi, click ‘File > Import Alignment’ and load your FASTA alignment using the option “by using an existing file on disk that already contains aligned DNA or protein”;
2. With the alignment open, click ‘Analysis > Recombination > DSS Analysis...’. The following window will open:

![](images/image11.png)

**Step size** is the length (in nucleotides) by which the algorithm moves along the alignment. **Window size** is the length of the sequence stretches the algorithm will scan for recombination breakpoints. The smaller the ‘window size’, the more rigorous the analysis, but the chance of a type II error (i.e., rejecting the null hypothesis of no recombination when it is true) is also high. If your fragment is very short (<400 bp) you are unlikely to find evidence of recombination, but running the test is a mandatory step to check whether the data fit the assumptions of coalescent methods. In the ‘Advanced’ tab you can set the bootstrap limit, the nucleotide substitution model (JC69 or F84), the number of analysis steps and the gap threshold. Leave everything as is. Set the ‘step size’ to 10 and the ‘window size’ to 20, check the box “Flexible window size” and click ‘Run’.

3. When the analysis finishes, a plot of DSS along the alignment will be generated. The x axis represents nucleotide positions, while the y axis represents DSS values. The blue curve represents the DSS values calculated along the sequence, and the dashed line represents the DSS value above which recombination is considered significant. Distinct peaks above this line indicate recombination breakpoints — for example, one at nucleotide position 26 and another at position 464.
4. If there is evidence of recombination, exclude the recombinant regions (in the example above, only the fragment between nucleotide positions 26–464 would be used in the coalescent analyses) and continue the analyses with the remaining fragment.

### 2.2 Φ test for recombination

**Step by step**

1. In SplitsTree4, open your alignment by clicking ‘File > Open...’ and selecting your FASTA file. The program will automatically compute a network of relationships among haplotypes using the NeighborNet algorithm.
2. After this analysis, click ‘Analysis > Conduct Phi test for recombination’. Unlike DSS in TOPALi, you will not be able to set the analysis parameters. But don’t worry: SplitsTree4 determines specific settings for each fragment.
3. The result of this analysis is statistical rather than graphical, as in DSS. After clicking the last option, a window will open with the detailed results.

![](images/image12.png)

The Φ test for recombination is better suited to short fragments and population samples, which is usually the case for data used in species delimitation. However, checking your data with independent methods provides a robust test of hypotheses. Try running the Φ test and then using the same ‘window size’ estimated by SplitsTree in the DSS settings. If the results disagree, pay attention to the efficiency of each method in each case and see where your data fit. While DSS works well for long fragments, the Φ test works better under the conditions mentioned above.

## 3. jModelTest

jModelTest is a program for testing the fit of models of molecular evolution to the data.

For this task, you will need:

1. The sequences of each nuclear marker, separated, aligned and in FASTA format.
2. jModelTest.

**Step by step**

1. Open jModelTest and load your alignment.

![](images/image13.png)

2. Under “Analysis” choose “Compute likelihood score”.
3. Choose only 3 substitution schemes (the most basic models implemented in the programs) and click “Compute likelihoods”.

![](images/image14.png)

4. The output gives the likelihood of each model on an estimated tree, the number of parameters (K) and the parameter values that maximize the likelihood.

![](images/image15.png)

5. Under “Analysis” select “do AIC calculations”.
6. The result shows the best-fitting model and the AIC values of all models.

![](images/image16.png)

## 4. BEAST2

BEAST 2 is a program that offers a range of models for Bayesian phylogenetic and population analyses. We will use it to estimate species trees under the coalescent model, to test the molecular clock model, and to test two predefined species-boundary hypotheses, accounting for uncertainty in the topology of the genealogies, the phylogeny and the model parameters.

For this task, you will need:

1. The sequences of each nuclear marker, separated, aligned and in FASTA format. The sequence name must include a standardized species identifier, for example:

![](images/image17.png)

2. The BEAST v. 2.7.x package, including BEAUti, TreeAnnotator and DensiTree;
3. Tracer and FigTree, which must be downloaded separately.

**Step by step**

1. Open BEAUti.exe, click ‘File > Manage Packages’ and install the packages ***b*ModelTest** and **starbeast3** by selecting them and clicking ‘Install/Upgrade’.

![](images/image18.png)

![](images/image20.png)

2. Once installation is complete, click ‘Close’ to close the BEAST 2 Package Manager window and return to BEAUti.
3. To enable StarBEAST3, click ‘File > Template > StarBEAST3’. Note that new tabs such as ‘Taxon Sets’ and ‘Gene Ploidy’ become available in this template.

![](images/image21.png)

4. Import the alignments (or simply drag the files into the BEAUti window). Clicking the ‘+’ button in the lower-left corner of the window also works to open the sequences. Select ‘all nucleotide’ and click ‘OK’ to confirm the data type of your alignment. Note that each gene will have its own tree, clock model and site model. You can change this if needed. **Important:** if you have two or more mitochondrial fragments, select them and click ‘Link trees’, since they are not independent.

![](images/image23.png)

5. In the “Taxon Set” tab click “Guess” and then choose how to find the information that indicates which species each sequence belongs to. In the example, it is the last word after the last “_”.

![](images/image25.png)

6. In the ‘Gene Ploidy’ tab, set the value of the mitochondrial gene to ¼ of the value of the nuclear fragments. By default, ‘ploidy’ is 2.0 for nuclear fragments. So, for the mitochondrial fragment the value should be set to 0.5.

![](images/image27.png)

7. In the ‘Site Model’ tab select ‘BEAST Model Test’ and the *allreversible* option under ‘Model Set’. Do this for all fragments. This way, the best-fitting substitution models will be co-estimated with the species tree and the gene tree of each sampled fragment.

![](images/image28.png)

8. In the ‘Gene Clock Model’ tab, check all partitions. This way, the clocks of all fragments will be estimated.

![](images/image30.png)

9. In the ‘Species Clock Model’ tab we set the molecular clock model. To start, we will use a strict model, ‘Species Tree Strict Clock’. If you have information on the substitution rate (mutations per unit time), set it in the ‘priors’ tab (see below). Check the ‘estimate’ box so that the branch lengths of the species tree correspond to divergence times.

![](images/image31.png)

10. If we have a known nucleotide substitution rate for one of the fragments, we can use it to calibrate our species tree. In our example, we will use the rate proposed for invertebrate mitochondrial sequences (0.0115 substitutions per lineage per million years; Brower 1994). To do this, in the “priors” tab, we will fix this value for the mitochondrial fragment. Under *clockRate.c:Mit_cod* there are two option boxes. In the first, set to ‘Log Normal’ by default, we have the prior distribution of the parameter. In the second, shown as ‘initial = [1.0] [0.0, ∞]’, we can click and fix a value for the parameter. Replace the ‘value’ box with 0.0115 and uncheck ‘Estimate’. For more details on setting up molecular clocks, see <https://beast2-dev.github.io/hmc/hmc//Priors/ClockPrior/>

![](images/image33.png)

> [!NOTE]
> It is important to know the difference between the “substitution rate” in the “site model” tab and the “clock rate” in the “clock model” tab. The first is the relative rate among partitions, while the second is the rate of the partition in substitutions per unit time. For more details on how to use both, see <https://www.beast2.org/2015/06/23/help-beast-acts-weird-or-how-to-set-up-rates/>.

11. Still in the ‘priors’ panel, change the distribution of the ‘SpeciesTreeStrictClockRate’ and ‘popMean’ parameters from 1/X to ‘Log Normal’ and ‘Gamma’, respectively, because the 1/X distribution yields an improper prior when the minimum and maximum bounds of the parameter are unknown (which is the case most of the time). The population size of the species-tree branches is assumed to follow a gamma distribution, with a shape parameter (“shape” k=2) and a scale parameter ψ (the “popMean” option). This is where we set the prior on mean population size. The mean of this distribution is 2ψ. That is, if we know that current populations have on average Ne=1000 and we want the mean to have this value, we should set the parameter to 500. However, the program default is an uninformative prior, so this would only be the initial value. To change this, we need to edit it in the “Priors” tab. In the example we will keep the default, but use whatever you think is best for your data.

![](images/image35.png)

12. Still in the “priors” tab, we define the prior probability distribution of each of the remaining parameters. We will keep the defaults, but if you have strong information about a parameter for your data, you can change it here.
13. Finally, we set the details of the Markov chain search. In our example, we will run 10000000 generations, sampling every 2000. Change the ‘Log Every’ boxes to 2000 in all options (i.e., tracelog, speciesTreeLogger and the treelogs of the gene trees).

![](images/image37.png)

14. Save your file, open it in BEAST.exe and start the analysis.

![](images/image39.png)

15. When the run finishes, the program reports some information about the MCMC. If your search was not good and you need to run more generations, you can use the “tuning” suggestions to reach convergence faster. Save this as a .txt file to use later if needed. And ask one of the instructors for more details.

![](images/image40.png)

16. Open the .log file in Tracer. Check that the ESS is adequate (greater than 200, although between 100 and 200 is acceptable) and that the parameters have stabilized. If the run was not good, run it again changing the operators and/or increasing the number of generations (for more information, see <https://www.beast2.org/increasing-esss/> and talk to the instructors).

![](images/image41.png)

17. To test the molecular clock, load the .xml file made in the previous steps into BEAUti.exe through the “File” menu by selecting “Load”. In the “Clock Model” tab select “Relaxed Clock Log Normal” for each marker. Remember to change the output file names in the MCMC tab.

![](images/image42.png)

![](images/image43.png)

![](images/image44.png)

18. Save the file and repeat steps 14 to 16.
19. If the run is good, open both .log files in Tracer by clicking the “+” sign. In our case, the files are H1_strict.log and H1_relaxLogNorm.log.
20. As discussed in class, there are several ways to compare hypotheses (models). First we will use the AICM calculated from the posterior distribution of the likelihood. In Tracer, in the “Analysis” menu, select “Model comparison”.

![](images/image45.png)

21. In the next menu, select the likelihood trace, the type of analysis (AICM) and the number of bootstrap replicates.

![](images/image46.png)

22. The result shows the AICM of each hypothesis. The one with the lowest AICM is the one that best fits the data. In our case the strict clock model is better.

![](images/image47.png)

23. Now let’s test the species-boundary hypotheses. We already have the result of the run treating the 4 species as distinct species. Now we will test the hypothesis that species sp3 and sp4 are not distinct evolutionary lineages. In BEAUti, load the xml file of the best molecular clock tested in the previous step. In the “Taxon sets” tab, use the filter to find all individuals belonging to species sp4. Then, in the “Species/Population” column, indicate that these individuals belong to sp3. You can change only the first one, select all of them and then click the “fill down” button. Change the output file names in the MCMC tab and save.

![](images/image48.png)

24. In BEAST.exe, run the analysis from the file you just saved. Then open the .log file in Tracer to check whether the run was good.
25. To test the two delimitation hypotheses, you can use the AICM, as we did in steps 20, 21 and 22. A better way is to estimate the marginal likelihood of each model by “path sampling” and calculate the Bayes factor between the two hypotheses. To do this, open AppStore.exe from the BEAST package and select the “PathSampling” app.

![](images/image49.png)

26. Select the xml file corresponding to one of the hypotheses and the run parameters.

![](images/image50.png)

27. At the end of the run, the log marginal likelihood of the model will be given. Do the same for the other delimitation hypothesis and calculate LogBayesFactor = LogL H0 – LogL H1. Positive values favor hypothesis 0, while negative values favor hypothesis 1. You can also use the table below.

![](images/image51.png)

You can find more details on how to run “Path Sampling” by editing the xml at this link: <https://www.beast2.org/path-sampling/>

28. To visualize the genealogies and phylogenies, we summarize the trees with the highest posterior probability using TreeAnnotator. Open TreeAnnotator.exe, select the “burnin” percentage, the tree and node-height options, and the input and output files. For the phylogeny, select the “...species.trees” file. The genealogies will be named after the alignment file of each marker (if you did not change this in BEAUti).

![](images/image52.png)

29. You can view each tree separately in FigTree. If you have the same taxa sampled for all genes, you can edit a nexus file with the best tree of each gene to see the incongruence among genealogies with DensiTree (figure below).

![](images/image53.png)

## 5. Visualizing genealogies within phylogenies with Mesquite

For this task, you will need:

1. Mesquite;
2. The species trees and genealogies in a nexus file.

**Step by step**

1. Open the gene tree in Mesquite (right-click and select “open with” if Mesquite is not the default program).
2. Open the species tree through the “Taxa&Trees” menu, then “Import files with trees”, “Include contents...”.

![](images/image54.png)

3. Associate species and individuals. In the “Taxa&Trees” menu select “New Association” and then select the Taxa block that corresponds to the species tree (in our case Taxa2).

![](images/image55.png) ![](images/image56.png)

4. Select the species and, in the right-hand column, select the individuals that belong to that species by clicking “+”.

![](images/image57.png)

5. Open a tab with one of the trees by clicking the tree in the left-hand column menu and then clicking “View Tree”.

![](images/image58.png)

6. In the “Display” menu select “Tree form” and then “Contained Gene (or Other) Trees”.

![](images/image59.png) ![](images/image60.png)

7. For a better view, uncheck the option “Use branch lengths of contained”.

![](images/image61.png)

8. From here you can edit the tree using the tools and menus of this tab. When it is ready, you can export it as PDF through the “File” menu.

![](images/image62.png)

## 6. Haplowebs

Haplowebs is a graphical method for species delimitation proposed by Flot and colleagues (2010). The model is quite simple and starts from the following premise: sets of exclusive alleles that group individuals across multiple independent markers are considered candidate species. These groups are delineated through the co-occurrence of alleles in the diploid phase. Each group of individuals is called a *field for recombination*.

For this exercise, you will need:

1. The phased and aligned nuclear fragments;
2. Internet access to use the HaplowebMaker web platform;
3. An image editor, or printed haplotype networks for each fragment.

**Step by step**

1. For this activity, you will need one file per fragment, containing its phased and aligned sequences in FASTA format. All sequences in each file must have the same length and contain no ambiguous nucleotides or special characters.
2. Open the HaplowebMaker [link](https://eeg-ebe.github.io/HaplowebMaker/) and give your project a name.

![](images/image63.png)

3. Click “Choose files” and load your alignments. When the file window opens, select all fragments you want to evaluate at the same time. Don’t forget to choose the individual delimiter of your sequences.

![](images/image64.png)

4. Click Advanced settings and choose the settings of your analysis. Choose how *indels* should be treated (*missing* or 5th state), how the program should handle ambiguous characters (error or mask), the algorithm used to build the haplotype network (*median joining* or *minimum spanning network*) and what the area and thickness of the circles will represent. For this exercise, we will keep all options at their defaults. Then click *Submit Job*.

![](images/image65.png)

5. The program will open a new page with the analysis progress bar and an overview box for each submitted fragment. These boxes summarize several statistics, including the number of variable positions, the number of haplotypes (and median vectors, if applicable) and the number of fields for recombination (FFRs). Progress is usually fast; if it stalls at some value for a while, check whether all files were read correctly (in the overview box of each fragment), without errors or question marks.

![](images/image66.png)

6. Just below we find our results. The first column under *Actions* lets us view the result in a new browser tab and the second lets us download it.

![](images/image67.png)

7. Among the results are the haplotype networks of each fragment, with the fields for recombination. Click ‘View’ on the item ‘alfa.fasta.svg’ to examine it.

![](images/image68.png)

8. It will open a new tab with the result.

![](images/image69.png)

9. To edit your network, click ‘edit’.

![](images/image70.png)

10. In this window we can change some features of the haplotype network. Explore the program to choose the colors and size of the network. When it looks the way you want, click ‘Save’.

![](images/image71.png)

11. The automated version of haploweb construction allows a combined analysis of all data. Click ‘View’ on ‘CoMa’ to view the conspecificity matrix (*Conspecificity Matrices*).

![](images/image72.png)

12. This turns the partition matrix into a conspecificity matrix and sorts it, producing a figure in which each species appears as a square along the diagonal.

![](images/image73.png)

13. You can save your whole project, or each image and matrix separately.

![](images/image74.png)

## 7. Structure

Structure is a model-based probabilistic method for clustering individuals. The idea behind the algorithm is to find a number of populations (K) that minimizes Hardy-Weinberg disequilibrium overall. An important assumption of the model is that the fragments used are in linkage equilibrium (i.e., they evolve *quasi*-independently). In the exercise below we will run an analysis with diploid markers (microsatellites, SNPs, nuclear sequences, ...). However, you can also run an analysis using only plastid markers, with a few modifications (see the program manual).

For this task, you will need:

1. Structure installed;
2. CLUMPP and DISTRUCT downloaded;
3. Internet access to use the online tool Structure Harvester;
4. At least two independent diploid markers.

**Step by step**

1. Let’s build the input for the analyses. Here your characters are the haplotypes of each sequence. Even if you have multiple segregating sites in each sequence, you cannot use them as independent characters, because they are all in linkage disequilibrium within each marker. So, use DnaSP to list all your haplotypes. The input consists of the following elements: (1) the first line contains the marker names, (2) the following lines contain the information for each individual, with every two consecutive lines corresponding to one individual (**the names must be identical for each individual**). (3) The first column contains the individual names, (4) the second column may contain prior information (e.g., collecting locality or populations identified by each method) and (5) each of the following columns contains information about the markers. In this case, every two columns hold the two alleles of each marker. Missing data are coded as ‘-9’. Note that columns are separated by spaces. Enter the number of each haplotype in the marker rows.

![](images/image75.png)

> [!TIP]
> **Bonus!** This whole process can be automated. All you need is a NEXUS file with the concatenated nuclear sequences and partition blocks identifying the character boundaries (*charsets*) and, if there is prior information, partitions with *taxset*. For example:
>
> ```
> begin sets;
> charset marcador1 = 1-561;
> charset marcador2 = 562-1226;
> taxset population1 = PHY331_ayeaye_typeloc PHY89_ayeaye_SaoRoque …;
> taxset population2 = PHY402_oreades_Brasilandia PHY360_oreades_Minaçu …;
> end;
> ```
>
> With this file, the conversion to Structure input is done automatically with PGDSpider2.

2. Open Structure, click “File > Open Data File...” and load the input.
3. Click “File > New Project...”. In the window that opens, name the project, choose a folder where the outputs will be saved and select your input. Click “Next>>”.

![](images/image76.png)

4. In the next window, enter the number of individuals, the number of loci, the ploidy of the data (2 for nuclear markers in diploid organisms) and the missing-data code used (in the example, -9). Click “Next>>”.

![](images/image77.png)

5. In the next window, check “Row of marker names” and click “Next>>”.
6. Finally, check the information present in the columns of your input. In the example used for this tutorial, we have one column with the individual names and one with the putative population of origin of each. For this reason, we check “Individual ID for each individual” and “Putative population origin for each individual”. Click “Finish”. Check that the information is correct and click “Proceed”.

![](images/image78.png)

7. Now that your project has been created, we can proceed with the analysis. Click “Parameter Set > New...”. A window with four tabs will open. The first tab (Run Length) sets the sampling of the Markov chains. For this exercise, use a burnin of 50000 and 100000 replicates.

![](images/image79.png)

8. In the next tab (Ancestry Model) select “Use Admixture Model” to estimate the probability of each individual belonging to each cluster.
9. In the “Allele frequency model” tab, select “Allele Frequencies Correlated”. Choose this model because it is more appropriate for delimiting fine-scale genetic structure (which is the case for recently speciated lineages).
10. In the last tab (Advanced), select “Compute probability of the data (for estimating K)” and click “OK”. Give your parameter set a name and click “OK”.

![](images/image80.png)

11. Click “Project > Start a Job”. Select your project and set a minimum and maximum range of K values. The lowest value of K should be set to 1, and the highest should relate to the biology of the organism. For example, if you work with a species that occurs in different river basins and you have evidence that the basins limit its geographic distribution, the maximum K should ideally be the number of basins + 1. Finally, set the number of replicates of the analysis under “Number of iterations:”. For this exercise we will use three replicates. Click “Start”.

![](images/image81.png)

12. When the analysis finishes, click “OK”.
13. Go to the folder where the outputs were saved and find the “Results” folder. Compress this folder into a .zip file.
14. Open the Structure Harvester website and upload your .zip file. Click “Harvest!”. Harvester will summarize all your replicates in a single file. In addition, the best value of K will be indicated by the ΔK statistic.

![](images/image82.png)

![](images/image83.png)

15. Save the plots, tables and the “Clumpp indfile” and “Clumpp popfile” files for the best value of K (highlighted in yellow in the Evanno table).

![](images/image84.png)

16. Copy the “Clumpp indfile” to the CLUMPP.exe folder. Open this folder and double-click the executable. Ask the instructors about the settings in the CLUMPP parameter file.

![](images/image85.png)

17. When the CLUMPP analysis finishes, an .outfile file will be generated. Copy and paste it into the DISTRUCT folder. Change the file extension to .indivq; this file contains the assignment probabilities of each individual to each delimited population. You will also need a .names file (with the identification of each individual, in the same order as the .indivq), a .locs file (with information on the geographic location or population of each sample) and a .perm file (indicating the color of each population; see the list in the manual). In the DISTRUCT folder there is a file called “drawparams”. Use it to configure your analysis, pointing to each input (click [here](https://1drv.ms/u/s!AkKRKMNNRivYi_BMkIZc2ff-pQvS0g) to download a template). Copy the inputs and “drawparams” into the DISTRUCT folder and click the executable. A .ps output will be generated.
18. Go to <https://online2pdf.com/en/ps2pdf>, upload the DISTRUCT output and click “Convert”. A .pdf file with the Q-plot will be generated, which can be improved in any vector graphics editor such as Adobe Illustrator, Corel Draw or Inkscape.

![](images/image86.png)

## 8. ML-GMYC

The *Generalized Mixed Yule Coalescent* (GMYC) is a model that combines stochastic lineage-splitting events between species (Yule model) with coalescent theory, and can identify the transition point between processes at the species level (i.e., speciation) and processes at the population level. GMYC was developed to discover putative species in gene trees, especially from mitochondrial markers. In this task, we will use the maximum-likelihood implementation of the model, which performs a likelihood-ratio test between the null hypothesis (i.e., a single species) and the alternative hypotheses (i.e., more than one species). You will need:

1. The latest version of R installed;
2. RStudio;
3. The *splits* package installed in R, with its dependencies (*ape*, *MASS* and *paran*);
4. An ultrametric gene tree of the unique haplotypes of a mitochondrial marker.

**Step by step**

1. Install the *splits* package and its dependencies with the commands:

```r
install.packages("splits", repos="http://R-Forge.R-project.org")
install.packages("ape", dependencies=T)
```

2. First, generate the gene tree of unique haplotypes. For this, you will need a NEXUS file containing these haplotypes. Then convert this file to FASTA with AliView or PGDSpider. Finally, select the evolutionary model that best fits your set of unique haplotypes (Tutorial 3).
3. To generate the gene tree, follow Tutorial 4, steps 1–16, skipping the StarBEAST3 template (step 3) and its specific tabs (steps 5 and 6). If you have no rate to calibrate your gene tree, don’t worry: just keep the rate at 1 (the default). When the analysis finishes, annotate the best tree (Tutorial 4, step 28).
4. Open your tree in FigTree and export it in Newick format. Click “File > Export Trees” and, in the window that opens, select Newick under “Tree file format” and uncheck all options. Make sure you have a single tree loaded.

![](images/image87.png)

5. Open RStudio and change the working directory to the folder containing the tree file. Click “Session > Set Working Directory > Choose Directory…”.

![](images/image88.png)

6. Load the *splits* package with the command `library(splits)` in the console.
7. Open your tree as an object with the command `read.tree("nomedoarquivo.nwk")->objeto1`. Check whether your tree is ultrametric with `is.ultrametric(objeto1)`.
8. If your tree has outgroups, remove them with the command `c("outgroup1",...,"outgroupn")->objeto2` followed by `drop.tip(objeto1,objeto2)->objeto3`.
9. Run the analysis with the command `gmyc(objeto3)->results_GMYC`. By default, the package uses the “single threshold” method. To view the result of the analysis, use `summary(results_GMYC)`.

![](images/image89.png)

In this example, the method identified three candidate species, with a confidence interval of 2–13, and the null hypothesis was rejected (LR = 9.513; p = 0.009).

10. To view the figures produced by the analysis, including the threshold between the Yule and coalescent processes and the tree with the putative species highlighted, use the command `plot(results_GMYC)`.

![](images/image90.png)

![](images/image91.png)

11. Finally, you can see which haplotype belongs to each candidate species with the command `spec.list(results_GMYC)`.

## 9. *b*GMYC

Note that only one tree was used for ML-GMYC — in Tutorial 8, the maximum clade credibility (MCC) gene tree obtained with BEAST2. However, the MCC tree is one among **n** sampled trees. Consequently, the phylogenetic uncertainty associated with the MCC tree is not accounted for in ML-GMYC. With this in mind, Reid and Carstens (2012) developed a Bayesian extension of the GMYC method. Basically, *b*GMYC runs GMYC many times, each time on a different tree sampled by the Markov chain. The probability of each putative species is given by the proportion of trees in which that species was recovered. For this analysis, you will need:

1. The latest version of R installed;
2. RStudio;
3. The packages *bGMYC*, *ape* and *TreeTools*;
4. The gene tree from the previous exercise and the .trees file (with all sampled trees) generated by BEAST2.

**Step by step**

1. Put your .nwk tree and the .trees file in the same folder. Set R’s working directory to this location.
2. Load the packages *ape*, *TreeTools* and *bGMYC* with the `library` command.
3. Load your .nwk tree as an object with the command `read.tree("arvore.nwk")->tr`.
4. Load all trees sampled by BEAST2 as another object with the command `read.nexus("arvores.trees")->trs`.
5. Define your outgroups with the command `c("outgroup1",...,"outgroupn")->out`.
6. Now we will randomly subsample the trees in “arvores.trees”. Type `sample(trs,250)->trs2` to sample 250 trees into a new object. Here you also need to remove the outgroups. For this, use the command `lapply(trs2,drop.tip,out)->trs3`.
7. In addition, you need to set this new object as a dataset of class multiPhylo. For this, use the command `as.multiPhylo(trs3)`. To check that the conversion worked and that all trees in the file are ultrametric, type `is.ultrametric.multiPhylo(trs3)`.
8. To run *b*GMYC on multiple trees, use the command below. To understand the analysis parameters, click [here](https://sites.google.com/site/noahmreid/software/bGMYC_instructions_14.03.12.txt?attredirects=0&d=1).

```r
bgmyc.multiphylo(trs3, mcmc=10000, burnin=2500, thinning=10, py2=1.2, t1=1, t2=13,
                 start=c(1,0.5,5), scale=c(1,40,0.5))->splb
```

9. Check the convergence of the analysis with the command `plot(splb)`. Several figures will be produced for visual inspection.

![](images/image92.png)

10. To view the distribution of posterior probabilities of each species on a tree, type `spec.probmat(splb)->result.probmat` followed by `plot(result.probmat,tr)`.

![](images/image93.png)

11. If you want to see this figure as a table of pairwise probabilities, type `write.csv(result.probmat,file="probs.csv")`. The file “probs.csv”, saved in your working folder, can be opened in any text or spreadsheet editor. With these data, you can show the probabilities as numbers on the nodes of the tree.

## 10. *b*PTP (web server)

The *Poisson Tree Process* (PTP) is a discovery method that models coalescent and speciation events in terms of the number of substitutions on the tree, using heuristic algorithms to classify branches as resulting from population-level or speciation processes. PTP was developed to discover putative species in gene trees, especially from mitochondrial markers. In this task, we will use the Bayesian version of the model, which estimates the uncertainty associated with each delimited candidate species. For this analysis, you will need:

1. A non-ultrametric tree;
2. Access to the *b*PTP web server through an internet browser.

**Step by step**

1. Open <https://species.h-its.org/> in your browser;
2. Under ‘My phylogenetic input tree’, click ‘Browse’ and open the file with your phylogenetic tree;

![](images/image94.png)

3. If your tree is rooted with an outgroup (as in our example), select ‘Rooted’ under ‘My tree is:’, type the name(s) of the outgroup(s) in the box ‘Outgroup taxa names (if any):’ (**Hap1_Pdistincta_SaoBentodoSul_SC** in our example file) and click “Remove outgroups...”;

![](images/image95.png)

4. Finally, type your e-mail address under “My e-mail address:” and click submit;
5. Write down your ‘**job id**’. You will be able to access your analysis with this number and your e-mail address through the ‘Look up jobs’ tab.

![](images/image96.png)

## 11. *m*PTP

Although it is a fairly robust delimitation model, PTP assumes that substitutions are constant across the tree, or that coalescent and speciation events occur at a constant rate per substitution. To relax this assumption, the *multi-rate Poisson Tree Process* (*m*PTP) model accounts for variation in the rate of divergence within the candidate species on the tree. For this analysis you will need:

1. A non-ultrametric tree;
2. Access to the *m*PTP web server through an internet browser.

**Step by step**

1. Go to <https://mptp.h-its.org/#/tree> in your browser;
2. In the ‘Newick file upload’ window, click ‘Drop newick file or click to upload’ and load your tree. Once loaded, click ‘Proceed to outgroup selection’ in the lower-right corner of the page;

![](images/image97.png)

3. In the ‘Outgroup specification’ window, select all your outgroups if your tree is rooted. In our example, the outgroup is the individual “**Hap1_Pdistincta_SaoBentodoSul_SC**”. Check ‘Crop outgroup’ and click ‘Model Selection’ in the lower-right corner;

![](images/image98.png)

4. In the ‘Model selection’ window check ‘Use MPTP’ and click the ‘Visualization options’ button in the lower-right corner;
5. In the ‘Visualization options’ window, click ‘Auto-detect’ and then ‘Contact details’ in the lower-right corner;
6. Finally, enter your e-mail in the ‘Contact details’ window and click ‘Overview’ in the lower-right corner;
7. In the ‘Overview’ window you will see all the information about your job, including the input name, the number of tips, the delimitation model and the outgroup (if any). Under ‘command-line execution’ you will find the command line with the analysis settings, in case you want to run it on your own computer. Click ‘Submit’;

![](images/image99.png)

8. The results include an \*.svg file with a phylogenetic tree in which within-population branches are shown in red and between-species branches in green. There is also a \*.txt file listing which sequences belong to each species.

## 12. Bayesian Phylogenetics and Phylogeography (BPP)

For this task, you will need:

1. BPP.
2. The sequences of each nuclear marker in a single file in ‘phy’ format.

![](images/image101.png)

3. A file mapping each individual to its species. This file contains only the individual identifier and the species to which it belongs;

![](images/image102.png)

4. The control file specifying the details of the analysis (see below).

**Step by step**

1. Open a blank file in a text editor, save it together with the sequence and species-mapping files, and edit it as in the following steps.
2. The first line contains the “seed” information. A negative number means a random number will be used.

![](images/image103.png)

3. The next four lines give the names of the input files (sequences and mapping) and the output files (outfile and mcmcfile).

![](images/image104.png)

4. Next we add the type of analysis. BPP can estimate species trees, species-tree parameters, and delimit species. Since we want to delimit species, we indicate this with the command `speciesdelimitation = 1`. We also need to specify the rjMCMC algorithm. We will use algorithm 0, which has one parameter, ε=2. You can try different algorithms with different parameter values to see whether your results are stable (see details on the algorithms and parameters in Yang & Rannala (2010) and in the BPP documentation). If you want, you can keep another algorithm option after a “\*”, which means that line will not be read. That way, when you run another analysis, you only need to move the “\*”.

![](images/image105.png)

5. The next line indicates whether the species-tree topology will be fixed (value 0) or searched (1). Then we set the prior on topologies, which may or may not include branch lengths. In our case, we will search the phylogeny topology and give equal prior probabilities to all topologies.

![](images/image106.png)

6. Next we give the maximum number of species (the number of “minimal clusters”), the name of each species, the maximum number of sequences per locus for each species, and a guide topology.

![](images/image107.png)

7. In the next three lines, we tell the program to use our data (there is an option to sample only from the prior), give the number of loci, and tell it to use sites with ambiguities (there is an option to remove sites with ambiguities). This is done with the commands `usedata = 1`, `nloci = 3` and `cleandata = 0`.

![](images/image108.png)

8. Next, we define the prior probability curves for θ and τ<sub>0</sub>. These coalescent-model parameters have gamma (Γ) priors, and we need to set the α and β parameters of the curve. For this it helps to know how a gamma distribution behaves. α controls the shape of the curve: when it is less than or equal to one, the curve is exponential; when it is greater than one, the distribution is unimodal, and the larger α, the closer it is to a normal distribution. This means that the larger α, the more informative the prior. The mean of the gamma distribution is α/β. So, if you have information that populations have, on average, θ = 0.05, you can use alpha and beta values of 2 and 40, respectively. This gives a weakly informative prior around the mean (0.05). If you are more certain about the parameter, you can use values such as 5 and 100.

If you have information that the root is about 3 Ma old, and that your mutation rate is 0.001 mutations per base pair per million years, you expect 0.003 mutations per base pair from the root to the tips. You could then use a gamma distribution with alpha and beta values of 3 and 1000.

The R commands below let you plot the gamma distribution with the chosen alpha and beta values:

```r
a=3; b=1000;
curve(dgamma(x, a, b), from=0, to=0.02)
qgamma(c(0.025, 0.975), a, b)
```

Remember that θ equals 2Neμ for haploids, 4Neμ for diploid markers, and Neμ for uniparentally inherited genes. τ<sub>0</sub> indicates how much a sequence has diverged since the ancestor. For example, τ<sub>0</sub> = 0.003 means the sequence has diverged by 0.3% since the common ancestor of all sequences. Note that the substitution rate is used in these calculations. Since we are using several genes, the overall substitution rate will be an average of the substitution rates of the genes.

> [!IMPORTANT]
> Very large values of θ and very small values of τ<sub>0</sub> may favor delimitation hypotheses with few species. Small values of θ and large values of τ<sub>0</sub> may favor many species. It can be useful to test different prior values for these parameters and check the stability of the results. For more details on these parameters and priors, see Yang (2015).

![](images/image109.png)

9. The next command (locusrate) indicates whether the rate varies among loci. If it does (`locusrate = 1`), the rates can be estimated or fixed. If estimated, the variation has a Dirichlet prior with an alpha parameter. The larger the alpha, the more similar the rates among loci. Fixed rates can be supplied in a file containing one rate per gene, in the order in which the genes appear in the sequence file (`locusrate = 2 nomedoarquivo.txt`). If no variation among loci is expected, use `locusrate = 0`. Here we will estimate the rates with alpha=2, since we expect a lot of variation among them.

Next, we set the heredity of each gene, which can also be equal, estimated or supplied in a file. Since we have one mitochondrial and two nuclear genes, we will supply this information. The .txt file simply contains the heredity scalar of each gene, in the order in which they appear in the sequence file, separated by spaces. Mitochondrial genes have a scalar of 0.25 and autosomal nuclear genes a scalar of 1.

![](images/image110.png)

10. In the next command we set the parameters of the MCMC proposals. We will keep the default, which lets the program find the best values. If the search does not converge, this is where you can edit them manually to improve the search (see step 15).

![](images/image111.png)

11. Finally, we set the Markov chain parameters. The “print” command determines whether there will be an output file with the trees sampled during the chain with branch lengths, a file with the sampled rates (“locus rate”), with the heredity scalars (“heredityscalars”) if estimated, and a file with the genealogies (“gene trees”). We will print only the MCMC phylogenies (`print = 1 0 0 0`).

The next commands set the burnin, the sampling frequency and the length of the chain. In class we will run only 1000 generations, sampling every 10 with a “burnin” of 100, but your data will need many more!

![](images/image112.png)

The file is now ready!

12. To run the analysis, paste the bpp.exe file (if it doesn’t work, try bpp_NoSSE.exe or bpp_SSE.exe) in the same folder as the input files. Tip: don’t put the files in folders with very long paths. Prefer short paths such as the root or a folder at the root.
13. Open a Windows command prompt window (or the terminal of your operating system). Change the working directory with the `cd` command followed by the path of the folder with the files, for example: `cd c:\exemplo`.
14. Run bpp with the following command:

```bat
bpp.exe control.bpp.ctl.txt
```

15. Check the quality of the search:

![](images/image113.png)

16. If the analysis is good, check which delimitation model and which species are most probable. In the example, the best hypothesis has a posterior probability of 68% and has 3 species: the species previously delimited as sp1 and sp2 are probably a single evolutionary lineage. Species sp3 and sp4 are probably independent evolutionary units.

![](images/image114.png)

Units sp4 and sp3 have 100% and 69% probability, respectively, of being distinct species. The cluster sp1+sp2 has a 69% probability of being a single evolutionary unit, and the cluster sp1+sp2+sp3 has a posterior probability of 30%.

Most likely, our data contain 3 distinct species (69%), and the probability of one or 4 species is zero.

![](images/image115.png)

## 13. STACEY

For this task, you will need:

1. The sequences of each nuclear marker, separated, aligned and in ‘fasta’ format. The sequence name must include a standardized species identifier, for example:

![](images/image17.png)

2. The BEAST v. 2.4.7 package, including BEAUti, TreeAnnotator, AppStore, DensiTree, Tracer and FigTree;
3. The STACEY template installed;
4. SpeciesDelimitationAnalyser: <http://www.indriid.com/software.html>

**Step by step**

1. Open BEAUti.exe and load the STACEY template, as done for StarBEAST. If it is not installed, use the “Manage Packages” option to install it.

![](images/image116.png) ![](images/image117.png)

![](images/image118.png)

2. Import the alignments (or simply drag the files into the BEAUti window), as done for StarBEAST. The options here are very similar to StarBEAST, except that instead of the “Multi Species Coalescent” tab there is a “STACEY Coalescent” tab.

![](images/image119.png)

3. In the “Taxon Set” tab you can follow the same procedure as for StarBEAST, if you want to use STACEY as a validation method.

![](images/image120.png)

However, it can be used as a discovery method if you assign each individual to its own “species” (“minimal cluster”). In our example, the individual is identified by the number after the first “_”.

![](images/image121.png)

In this example, we will use it as a discovery method.

4. Set up the “Site Model” and “Clock Model” tabs as done for StarBEAST.
5. In the “STACEY Coalescent” tab set the ploidy of each marker. Diploid markers have a value of 2 and haploid ones, such as mitochondrial or Y-chromosome markers, have a value of 0.5.
6. In the “priors” tab, we define the prior probability distribution of each parameter. We will keep the defaults, but if you have strong information about a parameter for your data, you can change it here. If the “collapseWeight” parameter (ω) is fixed at 0, the analysis is equivalent to a StarBEAST analysis. This parameter can be used to express prior knowledge about the possible number of species. The collapseHeight parameter (ε) gives the branch length below which a branch is considered collapsed. See Jones et al. 2015 for recommendations on these *priors*.

![](images/image122.png)

7. Finally, we set the details of the Markov chain search. In our example, we will run 10000000 generations, sampling every 5000.
8. Save your file, open it in BEAST.exe and start the analysis.

![](images/image123.png)

9. When the run finishes, the program reports some information about the MCMC. If your search was not good and you need to run more generations, you can use the “tuning” suggestions to reach convergence faster. Save this as a .txt file to use later if needed. And ask one of the instructors for more details.

![](images/image40.png)

10. Open the .log file in Tracer. Check that the ESS is adequate (greater than 200, although between 100 and 200 is acceptable) and that the parameters have stabilized. If the run was not good, run it again changing the operators and/or increasing the number of generations (for more information, see <https://www.beast2.org/increasing-esss/> and talk to the instructors).

![](images/image41.png)

11. To analyze the results, we need “SpeciesDelimitationAnalyser”. Paste the speciesDA.jar file in the same folder as the species-tree file produced by the STACEY analysis. Tip: don’t put the files in folders with very long paths. Prefer short paths such as the root or a folder at the root.
12. Open a Windows command prompt window (or the terminal of your operating system). Change the working directory with the `cd` command followed by the path of the folder with the files, for example: `cd c:\exemplo`.
13. Run SpeciesDelimitationAnalyser with the following command:

```bat
java -jar speciesDA.jar -burnin 1000 -collapseheight .001 -simcutoff .95 ExemploStaceyspecies.trees outputStacey.txt
```

The `-burnin` argument gives the number of initial samples to discard. The argument `-collapseheight .001` is ε, and must be the same value used when setting up the analysis in BEAUti. The `-simcutoff` argument gives the similarity value between clusters used as support. The last two arguments are the input file and the name of the final results file.

14. The result is a table with the probability of each delimitation, the number of species in the hypothesis and the details of each cluster. In our example, the first row shows a delimitation hypothesis with 84% probability and four species, that is, each previously delimited “minimal cluster” is a species. The second row shows a hypothesis with 15% probability and 3 species, in which clusters sp1 and sp2 are the same evolutionary lineage, plus two other species corresponding to the previously delimited groups sp3 and sp4.

![](images/image124.png)

15. To view the similarity matrix among minimal clusters, open RStudio and run the commands below (modified from the supplementary material of Jones et al. 2014). Pay attention to the comments and objects used; they will change with your data. At the end, you will have an image of the clustering probability matrix. The darker the cell, the higher the probability that the minimal clusters are grouped into larger clusters.

```r
# Read in the table of clusterings
setwd("G:/Biologia/Apresentações/Aulas/Delimitação de especies/dados/Stacey") # put the path to your working directory here
x <- read.table("staceyoutput.txt", header=TRUE) # open the SpeciesDelimitationAnalyser output table

# Change names for table # if you don't want to change the names, skip this command. Pay attention to the names you used for your species.
renames <- matrix(c("sp2", "Genero sp2", "sp1", "Genero sp1", "sp4", "Genero sp4", "sp3", "Genero sp3"), nrow = 4, ncol = 2, byrow = TRUE)

# Minimal cluster names are column names omitting first 4
mincl.names <- colnames(x)[-(1:4)]

# Check for typos, etc # if you did not change the names, skip this command
for (i in 1:length(mincl.names)) {
  stopifnot(mincl.names[i] == renames[i,1])
}

# Make the similarity matrix
displaynames <- renames[,2] # if you did not change the names, skip this command and replace the "displaynames" objects with "mincl.names"
nmincls <- length(displaynames)
sim <- matrix(0, ncol=nmincls, nrow=nmincls, dimnames=list(displaynames, displaynames))
for (i in 1:nmincls) {
  for (j in 1:nmincls) {
    coli <- x[,mincl.names[i]]
    colj <- x[,mincl.names[j]]
    w <- coli == colj
    sim[i,j] <- sum(x[w,"fraction"])
  }
}

# ensure rounding errors don't make probabilities sum to more than 1.
sim <- pmin(sim,1)

# change the order of minimal clusters
# This depends on which patterns you want to emphasise # if you don't want to reorder, c(1,2,3,4...)
neworder <- c(2,1,4,3)

# Currently recognised groups. # this command draws dividing lines in the matrix according to what you want to show. For example, if clusters sp1 and sp2 are considered subspecies, I can show this by adding a divider after the second and third rows of the matrix (remember that the species have already been reordered here).
dividers <- c(0,2,3,4)

# create function plot.rectangle
plot.rectangle <- function(v1,v2,...)
{
  polygon(c(v1[1],v2[1],v2[1],v1[1]), c(v1[2],v1[2],v2[2],v2[2]), ...)
}

# Main plotting routine
plot.simmatrix <- function() {
  par(mar= c(0,5,5,0)+.1)
  plot(NULL, xlim=c(0,nmincls), ylim=c(nmincls,0), axes=FALSE, ylab="", xlab="")
  axis(3, at=(1:nmincls)-.5, displaynames[neworder], tick=FALSE, las=2, line=-1)
  axis(2, at=(1:nmincls)-.5, displaynames[neworder], tick=FALSE, las=2, line=-1)
  for (i in 1:nmincls) {
    for (j in 1:nmincls) {
      d <- 1 - sim[neworder[i],neworder[j]]
      plot.rectangle(c(i-1,j-1), c(i,j), col=rgb(d,d,d), border="white")
    }
  }
  for (b in dividers) {
    lines(x=c(-.5,nmincls), y=c(b,b))
    lines(x=c(b,b), y=c(-.5,nmincls))
  }
}

# Display as text, on screen, and to PDF file
print(sim[neworder,neworder], digits=2)
plot.simmatrix()
pdf("simmatrix.pdf")
plot.simmatrix()
dev.off()
```

![](images/image125.png)

You can edit this matrix in image-editing programs to produce figures like Figure 7 of Jones et al. 2014.

## 14. Integrated BPP (iBPP)

iBPP is a method that integrates the BPP coalescent model with independent continuous quantitative data. According to Solís-Lemus and colleagues (2015), adding continuous data to the model increases delimitation accuracy.

For this task, you will need:

1. iBPP;
2. The same input files as for BPP;
3. An additional ‘traitfile’, in which each line corresponds to an individual (the same ones for which genetic data were sampled), the first column holds the individual name, the second the putative species to which each individual belongs, and from the third column onward the continuous characters (morphometric, meristic, ecological, behavioral, ...).

![](images/image126.png)

**Step by step**

1. The iBPP control file is very similar to the BPP one; however, it must include some information about the continuous data matrix. First, add a line giving the input file of the integrative data.

![](images/image127.png)

2. iBPP does not search tree space, so the selected model must be A10 (see [Yang, 2015](https://1drv.ms/b/s!AkKRKMNNRivYi_A3iBXx6xlAQPEUmg) for details).
3. In the block that controls data use, three new lines must be added: (1) **usetraitdata**, which when turned on enables the ‘traitfile’; (2) **ntraits**, which gives the number of characters in the ‘traitfile’; and (3) **nindT**, which gives the number of individuals with at least one sampled character.

![](images/image128.png)

4. Finally, in addition to the prior curves for θ and τ<sub>0</sub>, curves are defined for the parameters κ and η. We will set them to 0 (zero) because, although they result in improper priors, they ensure adequate sampling of the marginal likelihood (Solís-Lemus *et al.*, 2015).

![](images/image129.png)

5. Once the inputs and control files are ready, copy them to the iBPP folder, navigate to the folder with the `cd` command in the command prompt, and drag the executable into the prompt followed by the control file. Press <kbd>Enter</kbd> and wait for the analysis to finish. **Attention**: iBPP also requires independent runs with different θ and τ<sub>0</sub> settings.

![](images/image130.png)

6. When the analysis finishes, an .out file will be generated. Unlike the BPP output, it will contain only the guide tree with the probability of each node. The higher the value, the higher the probability that a speciation event occurred at that node. In addition, the performance of the analysis is assessed by the Effective Sample Size (ESS) of each parameter.

![](images/image131.png)
