#' fsi_series
#'
#'@description
#' This function provides a list of FSI indicators
#' @import stringr
#' @import dplyr
#' @importFrom utils read.csv
#' @return vector of fsi series
#' @export
#'
#' @examples fsi_series()

fsi_series <- function() {
  temp <- read.csv(
    text = "series; fsidesc
C1;C1:.Security.Apparatus
C2;C2:.Factionalized.Elites
C3;C3:.Group.Grievance
E1;E1:.Economy
E2;E2:.Economic.Inequality
E3;E3:.Human.Flight.and.Brain.Drain
P1;P1:.State.Legitimacy
P2;P2:.Public.Services
P3;P3:.Human.Rights
S1;S1:.Demographic.Pressures
S2;S2:.Refugees.and.IDPs
X1;X1:.External.Intervention",
    sep = ";"
  ) |>
    mutate(fsidesc = str_trim(.data$fsidesc))
  return(temp)
}

#' fsi_countries
#'@description
#' This function provide a list of countries in FSI database
#'
#' @return list of countries
#' @export
#'
#' @examples fsi_countries()
fsi_countries <- function() {
  temp <- c(
    "Somalia",
    "Yemen",
    "South Sudan",
    "Congo Democratic Republic",
    "Syria",
    "Afghanistan",
    "Sudan",
    "Central African Republic",
    "Chad",
    "Haiti",
    "Ethiopia",
    "Myanmar",
    "Mali",
    "Guinea",
    "Nigeria",
    "Zimbabwe",
    "Libya",
    "Ukraine",
    "Eritrea",
    "Burundi",
    "Burkina Faso",
    "Mozambique",
    "Cameroon",
    "Niger",
    "Lebanon",
    "Uganda",
    "Iraq",
    "Congo Republic",
    "Venezuela",
    "Sri Lanka",
    "Guinea Bissau",
    "Pakistan",
    "Liberia",
    "Palestine",
    "Kenya",
    "Cote d'Ivoire",
    "Mauritania",
    "North Korea",
    "Angola",
    "Iran",
    "Bangladesh",
    "Equatorial Guinea",
    "Malawi",
    "Rwanda",
    "Comoros",
    "Djibouti",
    "Togo",
    "Zambia",
    "Madagascar",
    "Egypt",
    "Sierra Leone",
    "Turkey",
    "Russia",
    "Cambodia",
    "Nepal",
    "Solomon Islands",
    "Honduras",
    "Swaziland",
    "Colombia",
    "Papua New Guinea",
    "Philippines",
    "Nicaragua",
    "Timor-Leste",
    "Guatemala",
    "Tanzania",
    "Lesotho",
    "Gambia",
    "Jordan",
    "Kyrgyz Republic",
    "Laos",
    "Brazil",
    "Tajikistan",
    "India",
    "Benin",
    "Peru",
    "Azerbaijan",
    "Bosnia and Herzegovina",
    "South Africa",
    "Georgia",
    "Senegal",
    "Bolivia",
    "Fiji",
    "Algeria",
    "Belarus",
    "Mexico",
    "Sao Tome and Principe",
    "Ecuador",
    "Micronesia",
    "El Salvador",
    "Morocco",
    "Thailand",
    "Serbia",
    "Armenia",
    "Moldova",
    "Uzbekistan",
    "Bhutan",
    "Tunisia",
    "Indonesia",
    "Gabon",
    "Saudi Arabia",
    "Samoa",
    "Bahrain",
    "China",
    "Turkmenistan",
    "Paraguay",
    "Maldives",
    "Ghana",
    "Jamaica",
    "Guyana",
    "Dominican Republic",
    "Kazakhstan",
    "Namibia",
    "Macedonia",
    "Cape Verde",
    "Belize",
    "Suriname",
    "Cuba",
    "Vietnam",
    "Montenegro",
    "Cyprus",
    "Albania",
    "Botswana",
    "Greece",
    "Malaysia",
    "Brunei Darussalam",
    "Antigua and Barbuda",
    "Grenada",
    "Seychelles",
    "Romania",
    "Trinidad and Tobago",
    "Bulgaria",
    "Mongolia",
    "Kuwait",
    "Bahamas",
    "Hungary",
    "Panama",
    "Oman",
    "Croatia",
    "Argentina",
    "Barbados",
    "United States",
    "Poland",
    "Israel",
    "Spain",
    "Latvia",
    "Italy",
    "Chile",
    "United Kingdom",
    "Qatar",
    "Costa Rica",
    "Czech Republic",
    "Lithuania",
    "Estonia",
    "Mauritius",
    "Slovak Republic",
    "United Arab Emirates",
    "Uruguay",
    "Malta",
    "South Korea",
    "Belgium",
    "Japan",
    "France",
    "Slovenia",
    "Portugal",
    "Singapore",
    "Germany",
    "Austria",
    "Australia",
    "Netherlands",
    "Sweden",
    "Luxembourg",
    "Ireland",
    "Canada",
    "Denmark",
    "Switzerland",
    "New Zealand",
    "Finland",
    "Iceland",
    "Norway",
    "C\u00F4te d'Ivoire",
    "Kyrgyzstan",
    "North Macedonia",
    "Cabo Verde",
    "Czechia",
    "Slovakia",
    "Eswatini",
    "Israel and West Bank"
  )
  return(temp)
}


#' read_fsi
#' @import dplyr
#' @import lubridate
#' @import tidyr
#' @import stringr
#' @import openxlsx
#' @import rvest
#' @import xml2
#' @importFrom stats setNames
#' @param startyear start year of extraction, the default is NULL
#' @param endyear end year of extraction, the default is NULL
#' @param country a specific country or list of countries, see fsi_countries
#' @param indicator a list of FSI indicator, see fsi_series
#' @param rank extract the rank, default is TRUE
#' @param total extract the Total, default is TRUE
#'
#' @return FSI data.frame
#' @export
#'
#' @examples read_fsi(startyear=2020, endyear=2021)
read_fsi <- function(startyear = NULL,
                     endyear = NULL,
                     country = NULL,
                     indicator = NULL,
                     rank = TRUE,
                     total = TRUE) {
  url <- "https://fragilestatesindex.org/excel"

  webpage <- read_html(url)

  series_extract <- c(
    "Country",
    "Year" ,
    "Rank" ,
    "Total",
    "S1",
    "S2"  ,
    "C3",
    "E3",
    "E2",
    "E1",
    "P1" ,
    "P2",
    "P3",
    "C1",
    "C2",
    "X1"
  )

  series_names <- c(
    "C1" = "C1:.Security.Apparatus",
    "C2" = "C2:.Factionalized.Elites",
    "C3" = "C3:.Group.Grievance" ,
    "E1" = "E1:.Economy" ,
    "E2" = "E2:.Economic.Inequality" ,
    "E3" = "E3:.Human.Flight.and.Brain.Drain",
    "P1" = "P1:.State.Legitimacy",
    "P2" = "P2:.Public.Services",
    "P3" = "P3:.Human.Rights"  ,
    "S1" = "S1:.Demographic.Pressures"  ,
    "S2" = "S2:.Refugees.and.IDPs"  ,
    "X1" = "X1:.External.Intervention"
  )

  link_tbs <- webpage |>
    html_nodes("a") |>
    html_attr("href") |>
    as.data.frame() |>
    setNames("link_var") |>
    rowwise() |>
    mutate(
      path_var = str_extract_all(.data$link_var, pattern = "\\.xlsx", simplify = T)[1],
      link_var = str_trim(.data$link_var),
      year_var = as.integer(str_trim(
        str_remove_all(
          str_extract_all(.data$link_var, pattern = "(\\/\\d{4}\\/)|(\\-\\d{4})", simplify =
                            T)[1],
          pattern = "\\-|\\/"
        )
      ))
    ) |>
    ungroup() |>
    filter(.data$path_var == ".xlsx") |>
    distinct(.data$link_var, .data$year_var)



  if (!is.null(startyear) & !is.null(endyear)) {
    link_tbs <- link_tbs |> filter(.data$year_var >= startyear & .data$year_var <= endyear)
  } else{
    if (!is.null(startyear)) {
      link_tbs <- link_tbs |> filter(.data$year_var >= startyear)
    } else{
      if (!is.null(endyear)) {
        link_tbs <- link_tbs |> filter(.data$year_var <= endyear)
      }
    }
  }

  link_list <- link_tbs |> pull(.data$link_var)

  df_fsi <- lapply(link_list, function(link) {
    cat(".")
    temp <- read.xlsx(link, detectDates = TRUE)|>
            mutate(Year=ifelse(is.Date(.data$Year), year(.data$Year), .data$Year))
    return(temp)
  }) |>
    bind_rows() |>
    rename(all_of(series_names)) |>
    select(all_of(series_extract)) |>
    mutate(Country = str_trim(.data$Country),
           Country = ifelse(.data$Country%in%c("Cote d'Ivoire"), "C\u00F4te d'Ivoire",.data$Country ))

  cat("\n")

  if (!is.null(country)) {
    df_fsi <- df_fsi |> filter(.data$Country %in% country)
  }

  if (!is.null(indicator)) {
    df_fsi <- df_fsi |> select(all_of(c(series_extract[1:4], indicator)))
  }

  if (!rank & !total) {
    df_fsi <- df_fsi |> select(-c(.data$Rank, .data$Total))
  } else{
    if (!rank) {
      df_fsi <- df_fsi |> select(-.data$Rank)
    } else{
      if (!total) {
        df_fsi <- df_fsi |> select(-.data$Total)
      }
    }
  }

  return(df_fsi)

}
