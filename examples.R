library(FRelan)
install.packages("tidyverse")
library(tidyverse)

corpus <- dir('../testcorpus', pattern = 'eaf$', full.names = TRUE) %>%
  map(FRelan::read_eaf) %>%
  bind_rows() %>%
  select(token, participant, session_name, time_start, time_end, everything())


corpus %>% filter(str_detect(token, "ме"))

corpus %>% filter(! str_detect(token, '[[:punct:]\\p{Cyrillic}]')) %>% open_eaf(1)

library(glue)

read_cmdi <- function(cmdi_file){ # this defines the function
  read_xml(cmdi_file) %>% # reads the xml
    xml_find_all('//cmd:Actor') %>% # finds all Actor nodes
    map(~ tibble(participant = .x %>% xml_find_first('./cmd:Code') %>% xml_text,
                 session_name = .x %>% xml_find_first('../../cmd:Name') %>% xml_text,
                 year_birth = .x %>% xml_find_first('./cmd:BirthDate') %>% xml_text,
                 year_rec = .x %>% xml_find_first('../../cmd:Date') %>% xml_text,
                 role = .x %>% xml_find_first('./cmd:Role') %>% xml_text,
                 sex = .x %>% xml_find_first('./cmd:Sex') %>% xml_text,
                 session_address = .x %>% xml_find_first('../../cmd:Location/cmd:Address') %>% xml_text,
                 session_country = .x %>% xml_find_first('../../cmd:Location/cmd:Country') %>% xml_text,
                 session_location = paste0(session_address, ', ', session_country),
                 education = .x %>% xml_find_first('./cmd:Education') %>% xml_text,
                 name_full = .x %>% xml_find_first('./cmd:FullName') %>% xml_text)) %>% 
    bind_rows() # After everything is collected into tibble/dataframe,
  # we can just bind the rows together
}

metadata <- dir('../testcorpus', 'cmdi$', full.names = TRUE) %>%
  map(read_cmdi) %>% bind_rows()
metadata
corpus

corpus_full <- left_join(corpus, metadata)
corpus_full <- corpus_full %>% ungroup()

corpus_full %>% add_count(session_country) %>% rename(country_count = n) %>% select(country_count, everything())

corpus_full %>% count(session_address, session_country)

library(ggmap)

coordinates <- corpus_full %>%
  distinct(session_location) %>%
  as.data.frame() %>%
  ggmap::mutate_geocode(session_location) %>%
  as_tibble()

ggmap::geocodeQueryCheck()

coordinates <- read_csv('coordinates.csv', col_types = 'cdd')

corpus_geo <- left_join(corpus_full, coordinates) %>% 
  rename(lon_session = lon, 
         lat_session = lat)

corpus_geo

# 
# https://langdoc.github.io/elan_lectures/lecture-1.html
# https://langdoc.github.io/elan_lectures/lecture-2.html
# ...
"Josh"
# Install R
# Install RStudio
install.packages("devtools")
install.packages("tidyverse")
library(devtools)
library(tidyverse)
library(xml2)
install_github(repo = "FRelan", username = "langdoc")
# git clone https://github.com/langdoc/elan_lectures
# git clone https://github.com/langdoc/testcorpus
# You may want to insta

FRelan::read_eaf(eaf_file = '../testcorpus/kpv_izva20140330-1-fragment.eaf')
FRelan::read_tier(eaf_file = '../testcorpus/kpv_izva20140330-1-fragment.eaf', linguistic_type = "orthT") %>% View
FRelan::read_tier(eaf_file = '../testcorpus/kpv_izva20140330-1-fragment.eaf', linguistic_type = "refT") %>% View


