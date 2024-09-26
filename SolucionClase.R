#codigo segunda practica
  #todo se ejecuta con ctrl+enter
iris
mis_dades <- iris

y <- mis_dades$Sepal.Length
y

x <- mis_dades$Petal.Length
x

#si los petalos son grandes, los sepalos tambien?

plot(x,y)
    #Por Gauss, vemos como hacer la recta de regression lineal
    #midiendo la distancia cuadratica en el eje y de cada una de las muestras q^2=sum(y-yr)^2
    #al hacer el sumatorio, equivale a la variancia. Buscamos la recta que minimíza la variància
    # y = mx + b --> Q^2=sum(yi-(mxi+b))^2. Se calcula con la derivada parcial sobre m i b igualada a 0
    #De eso sale m=(sum((xi-xmedia)*(yi-ymedia)))/(sum(xi-xmedia)^2))
    #b=ymedia-mxmedia
  #(media es mean)

#Ej 1, encontrar m, la interseccion de la recta con el eje y (b) y la prediccion del petal length=1.5

#a)
xbar <- mean(x)
xbar
    #3.758
ybar <- mean(y)
ybar
    #5.843333

m <- sum((x-xbar)*(y-ybar))/sum((x-xbar)^2)
m
    # 0.4089223
b <- ybar - m*xbar
b
    # 4.306603
#b) cuando x = 1.5
m*1.5+b
  #4.919987

  #si queremos dibujar la linea para ver todos los valores
mod <- lm(y~x) #altgr+4+space para el gusanito
ypredicted <- predict(mod, data.frame(x=x)) #data.frame(x=x) base de datos de una columna que se llama x y usa los valores de x
ypredicted

plot(x,y, pch=16, col='red')
lines(x, ypredicted) #se superpone al plot anterior
  #plot(x,ypredicted) hace solo la recta

  #para ver en que medida es buena la recta (si es cercana o lejana a los datos)
    #consideramos r^2=0 cuando hay dispersion total, r^2=1 si no hay dispersion
    #a mayor precision, mas cercano a 1, mas forma de linea con los datos originales
    #R^2= sum(ypredicted-ybar)^2/sum(yi-ybar)^2

Rsq <- sum((ypredicted-ybar)^2)/sum((y-ybar)^2)
Rsq
    #Rsq = 0.7599546
sqrt(Rsq) #lo mismo que cor.test(x,y)

summary(mod) #da toda la informacion sobre la recta, tarda

















