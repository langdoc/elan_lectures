This is a set of course materials Niko Partanen
([me](https://github.com/nikopartanen)) is using while teaching the this
course. It is supposed to be used with a [Komi-Zyrian Test
Corpus](https://github.com/langdoc/kpv-test-corpus) and the materials
have an accompanying
[website](https://nikopartanen.github.io/adv_elan_draft/), which is more
thorough but also still more at the draft level. I work currently in
LATTICE laboratory in Paris, and I’m also working with
[IKDP-2](https://github.com/langdoc/IKDP-2) research project.

The lectures assume that you have done something like:

    git clone https://github.com/langdoc/elan_lectures
    git clone https://github.com/langdoc/testcorpus
    git clone https://github.com/langdoc/praat-stuff

So when you are in the main directory what you see is:

    elan_lectures
    testcorpus
    praat-stuff

It doesn’t matter if there are other folders around.

Slides
------

The course is split along following slides:

-   [Introduction](https://langdoc.github.io/elan_lectures/lecture-1)
-   [Getting test corpus into
    R](https://langdoc.github.io/elan_lectures/lecture-2)
-   [How does ELAN
    work?](https://langdoc.github.io/elan_lectures/lecture-3)
-   [More advanced example with emuR, Shiny and
    PraatScript](https://langdoc.github.io/elan_lectures/lecture-4)
-   [Some file manipulation
    examples](https://langdoc.github.io/elan_lectures/lecture-5)

If you have comments or suggestions, any feedback, my email address is
<nikotapiopartanen@gmail.com>. In principle I’m also in Twitter,
@nikopartanen, but I don’t understand very well how to use it.

Preparatory work
----------------

Before the course starts it can be a good idea to install some of the
following tools:

-   [R](https://www.r-project.org/)
-   [RStudio](https://www.rstudio.com/)
-   [Python](https://www.python.org/downloads/)

Getting course materials
------------------------

-   Download or clone the lecture Rmd files from
    [here](https://github.com/langdoc/elan_lectures)
-   Download or clone the demo corpus from
    [here](https://github.com/langdoc/testcorpus)

You can do from command line:

    git clone https://github.com/langdoc/elan_lectures
    git clone https://github.com/langdoc/testcorpus

Course materials, or related materials, are also slowly being collected
into accompanying
[website](https://nikopartanen.github.io/adv_elan_draft/), but this
doesn’t usually reflect the actual state of things I want to discuss.
This work in on draft level, but the idea is to have there one method of
discussing things further.

R packages
----------

You need (at least) following R packages.

-   [tidyverse](https://www.tidyverse.org/)
-   [shiny]()
-   [leaflet]()
-   [emuR](https://github.com/IPS-LMU/emuR)
-   [meow](https://github.com/achubaty/meow)

Python
------

    pip install pympi-ling

How to load R packages
----------------------

    #install.packages("devtools")
    #install.packages("tidyverse")

    library(devtools)
    library(tidyverse)

    ## ── Attaching packages ──────────────────────────── tidyverse 1.2.0 ──

    ## ✔ ggplot2 2.2.1.9000     ✔ purrr   0.2.4     
    ## ✔ tibble  1.3.4          ✔ dplyr   0.7.4     
    ## ✔ tidyr   0.7.2          ✔ stringr 1.2.0     
    ## ✔ readr   1.1.1          ✔ forcats 0.2.0

    ## ── Conflicts ─────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

    library(xml2)

    #install_github(repo = "langdoc/FRelan")
    #install_github(repo = "achubaty/meow")

    library(FRelan)
    library(meow)

Projects in RStudio
-------------------

In RStudio you can easily arrange your work around projects. Those can
be accessed in right-upper corner of the program. If you work in a
project, your working directory is always the one of the project, and
you avoid lots of hassle.

In case you need, this is how you can change the working directory.

    getwd()
    setwd("~/path/to/some/directory")

Expected file structure
-----------------------

Throughout the course we assume that you have following file structure:

    higher_level_folder
        testcorpus
        elan_lectures
        praat-stuff

Examples
--------

-   Reading ELAN files or individual tiers

<!-- -->

    FRelan::read_eaf(eaf_file = '../testcorpus/kpv_udo20120330SazinaJS-encounter.eaf')

    ## # A tibble: 221 x 11
    ##    token                                                       utterance
    ##  * <chr>                                                           <chr>
    ##  1     и И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ##  2  эшшӧ И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ##  3  ӧтик И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ##  4   тор И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ##  5     , И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ##  6   мый И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ##  7 тэнад И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ##  8     , И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ##  9 тэныд И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ## 10   мам И эшшӧ ӧтик тор, мый тэнад, тэныд мам висьталіс интереснӧй юӧр,
    ## # ... with 211 more rows, and 9 more variables: reference <chr>,
    ## #   participant <chr>, time_start <dbl>, time_end <dbl>,
    ## #   session_name <chr>, filename <chr>, word <chr>, after <chr>,
    ## #   before <chr>

    FRelan::read_tier(eaf_file = '../testcorpus/kpv_izva20140330-1-fragment.eaf', linguistic_type = "refT")

    ## # A tibble: 5 x 8
    ##                    content annot_id ref_id participant        tier_id
    ##                      <chr>    <chr>  <chr>       <chr>          <chr>
    ## 1 kpv_izva20140330-1-b-097       a1   <NA>  MVF-F-1984 ref@MVF-F-1984
    ## 2 kpv_izva20140330-1-b-098       a2   <NA>  MVF-F-1984 ref@MVF-F-1984
    ## 3 kpv_izva20140330-1-b-099       a3   <NA>  MVF-F-1984 ref@MVF-F-1984
    ## 4 kpv_izva20140330-1-b-100       a4   <NA>  MVF-F-1984 ref@MVF-F-1984
    ## 5 kpv_izva20140330-1-b-101       a5   <NA>  MVF-F-1984 ref@MVF-F-1984
    ## # ... with 3 more variables: type <chr>, time_slot_1 <chr>,
    ## #   time_slot_2 <chr>

    FRelan::read_tier(eaf_file = '../testcorpus/kpv_izva20140330-1-fragment.eaf', linguistic_type = "orthT")

    ## # A tibble: 5 x 8
    ##                                                                       content
    ##                                                                         <chr>
    ## 1 Ме, кӧнечнэ же, вӧлі кык лун в шоке от Тайланда, потому что, но, менэ стран
    ## 2                                   Ааа, но думайта: ветла, - и муні, значит.
    ## 3 И сэтэн прӧстэ зэй уна ставыс  доступнэ, но разврат да быдчемаыс, и сыысь м
    ## 4 слонъяс вылэ видзеді, экскурсияяс, ок, моресэ аддзылі, сэтэн Южно-Китайскей
    ## 5   И ставыс сыа отойдитіс, сэсся, ну, кудз бы, иг обращайт на это внимание. 
    ## # ... with 7 more variables: annot_id <chr>, ref_id <chr>,
    ## #   participant <chr>, tier_id <chr>, type <chr>, time_slot_1 <chr>,
    ## #   time_slot_2 <chr>

Observations
------------

-   With Windows backslashes can be strange
-   How the folder paths work on Windows?
-   Unicode issues: easy to fix with some command, it is about some
    default settings?
-   Some ways of fixing Cyrillic not being displayed properly still
    resulted some characters not being ok

Filenames
---------

Things will generally go better if you never have in filenames:

-   Other than ascii characters
-   \_\_
-   No spaces

    corpus <- FRelan::read_tier(eaf_file = '../testcorpus/kpv_izva20140330-1-fragment.eaf', linguistic_type = "orthT")

    corpus %>% select(conte)

    ## DOES NOT WORK
    ## This should be customized somehow
    FRelan::read_tier(eaf_file = '../testcorpus/kpv_izva20140330-1-fragment.eaf', linguistic_type = "orthT", 
                      participant_location = "attribute|prefix|suffix")


    FRelan::read_eaf('pite.eaf', ind_tier = "reference tier type", sa_tier = "transcription tier type", ss_tier = "token level tier type")

Writing files
-------------

In principle you can write something into csv like this.

    FRelan::read_tier(eaf_file = '../testcorpus/kpv_izva20140330-1-fragment.eaf', linguistic_type = "orthT") %>%
      write_csv('results.csv')

    read_csv('results.csv')

    ## Parsed with column specification:
    ## cols(
    ##   content = col_character(),
    ##   annot_id = col_character(),
    ##   ref_id = col_character(),
    ##   participant = col_character(),
    ##   tier_id = col_character(),
    ##   type = col_character(),
    ##   time_slot_1 = col_character(),
    ##   time_slot_2 = col_character()
    ## )

    ## # A tibble: 5 x 8
    ##                                                                       content
    ##                                                                         <chr>
    ## 1 Ме, кӧнечнэ же, вӧлі кык лун в шоке от Тайланда, потому что, но, менэ стран
    ## 2                                   Ааа, но думайта: ветла, - и муні, значит.
    ## 3 И сэтэн прӧстэ зэй уна ставыс  доступнэ, но разврат да быдчемаыс, и сыысь м
    ## 4 слонъяс вылэ видзеді, экскурсияяс, ок, моресэ аддзылі, сэтэн Южно-Китайскей
    ## 5    И ставыс сыа отойдитіс, сэсся, ну, кудз бы, иг обращайт на это внимание.
    ## # ... with 7 more variables: annot_id <chr>, ref_id <chr>,
    ## #   participant <chr>, tier_id <chr>, type <chr>, time_slot_1 <chr>,
    ## #   time_slot_2 <chr>

There are also other ways:

-   [googlesheets](https://github.com/jennybc/googlesheets) package
    allows writing into Google Sheets
-   [readxl](http://readxl.tidyverse.org/) should be really good with
    Excel files

Improvements
------------

-   ind\_tier etc to have better names in FRelan functions
-   Some stuff there is very messy
-   Lots of things are experimental and not supposed to be used by
    anyone
-   Some parts use
    [XML](https://cran.r-project.org/web/packages/XML/index.html) R
    package instead of newer \[xml2\]

Custom read\_eaf function
-------------------------

This should be adaptable to most of ELAN tier structures, although I
admit one maybe has to think a bit what is going on there. In principle
one should always be able to recover the logic of ELAN’s internal
structure like this.

    read_custom_eaf <- function(path_to_file = '../testcorpus/kpv_udo20120330SazinaJS-encounter.eaf'){

    ref <- FRelan::read_tier(eaf_file = path_to_file, linguistic_type = "refT") %>%
      dplyr::select(content, annot_id, participant, time_slot_1, time_slot_2) %>%
      dplyr::rename(ref = content) %>%
      dplyr::rename(ref_id = annot_id)

    orth <- FRelan::read_tier(eaf_file = path_to_file, linguistic_type = "orthT") %>%
      dplyr::select(content, annot_id, ref_id, participant) %>%
      dplyr::rename(orth = content) %>%
      dplyr::rename(orth_id = annot_id) # %>%
      # dplyr::rename(ref_id = ref_id) # This is there just as a note

    token <- FRelan::read_tier(eaf_file = path_to_file, linguistic_type = "wordT") %>%
      dplyr::select(content, annot_id, ref_id, participant) %>%
      dplyr::rename(token = content) %>%
      dplyr::rename(token_id = annot_id) %>%
      dplyr::rename(orth_id = ref_id)

    lemma <- FRelan::read_tier(eaf_file = path_to_file, linguistic_type = "lemmaT") %>%
      dplyr::select(content, annot_id, ref_id, participant) %>%
      dplyr::rename(lemma = content) %>%
      dplyr::rename(lemma_id = annot_id) %>%
      dplyr::rename(token_id = ref_id)

    pos <- FRelan::read_tier(eaf_file = path_to_file, linguistic_type = "posT") %>%
      dplyr::select(content, ref_id, participant) %>%
      dplyr::rename(pos = content) %>%
      dplyr::rename(lemma_id = ref_id)

    elan <- left_join(ref, orth) %>% 
      left_join(token) %>% 
      left_join(lemma) %>% 
      left_join(pos) %>%
      select(token, lemma, pos, time_slot_1, time_slot_2, everything(), -ends_with('_id'))
      
    time_slots <- FRelan::read_timeslots(path_to_file)

    corpus <- elan %>% 
      left_join(time_slots %>% rename(time_slot_1 = time_slot_id)) %>%
      rename(time_start = time_value) %>%
      left_join(time_slots %>% rename(time_slot_2 = time_slot_id)) %>%
      rename(time_end = time_value) %>%
      select(token, lemma, pos, participant, time_start, time_end, everything(), -starts_with('time_slot_'))

    corpus %>% mutate(filename = path_to_file)

    }

    library(FRelan)
    dir("../testcorpus/", "kpv.+eaf$", full.names = TRUE) %>%
      map(read_custom_eaf)

    ## Joining, by = c("ref_id", "participant")

    ## Joining, by = c("participant", "orth_id")

    ## Joining, by = c("participant", "token_id")

    ## Joining, by = c("participant", "lemma_id")

    ## Joining, by = "time_slot_1"

    ## Joining, by = "time_slot_2"

    ## Joining, by = c("ref_id", "participant")

    ## Joining, by = c("participant", "orth_id")

    ## Joining, by = c("participant", "token_id")

    ## Joining, by = c("participant", "lemma_id")

    ## Joining, by = "time_slot_1"

    ## Joining, by = "time_slot_2"

    ## Joining, by = c("ref_id", "participant")

    ## Joining, by = c("participant", "orth_id")

    ## Joining, by = c("participant", "token_id")

    ## Joining, by = c("participant", "lemma_id")

    ## Joining, by = "time_slot_1"

    ## Joining, by = "time_slot_2"

    ## [[1]]
    ## # A tibble: 95 x 9
    ##      token lemma   pos participant time_start time_end
    ##      <chr> <lgl> <lgl>       <chr>      <dbl>    <dbl>
    ##  1      Ме    NA    NA  MVF-F-1984          0     6086
    ##  2       ,    NA    NA  MVF-F-1984          0     6086
    ##  3 кӧнечнэ    NA    NA  MVF-F-1984          0     6086
    ##  4      же    NA    NA  MVF-F-1984          0     6086
    ##  5       ,    NA    NA  MVF-F-1984          0     6086
    ##  6    вӧлі    NA    NA  MVF-F-1984          0     6086
    ##  7     кык    NA    NA  MVF-F-1984          0     6086
    ##  8     лун    NA    NA  MVF-F-1984          0     6086
    ##  9       в    NA    NA  MVF-F-1984          0     6086
    ## 10    шоке    NA    NA  MVF-F-1984          0     6086
    ## # ... with 85 more rows, and 3 more variables: ref <chr>, orth <chr>,
    ## #   filename <chr>
    ## 
    ## [[2]]
    ## # A tibble: 279 x 9
    ##      token lemma   pos participant time_start time_end
    ##      <chr> <lgl> <lgl>       <chr>      <dbl>    <dbl>
    ##  1  Значит    NA    NA  JAI-M-1939          0     6196
    ##  2       ,    NA    NA  JAI-M-1939          0     6196
    ##  3   турун    NA    NA  JAI-M-1939          0     6196
    ##  4      ми    NA    NA  JAI-M-1939          0     6196
    ##  5  пуктам    NA    NA  JAI-M-1939          0     6196
    ##  6    вӧлі    NA    NA  JAI-M-1939          0     6196
    ##  7 Кытшыль    NA    NA  JAI-M-1939          0     6196
    ##  8 коськын    NA    NA  JAI-M-1939          0     6196
    ##  9       ,    NA    NA  JAI-M-1939          0     6196
    ## 10   квайт    NA    NA  JAI-M-1939          0     6196
    ## # ... with 269 more rows, and 3 more variables: ref <chr>, orth <chr>,
    ## #   filename <chr>
    ## 
    ## [[3]]
    ## # A tibble: 240 x 9
    ##    token lemma   pos participant time_start time_end
    ##    <chr> <chr> <chr>       <chr>      <dbl>    <dbl>
    ##  1     И     и    CC  NTP-M-1986        170     3730
    ##  2  эшшӧ  эшшӧ     _  NTP-M-1986        170     3730
    ##  3  ӧтик  ӧтик   Num  NTP-M-1986        170     3730
    ##  4   тор   тор     N  NTP-M-1986        170     3730
    ##  5     ,     ,   CLB  NTP-M-1986        170     3730
    ##  6   мый   мый    CS  NTP-M-1986        170     3730
    ##  7 тэнад    тэ  Pron  NTP-M-1986        170     3730
    ##  8     ,     ,   CLB  NTP-M-1986        170     3730
    ##  9 тэныд    тэ  Pron  NTP-M-1986        170     3730
    ## 10   мам   мам     N  NTP-M-1986        170     3730
    ## # ... with 230 more rows, and 3 more variables: ref <chr>, orth <chr>,
    ## #   filename <chr>

Pite case
---------

-   Joshua Wilbur has a special case that gave errors, the general start
    for checking this is below, in principle it can be boiled down into
    an XPath
-   wordT type is incorrectly somewhere where one should have notesT

<!-- -->

    library(tidyverse)
    library(xml2)
    elan_file = "sje20150329b.eaf"
    read_xml(elan_file) %>%
      xml_find_all("//TIER[@LINGUISTIC_TYPE_REF='wordT' and starts-with(@TIER_ID, 'notes')]") %>%
        map(~ glue::glue("Fix tier {xml_attr(.x, 'TIER_ID')} in file {elan_file}"))

Notes from Ruprecht von Waldenfels’ discussion part
---------------------------------------------------

-   Basic metadata in itself a clear and simple issue
-   Some users, i.e. sociolinguists, want particularly detailed metadata
    -   exact education
    -   army service
    -   where person has lived
-   Multilinguality or speaking majority language can also be focus in
    some projects, this changes things a bit too
    -   How much info is collected on language use and knowledge
    -   Personal relations and language use between individuals
-   How to map values into basic core that everyone shares?
-   CMDI a subset of what we actually deal with
    -   CMDI is public and for finding things online – where we store
        the real thing?
-   Things get totally messy - how do we constrain the chaos?
-   There is a need for some sort of mapping between different metadata
    concepts used, but in manner different from CMDI

Useful packages
---------------

-   tidyverse
    -   xml2
    -   stringr
-   leaflet
-   ggplot2
-   sf (for maps, new, I haven’t studied it yet at all, but looks
    awesome)
-   tidytext
    -   unnest\_tokens()
    -   [Tidy Text Mining book](http://tidytextmining.com/)

License
-------

CC-BY Niko Partanen 2017
