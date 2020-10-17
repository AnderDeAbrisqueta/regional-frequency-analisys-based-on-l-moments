# Método de Hosking y Wallis (1993, 1997) para el análisis regional de frecuencias de precipitación

rm(list = ls()) # Limpia el ambiente global

library(lmomRFA) # libreria donde están las funciones para ejecutar el programa

# Dirección donde se ecuentran los datos
setwd("")

# Lectura de los datos
A = read.table(file="", header=TRUE, sep="\t")
A # Matriz de datos
str(A) # Reorganización de los datos

regsamlmu(A) # Función que determina los momentos lineales
regtst(regsamlmu(A)) # Función que determina las medidas de discordancia, heterogeneidad y determina la mejor función de distribución
summary(regtst(regsamlmu(A))) # Da un resumen de todos los parámetros
lmrd(regsamlmu(A)) # Muestra la distribución de frecuencia apropiada 

# Obtención de los parámetros de distribucón de frecuencia apropiada
rfit <- regfit(regsamlmu(A), "gno")
rfit                        
rfit$index   

# Determinación de los cuantiles
sitequant(c(0.500, 0.800, 0.900, 0.960, 0.980, 0.990), rfit, sitenames=1:9)

evplot(rfit, xlim = c(0.5,7), ylim = c(0,3.5)) # Grafica la curva regional de crecimiento    

