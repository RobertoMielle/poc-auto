# Conexão com banco de dados SQL de dados tratados
sql_tratados <- conectar_sql(local = "dados/dados_tratados.db")


# Transformar conexão em objteto tible com fonte externa
tbl_tratados <- dplyr::tbl(
    src = sql_tratados,
    from = "tbl_tratados")

# Salvar tabela como CSV
readr::write_csv(
    x = dplyr::collect(tbl_tratados),
    file = "Aplicacao/dados_disponibilizados.csv"
    )

#Encerrar conexão
DBI::dbDisconnect(conn = sql_tratados)
