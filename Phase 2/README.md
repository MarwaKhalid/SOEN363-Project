# SOEN 363 - Phase 2

## 2.1 - Analyzing Big Data With SQL and RDBMS
### Dataset
#### About Dataset
- contains information about 17,562 animes and the preference from over 300 000 different users.
- Provides the anime list per user, their ratings, and more.
- [Dataset Link](https://www.kaggle.com/datasets/hernan4444/anime-recommendation-database-2020?select=anime.csv)

#### Dataset Information
- **Size**: 2.87 GB
- **Format**: CSV
- **Number of files**: 5
  - anime_list.csv: contains the list of unique animes per user with rating and other information
  - ratings_completed.csv: contains the list of ratings given by the user to animes with watching status = 2 (complete)
  - anime.csv: contains information of anime scrapped of main page and stats page

### Tools Used
**Data System**: PostgreSQL<br/>
**Software**: pgAdmin

## 2.2 - Analyzing Big Data Using NoSQL Document Database
### Dataset
#### About Dataset
- contains reported incidents of crime that occurred in the City of Chicago from 2001 to present
- Provides information such as case number, date and more.
- [Dataset Link](https://catalog.data.gov/dataset/crimes-2001-to-present)

#### Dataset Information
- **Size**: 1.93 GB
- **Format**: CSV
- **Number of files**: 1
  - Crimes-2001_to_Present.csv: list of crimes and their details

### Tools Used
**Software**: CouchBase
