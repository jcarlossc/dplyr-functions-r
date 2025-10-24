# -----------------------------------------------------------------------------
# Manipulação de Dados com o Pacote dplyr
# -----------------------------------------------------------------------------  

# O pacote dplyr é uma das ferramentas mais poderosas e populares
# para manipulação e transformação de dados na linguagem R. 
# Ele faz parte do ecossistema tidyverse e oferece uma sintaxe 
# simples, expressiva e eficiente para trabalhar com data 
# frames (ou tibbles).

# <p>O dplyr foi criado para simplificar o trabalho com conjuntos 
# de dados tabulares. Ele permite selecionar, filtrar, ordenar, 
# agrupar e resumir informações de forma clara e performance otimizada.</p>

# Instalar o pacote
# install.packages("dplyr")

# Carregar
library(dplyr)

# Criação de um data frame fictício sobre funcionários.
dados <- data.frame(
  nome = c("Ana", "Bruno", "Carlos", "Daniela", "Eduardo", "Fernanda", "Gustavo", "Helena"),
  idade = c(25, 32, 40, 29, 45, 38, 27, 34),
  cargo = c("Analista", "Gerente", "Técnico", "Analista", "Diretor", "Coordenadora", "Estagiário", "Analista"),
  salario = c(3500, 7200, 2800, 4000, 12000, 6500, 1500, 3800),
  departamento = c("TI", "RH", "Manutenção", "TI", "Administração", "RH", "TI", "Marketing"),
  remoto = c(TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE)
)

# -----------------------------------------------------------------------------
# As seis funções básicas.
# -----------------------------------------------------------------------------

# SELECT() - Seleciona colunas.
select(dados, nome)
# ou neste formato para usar várias funções agrupadas.
dados %>%
  select(nome)

#FILTER() -  Filtra linhas com base em condições.
filter(dados, idade > 40)
# ou.
dados %>%
  filter(idade > 40)

# MUTATE - Cria ou modifica colunas.
mutate(dados, salario_mais_abono = (salario * 0.10) + salario)
# ou.
dados %>%
  select(nome, salario) %>%
  mutate(valor_abono = dados$salario * 0.10) %>%
  mutate(total = (dados$salario * 0.10) + salario)

# SUMMARISE() OU SUMMARIZE() - Resume os dados (normalmente com group_by).
summarise(dados, mean(salario))
# ou.
summarize(dados, median(salario))
# ou.
dados %>%
  select(salario) %>%
  summarise(mean(salario)) 

# ARRANGE() - Ordena linhas.
arrange(dados, idade)
# ou.
dados %>%
  select(salario) %>%
  arrange(salario)

# GROUP_BY() - Agrupa dados para operações de resumo.
group_by(dados, nome)
# ou.
dados %>%
  group_by(departamento) %>%
  summarise(media_salarial = mean(salario))














