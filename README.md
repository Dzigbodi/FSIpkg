WGIpkg
================
Richard Amegble
2024-10-14

## Introduction

This package allows to extract [Fragile States
Index](https://fragilestatesindex.org/). `read_fsi` is built to perform
this extraction. There are another two functions that help to find the
country name and series names.

## Install package

``` r
#devtools::install_github("Dzigbodi/FSIpkg")
```

``` r
library(FSIpkg)
```

## List of series

``` r
head(fsi_series())
```

    ##   series                          fsidesc
    ## 1     C1           C1:.Security.Apparatus
    ## 2     C2         C2:.Factionalized.Elites
    ## 3     C3              C3:.Group.Grievance
    ## 4     E1                      E1:.Economy
    ## 5     E2          E2:.Economic.Inequality
    ## 6     E3 E3:.Human.Flight.and.Brain.Drain

## List of Countries

``` r
print(fsi_countries())
```

    ##   [1] "Somalia"                   "Yemen"                    
    ##   [3] "South Sudan"               "Congo Democratic Republic"
    ##   [5] "Syria"                     "Afghanistan"              
    ##   [7] "Sudan"                     "Central African Republic" 
    ##   [9] "Chad"                      "Haiti"                    
    ##  [11] "Ethiopia"                  "Myanmar"                  
    ##  [13] "Mali"                      "Guinea"                   
    ##  [15] "Nigeria"                   "Zimbabwe"                 
    ##  [17] "Libya"                     "Ukraine"                  
    ##  [19] "Eritrea"                   "Burundi"                  
    ##  [21] "Burkina Faso"              "Mozambique"               
    ##  [23] "Cameroon"                  "Niger"                    
    ##  [25] "Lebanon"                   "Uganda"                   
    ##  [27] "Iraq"                      "Congo Republic"           
    ##  [29] "Venezuela"                 "Sri Lanka"                
    ##  [31] "Guinea Bissau"             "Pakistan"                 
    ##  [33] "Liberia"                   "Palestine"                
    ##  [35] "Kenya"                     "Cote d'Ivoire"            
    ##  [37] "Mauritania"                "North Korea"              
    ##  [39] "Angola"                    "Iran"                     
    ##  [41] "Bangladesh"                "Equatorial Guinea"        
    ##  [43] "Malawi"                    "Rwanda"                   
    ##  [45] "Comoros"                   "Djibouti"                 
    ##  [47] "Togo"                      "Zambia"                   
    ##  [49] "Madagascar"                "Egypt"                    
    ##  [51] "Sierra Leone"              "Turkey"                   
    ##  [53] "Russia"                    "Cambodia"                 
    ##  [55] "Nepal"                     "Solomon Islands"          
    ##  [57] "Honduras"                  "Swaziland"                
    ##  [59] "Colombia"                  "Papua New Guinea"         
    ##  [61] "Philippines"               "Nicaragua"                
    ##  [63] "Timor-Leste"               "Guatemala"                
    ##  [65] "Tanzania"                  "Lesotho"                  
    ##  [67] "Gambia"                    "Jordan"                   
    ##  [69] "Kyrgyz Republic"           "Laos"                     
    ##  [71] "Brazil"                    "Tajikistan"               
    ##  [73] "India"                     "Benin"                    
    ##  [75] "Peru"                      "Azerbaijan"               
    ##  [77] "Bosnia and Herzegovina"    "South Africa"             
    ##  [79] "Georgia"                   "Senegal"                  
    ##  [81] "Bolivia"                   "Fiji"                     
    ##  [83] "Algeria"                   "Belarus"                  
    ##  [85] "Mexico"                    "Sao Tome and Principe"    
    ##  [87] "Ecuador"                   "Micronesia"               
    ##  [89] "El Salvador"               "Morocco"                  
    ##  [91] "Thailand"                  "Serbia"                   
    ##  [93] "Armenia"                   "Moldova"                  
    ##  [95] "Uzbekistan"                "Bhutan"                   
    ##  [97] "Tunisia"                   "Indonesia"                
    ##  [99] "Gabon"                     "Saudi Arabia"             
    ## [101] "Samoa"                     "Bahrain"                  
    ## [103] "China"                     "Turkmenistan"             
    ## [105] "Paraguay"                  "Maldives"                 
    ## [107] "Ghana"                     "Jamaica"                  
    ## [109] "Guyana"                    "Dominican Republic"       
    ## [111] "Kazakhstan"                "Namibia"                  
    ## [113] "Macedonia"                 "Cape Verde"               
    ## [115] "Belize"                    "Suriname"                 
    ## [117] "Cuba"                      "Vietnam"                  
    ## [119] "Montenegro"                "Cyprus"                   
    ## [121] "Albania"                   "Botswana"                 
    ## [123] "Greece"                    "Malaysia"                 
    ## [125] "Brunei Darussalam"         "Antigua and Barbuda"      
    ## [127] "Grenada"                   "Seychelles"               
    ## [129] "Romania"                   "Trinidad and Tobago"      
    ## [131] "Bulgaria"                  "Mongolia"                 
    ## [133] "Kuwait"                    "Bahamas"                  
    ## [135] "Hungary"                   "Panama"                   
    ## [137] "Oman"                      "Croatia"                  
    ## [139] "Argentina"                 "Barbados"                 
    ## [141] "United States"             "Poland"                   
    ## [143] "Israel"                    "Spain"                    
    ## [145] "Latvia"                    "Italy"                    
    ## [147] "Chile"                     "United Kingdom"           
    ## [149] "Qatar"                     "Costa Rica"               
    ## [151] "Czech Republic"            "Lithuania"                
    ## [153] "Estonia"                   "Mauritius"                
    ## [155] "Slovak Republic"           "United Arab Emirates"     
    ## [157] "Uruguay"                   "Malta"                    
    ## [159] "South Korea"               "Belgium"                  
    ## [161] "Japan"                     "France"                   
    ## [163] "Slovenia"                  "Portugal"                 
    ## [165] "Singapore"                 "Germany"                  
    ## [167] "Austria"                   "Australia"                
    ## [169] "Netherlands"               "Sweden"                   
    ## [171] "Luxembourg"                "Ireland"                  
    ## [173] "Canada"                    "Denmark"                  
    ## [175] "Switzerland"               "New Zealand"              
    ## [177] "Finland"                   "Iceland"                  
    ## [179] "Norway"                    "Côte d'Ivoire"            
    ## [181] "Kyrgyzstan"                "North Macedonia"          
    ## [183] "Cabo Verde"                "Czechia"                  
    ## [185] "Slovakia"                  "Eswatini"                 
    ## [187] "Israel and West Bank"

## Extraction between period

``` r
df <- read_fsi( startyear=2020, endyear = 2021)
```

    ## ..

``` r
print(head(df))
```

    ##                     Country Year Rank Total   S1   S2  C3  E3  E2  E1   P1   P2
    ## 1                     Yemen 2021  1st 111.7  9.8  9.8 9.4 6.7 7.7 9.8  9.9  9.8
    ## 2                   Somalia 2021  2nd 110.9 10.0  9.2 8.3 8.8 9.5 9.2  9.2  9.8
    ## 3                     Syria 2021  3rd 110.7  7.6  9.7 9.7 8.2 7.1 9.6 10.0  9.6
    ## 4               South Sudan 2021  4th 109.4  9.5  9.9 8.8 6.7 8.9 9.2  9.5 10.0
    ## 5 Congo Democratic Republic 2021  5th 108.4  9.8 10.0 9.4 6.8 8.5 8.5  9.2  9.8
    ## 6  Central African Republic 2021  6th 107.0  8.9  9.7 8.1 6.6 9.6 8.5  9.0 10.0
    ##    P3  C1   C2   X1
    ## 1 9.7 9.4 10.0  9.7
    ## 2 8.7 9.3 10.0  8.9
    ## 3 9.7 9.6  9.9 10.0
    ## 4 8.7 9.7  9.2  9.3
    ## 5 9.2 8.6  9.5  9.1
    ## 6 9.3 8.0  9.7  9.6

## Extraction list of countries

``` r
country_list <- c("Togo", "Canada", "Ghana")
df_country <- read_fsi(startyear=2020, endyear = 2021,country = country_list )
```

    ## ..

``` r
print(head(df_country))
```

    ##   Country Year  Rank    Total       S1  S2  C3  E3       E2       E1  P1
    ## 1    Togo 2021  38th 85.10000 7.500000 6.3 6.0 6.9 8.300000 7.200000 8.2
    ## 2   Ghana 2021 113th 63.90000 6.900000 4.0 3.2 7.2 6.400000 5.500000 3.2
    ## 3  Canada 2021 171st 21.70000 2.000000 2.2 2.2 1.1 2.300000 2.000000 0.5
    ## 4    Togo 2020  38th 85.84143 7.530351 6.6 5.7 7.2 8.445843 6.700000 8.5
    ## 5   Ghana 2020 108th 64.15817 6.787516 4.3 3.5 7.5 5.970653 5.400000 3.3
    ## 6  Canada 2020 171st 18.66890 1.000000 1.9 2.5 1.4 1.800000 1.245088 0.5
    ##          P2       P3  C1  C2       X1
    ## 1 8.5000000 6.700000 6.4 7.6 5.500000
    ## 2 7.4000000 4.400000 4.6 5.4 5.700000
    ## 3 2.3000000 1.300000 2.8 2.5 0.500000
    ## 4 8.2000000 6.900000 6.7 7.6 5.765237
    ## 5 6.9000000 4.700000 4.9 4.9 6.000000
    ## 6 0.8382359 1.385574 3.1 2.5 0.500000

## Remove the Rank and Total from the extraction

``` r
df <- read_fsi(startyear=2020, endyear = 2021,country = country_list ,rank = F, total = F)
```

    ## ..

``` r
print(head(df))
```

    ##   Country Year       S1  S2  C3  E3       E2       E1  P1        P2       P3
    ## 1    Togo 2021 7.500000 6.3 6.0 6.9 8.300000 7.200000 8.2 8.5000000 6.700000
    ## 2   Ghana 2021 6.900000 4.0 3.2 7.2 6.400000 5.500000 3.2 7.4000000 4.400000
    ## 3  Canada 2021 2.000000 2.2 2.2 1.1 2.300000 2.000000 0.5 2.3000000 1.300000
    ## 4    Togo 2020 7.530351 6.6 5.7 7.2 8.445843 6.700000 8.5 8.2000000 6.900000
    ## 5   Ghana 2020 6.787516 4.3 3.5 7.5 5.970653 5.400000 3.3 6.9000000 4.700000
    ## 6  Canada 2020 1.000000 1.9 2.5 1.4 1.800000 1.245088 0.5 0.8382359 1.385574
    ##    C1  C2       X1
    ## 1 6.4 7.6 5.500000
    ## 2 4.6 5.4 5.700000
    ## 3 2.8 2.5 0.500000
    ## 4 6.7 7.6 5.765237
    ## 5 4.9 4.9 6.000000
    ## 6 3.1 2.5 0.500000

## Extraction of the whole data

``` r
df <- read_fsi()
```

    ## ..................

``` r
print(head(df))
```

    ##                     Country Year Rank Total   S1   S2  C3  E3  E2  E1   P1   P2
    ## 1                   Somalia 2023  1st 111.9 10.0  9.0 8.7 8.6 9.1 9.5  9.6  9.8
    ## 2                     Yemen 2023  2nd 108.9  9.6  9.6 8.8 6.4 7.9 9.9  9.8  9.6
    ## 3               South Sudan 2023  3rd 108.5  9.7 10.0 8.6 6.5 8.6 8.6  9.8  9.7
    ## 4 Congo Democratic Republic 2023  4th 107.2  9.7  9.8 9.4 6.4 8.4 8.1  9.3  9.3
    ## 5                     Syria 2023  5th 107.1  7.4  9.1 9.1 8.0 6.5 9.6 10.0  9.0
    ## 6               Afghanistan 2023  6th 106.6  9.2  8.6 8.3 8.5 8.2 9.6  9.4 10.0
    ##    P3  C1   C2   X1
    ## 1 9.0 9.5 10.0  9.1
    ## 2 9.6 8.6  9.9  9.2
    ## 3 8.7 9.9  9.2  9.2
    ## 4 9.3 8.8  9.6  9.1
    ## 5 9.1 9.4  9.9 10.0
    ## 6 8.7 9.7  8.7  7.7
