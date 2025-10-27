# 📌 dplyr-Functions-R

Este repositório contém um script em R que demonstra, comenta e exemplifica diversas funções do pacote **dplyr** (versão 1.x) para manipulação de tabelas/data frames.  
O objetivo é servir como **guia rápido didático** ou **material de referência** para quem está aprendendo ou revisando o uso de *verbs*, *seletores* e *funções auxiliares* do dplyr.

---

## 📌 Visão Geral

- Linguagem: R  
- Pacote em foco: [dplyr](https://dplyr.tidyverse.org)  
- Arquivo principal: `main.R`  
- Público-alvo: analistas, cientistas de dados, estudantes ou profissionais que desejam dominar manipulação de dados com dplyr  
- Inclui: exemplos práticos, comentários linha-a-linha, fluxo de trabalho com tibble/data frame, uso de pipes e várias funções menos comuns

---

## 📌 Conteúdo do Script `main.R`

O script abrange os seguintes grupos de funções:

1. **Verbos básicos**: `select()`, `filter()`, `mutate()`, `arrange()`, `summarise()`, `group_by()`  
2. **Funções de agrupamento e subdivisão**: `ungroup()`, `reframe()`, `group_map()`, `group_modify()`, `group_split()`
3. **Seletores de colunas**: `starts_with()`, `ends_with()`, `contains()`, `matches()`, `where()`, `everything()`  
4. **Funções de manipulação de linhas**: `distinct()`, `slice()`, `slice_head()`, `slice_tail()`, `slice_sample()`
5. **Exemplos comentados** — ideal para usar como base, adaptar para exercícios ou incluir em portfólio.

Cada bloco de código está acompanhado de comentários explicativos, para facilitar o entendimento do que está sendo feito e por quê.

---

## 📌 Por que este projeto importa?

* Demonstra domínio de manipulação de dados no R, uma habilidade essencial em ciência de dados.
* Fornece material estruturado que pode facilmente ser adaptado para post de blog, tutorial, materiais de treinamento interno ou seção de portfolio.
* Facilita a demonstração de boas práticas: uso de tibble, pipe (%>%), clareza nos comentários, modularidade de blocos de código.

---

## 📌 Pré-requisitos
Antes de rodar o projeto, você precisa ter:

* [Linguagem R](https://cran.r-project.org/) instalada (versão recomendada: ≥ 4.5.1)
* [RStudio](https://posit.co/download/rstudio-desktop/) instalado
* Instalação da [Linguagem R:](https://informaticus77-r.blogspot.com/2025/09/blog-post.html)
* Microtutorial [RStudio:](https://informaticus77-r.blogspot.com/2025/09/blog-post_8.html)

---

## 📌 Como usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/jcarlossc/dplyr-functions-r.git
   cd dplyr-functions-r
   ````

---

## 📌 Ativar ambiente virtual com renv
Este projeto utiliza o pacote renv para gerenciar dependências de forma reprodutível.
1. Abra o projeto no RStudio.
2. Ative o ambiente e restaure as dependências:
```
# Estes comandos devem ser executados no console do RStudio.

renv::activate()   # Ativa o ambiente virtual
renv::restore()    # Instala as dependências
```
3. Verifique se tudo está funcionando:
```
# Este comando deve ser executado no console do RStudio.
renv::status()
```

---

## 📌 Sobre
Este material foi criado para servir como introdução ao R, com exemplos simples e organizados para facilitar o aprendizado inicial.

---

## 📌 Contribuições
Se quiser contribuir:
1. Faça um fork deste repositório
2. Crie uma branch para sua feature ou correção (git checkout -b minha-feature)
3. Faça commits descritos claramente
4. Submeta um Pull Request

---

## 📌 Licença
Este projeto está licenciado sob a MIT License.

---

## 📌 Contatos
📌Autor: Carlos da Costa<br>
📌Recife, PE - Brasil<br>
📌Telefone: +55 81 99712 9140<br>
📌Telegram: @jcarlossc<br>
📌Blogger linguagem R: [https://informaticus77-r.blogspot.com/](https://informaticus77-r.blogspot.com/)<br>
📌Blogger linguagem Python: [https://informaticus77-python.blogspot.com/](https://informaticus77-python.blogspot.com/)<br>
📌Email: jcarlossc1977@gmail.com<br>
📌Portfólio em construção: https://portfolio-carlos-costa.netlify.app/<br>
📌LinkedIn: https://www.linkedin.com/in/carlos-da-costa-669252149/<br>
📌GitHub: https://github.com/jcarlossc<br>
📌Kaggle: https://www.kaggle.com/jcarlossc/  
📌Twitter/X: https://x.com/jcarlossc1977

---
