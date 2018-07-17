# Instala as bibliotecas e suas dependencias
install.packages('arules')
install.packages('arulesViz')

# Importa e carrega as biblioteca para o uso delas no worspace
library(arules)
library(arulesViz)

# Carrega o arquivo 'transacoes2.txt', que simula em cada linha um carringo de compras
transacoes = read.transactions(file.choose(), format = 'basket', sep = ',')
image(transacoes) #Cria uma pseudo-imagem do arquivo de texto

# Aqui deixamos a biblioteca do R trabalhar, aplicando ao nosso arquivo um dos algoritmos de recomendação mais clássico, o Eclad
regras <- eclat(transacoes, parameter = list(supp = 0.1, maxlen = 15))
inspect(regras)

# Gera-se gráficos de dispersão comparando a confiança com o suporte de cada regra
plot(regras, method = 'graph', control = list(type = 'items'))
