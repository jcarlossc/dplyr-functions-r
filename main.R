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
  idade = c(25, 61, 40, 29, 45, 38, 27, NaN),
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

# ----------------

#FILTER() -  Filtra linhas com base em condições.
filter(dados, idade > 40)
# ou.
dados %>%
  filter(idade > 40)

# ----------------

# MUTATE - Cria ou modifica colunas.
mutate(dados, salario_mais_abono = (salario * 0.10) + salario)
# ou.
dados %>%
  select(nome, salario) %>%
  mutate(valor_abono = dados$salario * 0.10) %>%
  mutate(total = (dados$salario * 0.10) + salario)

# ----------------

# SUMMARISE() OU SUMMARIZE() - Resume os dados (normalmente com group_by).
summarise(dados, mean(salario))
# ou.
summarize(dados, median(salario))
# ou.
dados %>%
  select(salario) %>%
  summarise(mean(salario)) 

# ----------------

# ARRANGE() - Ordena linhas.
arrange(dados, idade)
# ou.
dados %>%
  select(salario) %>%
  arrange(salario)

# ----------------

# GROUP_BY() - Agrupa dados para operações de resumo.
group_by(dados, nome)
# ou.
dados %>%
  group_by(departamento) %>%
  summarise(media_salarial = mean(salario))


# -----------------------------------------------------------------------------
# 2. Funções de junção (joins).
# -----------------------------------------------------------------------------

# Data frame 1: alunos e suas notas
alunos <- tibble(
  id = c(1, 2, 3, 4),
  nome = c("Ana", "Bruno", "Carlos", "Diana"),
  nota = c(8.5, 7.2, 9.1, 6.8)
)

# Data frame 2: turmas.
turmas <- tibble(
  id = c(2, 3, 4, 5),
  turma = c("A", "B", "A", "C")
)

# INNER_JOIN() - Retém apenas correspondências.
inner_join(alunos, turmas, by = "id")

# ----------------

# LEFT_JOIN() - Retém todas de aluno, adiciona de turmas se corresponder.
left_join(alunos, turmas, by = "id")

# ----------------

# RIGHT_JOIN() - Retém todas de turma, adiciona de alunos se corresponder.
right_join(alunos, turmas, by = "id")

# ----------------

# FULL_JOIN() - Retém todas de ambos.
full_join(alunos, turmas, by = "id")

# ----------------

# SEMI_JOIN() - Retém apenas linhas de alunos com correspondência em turma.
semi_join(alunos, turmas, by = "id")

# ----------------

# ANTI_JOIN() - Retém apenas linhas de alunos sem correspondência em turma.
anti_join(alunos, turmas, by = "id")


# -----------------------------------------------------------------------------
# 3. Funções de combinação e ligação de data frames.
# -----------------------------------------------------------------------------

# Data frame 1: cliente
cliente <- tibble(
  id = c(1, 2, 3, 4),
  nome = c("Carlos", "Bruno", "Soares", "Jose")
)

# Data frame 2: clientes
clientes <- tibble(
  id = c(1, 2, 3, 4),
  nome = c("Carlos", "Teresa", "Soares", "Jose")
)

# BIND_ROWS() - Une data frames empilhando linhas.
bind_rows(clientes, cliente)

# ----------------

# BIND_COLS() - Une data frames lado a lado (colunas).
bind_cols(clientes, cliente)

# ----------------

# UNION() - Une data frames removendo duplicatas.
union(clientes, cliente)

# ----------------

# INTERSECT() - Retorna linhas comuns.
intersect(clientes, cliente)

# ----------------

# SETDIFF() - Retorna linhas de clientes que não estão em cliente.
setdiff(clientes, cliente)


# -----------------------------------------------------------------------------
# 4. Funções auxiliares para colunas.
# -----------------------------------------------------------------------------

# RENAME() - Renomeia colunas.
rename(dados, nome_funcionario = nome)
# ou.
dados %>%
  rename(depart = departamento)

# RENAME_WITH() - Renomeia várias colunas com uma função.
rename_with(dados, toupper)
# ou.
dados %>%
  rename_with(toupper)

# RELOCATE() - Reorganiza ordem das colunas.
relocate(dados, cargo, .before = idade)
# ou.
dados %>%
  relocate(salario, .before = remoto)

# PULL() - Extrai uma coluna como vetor.
pull(dados, idade)
#ou.
dados %>%
  pull(nome)

# ACROSS() - Aplica função a várias colunas.
# Ex: sobre os dados_01, onde for numérico, aplique a função de média.
dados %>%
  summarise(across(where(is.numeric), mean))


# -----------------------------------------------------------------------------
# 5. Funções de contagem e amostragem.
# -----------------------------------------------------------------------------

# COUNT() - Conta número de observações por grupo.
count(dados, departamento)
# ou.
dados %>%
  count(departamento)

# ----------------

# ADD_COUNT() - Adiciona coluna de contagem sem agrupar.
add_count(dados, departamento)
# ou.
dados %>%
  add_count(departamento)

# ----------------

# SUMMARASE() - Retorna tamanho do grupo (usado dentro de summarise).
summarise(dados, n())
# ou.
summarize(dados, n())
# ou.
dados %>%
  summarise(n()) 

# ----------------

# N_DISTINCT() - Conta número de valores distintos.
n_distinct(dados$departamento)
# ou.
dados %>%
  select(departamento) %>%
  n_distinct()

# ----------------

# SAMPLE_N() - Amostra n linhas aleatórias.
sample_n(dados_01, 3)
# ou.
dados %>%
  sample_n(3)

# ----------------

# SAMPLE_FRAC() - Amostra uma fração de linhas.
sample_frac(dados, 0.3)
# ou.
dados %>%
  sample_frac(0.4)


# -----------------------------------------------------------------------------
# 6. Manipulação condicional e de valores.
# -----------------------------------------------------------------------------

# IF_ELSE() - Condicional vetorizada,
mutate(dados, status = if_else(idade > 18, "adulto", "menor"))
# ou.
dados %>%
  mutate(status = if_else(idade > 18, "adulto", "menor"))

# ----------------

# CASE_WHEN() - Múltiplas condições.
mutate(dados, faixa = case_when(idade < 18 ~ "jovem", idade < 60 ~ "adulto", TRUE ~ "idoso"))
# ou.
dados %>%
  mutate(faixa = case_when(idade < 18 ~ "jovem", idade < 60 ~ "adulto", TRUE ~ "idoso"))

# ----------------

# COALESCE() - Substitui valores NA por outro.
coalesce(dados$idade, 0)

# ----------------

# BETWEEN() - Verifica se valores estão entre dois limites.
filter(dados, between(idade, 18, 30))
# ou.
dados %>%
  filter(between(idade, 18, 30))


# -----------------------------------------------------------------------------
# 7. Agrupamento avançado.
# -----------------------------------------------------------------------------

# Agrupando a coluna salário.
departamento_agrupado <- dados %>%
  group_by(departamento)

# Imprime grupo.
departamento_agrupado

# Remove o agrupamento, voltando ao formato original.
departamento_agrupado %>%
  summarise(media_salario = mean(salario)) %>%
  ungroup() %>%
  mutate(media_geral = mean(media_salario))

# ----------------

# Retorna sempre um novo data frame, mesmo dentro de um summarise() — 
# útil quando se quer mais de uma linha por grupo.
dados %>%
  group_by(departamento) %>%
  reframe(
    min_salario = min(salario),
    max_salario = max(salario)
  )

# ----------------

# Aplica uma função a cada grupo e retorna uma lista (não combina 
# automaticamente os resultados).
dados %>%
  group_by(departamento) %>%
  group_map(~ summarise(.x, media = mean(salario)))

# ----------------

# Aplica uma função a cada grupo e combina os resultados em um 
# único data frame.
dados %>%
  group_by(departamento) %>%
  group_modify(~ summarise(.x, media = mean(salario)))

# ----------------

# Divide o data frame em uma lista de sub–data frames (um por grupo).
lista_departamentos <- dados %>%
  group_by(departamento) %>%
  group_split()

# Visualizar o primeiro grupo (ex: "RH")
lista_departamentos[[1]]  

# ----------------

# Retorna as chaves únicas (valores distintos usados para agrupar).
dados %>%
  group_by(departamento, salario) %>%
  group_keys()

# ----------------

# Retorna o índice numérico do grupo ao qual cada linha pertence.
dados %>%
  group_by(departamento) %>%
  mutate(indice = group_indices())









