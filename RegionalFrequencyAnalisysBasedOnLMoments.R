# M�todo de Hosking y Wallis (1993, 1997) para el an�lisis regional de frecuencias de precipitaci�n

rm(list = ls()) # Limpia el ambiente global

library(lmomRFA) # libreria donde est�n las funciones para ejecutar el programa

# Direcci�n donde se ecuentran los datos
setwd("")

# Lectura de los datos
A = read.table(file="", header=TRUE, sep="\t")
A # Matriz de datos
str(A) # Reorganizaci�n de los datos

regsamlmu(A) # Funci�n que determina los momentos lineales
regtst(regsamlmu(A)) # Funci�n que determina las medidas de discordancia, heterogeneidad y determina la mejor funci�n de distribuci�n
summary(regtst(regsamlmu(A))) # Da un resumen de todos los par�metros
lmrd(regsamlmu(A)) # Muestra la distribuci�n de frecuencia apropiada 

# Obtenci�n de los par�metros de distribuc�n de frecuencia apropiada
rfit <- regfit(regsamlmu(A), "gno")
rfit                        
rfit$index   

# Determinaci�n de los cuantiles
sitequant(c(0.500, 0.800, 0.900, 0.960, 0.980, 0.990), rfit, sitenames=1:9)

evplot(rfit, xlim = c(0.5,7), ylim = c(0,3.5)) # Grafica la curva regional de crecimiento    

