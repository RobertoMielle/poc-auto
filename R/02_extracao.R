# Importa dados da DBNOMICS (fonte Banco Mundi - WDI)
dados_brutos <- rdbnomics::rdb(
  api_link = paste0(
    "https://api.db.nomics.world/v22/series/WB/WDI?dimensions=%7B%22indicator%",
    "22%3A%5B%22NY.GDP.MKTP.KD.ZG%22%2C%22FP.CPI.TOTL.ZG%22%2C%22SL.UEM.TOTL.N",
    "E.ZS%22%2C%22FR.INR.DPST%22%2C%22PA.NUS.FCRF%22%5D%2C%22frequency%22%3A%5",
    "B%22A%22%5D%2C%22country%22%3A%5B%22ARG%22%2C%22AUS%22%2C%22BEL%22%2C%22B",
    "RA%22%2C%22CMR%22%2C%22CAN%22%2C%22CRI%22%2C%22HRV%22%2C%22DNK%22%2C%22EC",
    "U%22%2C%22GBR%22%2C%22FRA%22%2C%22DEU%22%2C%22GHA%22%2C%22IRN%22%2C%22JPN",
    "%22%2C%22KOR%22%2C%22MEX%22%2C%22MAR%22%2C%22NLD%22%2C%22POL%22%2C%22PRT%",
    "22%2C%22QAT%22%2C%22SAU%22%2C%22SEN%22%2C%22SRB%22%2C%22ESP%22%2C%22CHE%2",
    "2%2C%22TUN%22%2C%22USA%22%2C%22URY%22%2C%22EMU%22%5D%7D&observations=1"
    )
  )

# Criar banco de dados SQL
sql_brutos <- conectar_sql(local = "dados/dados_brutos.db")


#Armazenar dados em tabela no banco SQL
DBI::dbWriteTable(
  conn  = sql_brutos,
  name  = "tbl_brutos",
  value = dados_brutos,
  overwrite = TRUE
  )

#Encerrar conexão
DBI::dbDisconnect(conn = sql_brutos)
