# Librerías=========

library(haven)
library(tidyverse)

# Carga datos=======

personas <- read_sav("datos/PERSONAS NSE.sav")
hogares <- read_sav("datos/VIVIENDA_HOGAR NSE.sav")

# Generar los diccionarios de variables utilizando el atributo label
# Es un atibuto que se hereda del archivo de SPSS. Es dificil de manejar en R
# Por eso es mejor extraerlo y ponerlo en un data.frame
# map() itera sobre los elementos de una lista

diccionario_personas <- map(personas, attr, "label") %>% 
                        map(~ifelse(length(.x) != 1, "Sin etiqueta", .x)) %>% 
                        map(as_tibble) %>% 
                        bind_rows(.id = "código") %>% 
                        set_names(c("código", "etiqueta"))

diccionario_hogares <- map(hogares, attr, "label") %>% 
                        map(~ifelse(length(.x) != 1, "Sin etiqueta", .x)) %>% 
                        map(as_tibble) %>% 
                        bind_rows(.id = "código") %>% 
                        set_names(c("código", "etiqueta"))

# Paso a la clase factor, que es más manejable en R

personas <- as_factor(personas)
hogares <- as_factor(hogares) # Listo!

# Base conjunta=======

unida <- left_join(personas, hogares, by = "idenhog")
