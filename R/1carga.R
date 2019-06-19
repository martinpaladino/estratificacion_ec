# Librerías=========

library(haven)
library(tidyverse)

# Carga datos=======

personas <- read_sav("datos/PERSONAS NSE.sav")
hogares <- read_sav("datos/VIVIENDA_HOGAR NSE.sav")

# Base conjunta=======

# Acá va a venir el código para unir las dos bases de datos...
