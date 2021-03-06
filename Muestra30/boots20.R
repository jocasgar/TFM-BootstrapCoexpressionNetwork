library(CoExpNets)
library(CoExpROSMAP)
CoExpROSMAP::initDb()
library(WGCNA)
WGCNA::enableWGCNAThreads(6)

# Cargamos la base de datos disponible
expr.data = getExprDataFromTissue(tissue="notad",
                                  which.one="CoExpROSMAP")

# Seleccionamos una submuestra de tamaño 190
set.seed(12345)
exp.data2 <- expr.data[sample(nrow(expr.data),30),]

start.time1 <- Sys.time()
# Lanzamos el proceso de creación de la red bootstrap
set.seed(12345)
getBootstrapNetwork(mode = "bootstrap",expr.data = exp.data2, 
                    job.path = "results20/",
                    removeTOMF = TRUE, blockTOM = TRUE,
                    annotateFinalNet = TRUE,
                    b = 20)
end.time1 <- Sys.time()
end.time1 - start.time1