#!/bin/bash
########################################
#
# Filename: env_works_ClaudeCertificationsScriptsUteis.sh
#
# Variaveis global para o projeto: ClaudeCertificationsScriptsUteis
#
########################################

########################################
#
# Se necessário importar aqui:
#. env_works_general_ClaudeCertificationsScriptsUteis.sh
#
# veja o arquivo modelo em:
#   -> /home/$USER_OS/projetos/scripts-shell-uteis/src/main/core/templates/env_works/env_works_general_MODELO.sh
########################################

########################################
#
# Se necessário importar aqui:
#. env_works_audit_ClaudeCertificationsScriptsUteis.sh
#
# veja o arquivo modelo em:
#   -> /home/$USER_OS/projetos/scripts-shell-uteis/src/main/core/templates/env_works/env_works_audit_modelo.sh
########################################

########################################
#
# Se necessário importar aqui:
#. env_works_maven_ClaudeCertificationsScriptsUteis.sh
#
# veja o arquivo modelo em:
#   -> /home/$USER_OS/projetos/scripts-shell-uteis/src/main/core/templates/env_works/env_works_maven_MODELO.sh
########################################

########################################
#
# Se necessário importar aqui:
#. env_works_README_ClaudeCertificationsScriptsUteis.sh
#
# veja o arquivo modelo em:
#   -> /home/$USER_OS/projetos/scripts-shell-uteis/src/main/core/templates/env_works/env_works_README_MODELO.sh
########################################

########################################
#
# Se necessário importar aqui:
#. env_works_README_ClaudeCertificationsScriptsUteis.sh
#
# veja o arquivo modelo em:
#   -> /home/$USER_OS/projetos/scripts-shell-uteis/src/main/core/templates/env_works/env_works_README_MODELO.sh
########################################

########################################
#
# Se necessário importar aqui:
#. env_works_tool_generate_ClaudeCertificationsScriptsUteis.sh
#
# veja o arquivo modelo em:
#   -> /home/$USER_OS/projetos/scripts-shell-uteis/src/main/core/templates/env_works/env_works_tool_generate_MODELO.sh
########################################

########################################
#
# Variaveis de entrada especificas para o processamento do
# algoritmo: ClaudeCertificationsScriptsUteis
#
########################################


# primeiro argumento
export USER_OS="pssilva"
export ROOT_PATH_SRC="${HOME}/projetos/scripts-shell-uteis/src"
export NAME_PROJECT="ClaudeCertificationsScriptsUteis"
export PATH_WORK_PROJETO="${HOME}/projetos/$ARTIFACT_ID"

########################################



today=$(date +%d/%m/%Y)
SUFIX_BKP=$(date +%s)
DATATIME_SUFIX=$(date +%Y%m%d_%s)
NAME_APP="Nome por extenso :: (${NAME_PROJECT})"
NAME_MODULE="${NAME_PROJECT} :: NameModule"
PATH_WORK_BIN="$ROOT_PATH_SRC/main/automation/${NAME_PROJECT}/bin"
DATA_PATH_CRAWLER="$ROOT_PATH_SRC/main/automation/${NAME_PROJECT}/tmp"
TEMPLATE_PATH="$ROOT_PATH_SRC/main/automation/${NAME_PROJECT}/templates"

DEPENDENCIES='data-jpa,web,data-rest,devtools,hateoas,restdocs,mysql,lombok,hateoas,devtools,web-services'
BUILD=maven
JAVA_VERSON=8
GROUP_ID="br.com.$NAME_PROJECT"
ARTEFACT_ID='lotek-lock-scripts-uteis'
DESCRIPTION='Descrição do projeto: $NAME_PROJECT e com o tipo de Licença!!'
