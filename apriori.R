# Instala as bibliotecas e suas dependencias
install.packages('arules') 
install.packages('arulesViz')

# Importa e carrega as biblioteca para o uso delas no worspace
library(arules)
library(arulesViz)

# Carrega o arquivo 'transacoes.txt', que simula em cada linha um carringo de compras
transacoes = read.transactions(file.choose(), format = 'basket', sep = ',')
transacoes #Imprime na tela algumas o tamanho (em linhas e colunas) do arquivo
inspect(transacoes) #Imprime uma array de objetos, referentes a cada item em cada linha do arquivo
image(transacoes) #Cria uma pseudo-imagem do arquivo de texto

# Aqui deixamos a biblioteca do R trabalhar, aplicando ao nosso arquivo um dos algoritmos de recomendação mais clássico, o Apriori
regras = apriori(transacoes, parameter = list(supp = 0.5, conf = 0.5)) #Passamos o arquivo e uma taxa de acerto para o cálculo de suporte e confiança do algoritmo
regras #Imprime o número de regras encontradas no arquivo
inspect(regras) #Relaciona todos os items do arquivo e calcula me % a quantidade de vezes que os items se relacionam

# Gera-se gráficos de dispersão comparando a confiança com o suporte de cada regra
plot(regras)
plot(regras, method = 'graph', control = list(type = 'items'))
