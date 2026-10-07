#!/bin/bash
# Filename: script-criar-modulos-certifications.sh

#########################################################
#
# Auth: Paulo Sérgio <pss1suporte@gmail.com>
# Describe: Script para criar os submódulos dos certificados para o "Claude Training Lab"
# version: 1.0
# license: MIT License
#
#########################################################

#########################################################
#
# Describe:
# Referencia:
#
#########################################################
function ClaudeCertificationsScriptsUteis.ScriptCriarModulosCertifications() {

  #############################################################
  ## PASSO NN: Base Código-fonte » MÓDULOS: Submódulos Array
  #############################################################
  export ARTIFACT_ID_GRAND="agents-ia-certifications"
  export ARTIFACT_ID_PARENT="ccdvf-claude-developer"
  export NAME_PROJECT="TopicoXpto1"
  export ARTIFACT_ID="topico-xpto-1"
  export GROUP_ID="br.com.topico_xpto_1"
  export ARCH="arch/clean"
  export TARGET_LANG="java"
  export ARTIFACT_ID_PARENT_PATH="${HOME}/projetos/${ARTIFACT_ID_GRAND}/${ARTIFACT_ID_PARENT}"
  export WORK_PATH="${ARTIFACT_ID_PARENT_PATH}"

  mkdir -p "${ARTIFACT_ID_PARENT_PATH}"
  cd "${ARTIFACT_ID_PARENT_PATH}"

  # Array key=value :: GROUP_ID=ARTIFACT_ID
  modulosFilhos=(
  "br.com.d1.agents.workflows=d1-agents-workflows"
  "br.com.d2.applications.integration=d2-applications-integration"
  "br.com.d3.claude.code=d3-claude-code"
  "br.com.d4.eval.testing.debugging=d4-eval-testing-debugging"
  "br.com.d5.model.selection.optimization=d5-model-selection-optimization"
  "br.com.d6.prompt.contex.engineering=d6-prompt-contex-engineering"
  "br.com.d7.security.safety=d7-security-safety"
  "br.com.d8.tools.mcps=d8-tools-mcps"
  )

# Loop principal
for item in "${modulosFilhos[@]}"; do

  ARTIFACT_ID="${item#*=}"

  # verifica se possui hífen
  if [[ "$ARTIFACT_ID" == *-* ]]; then
    cc_ARTIFACT_ID=$(to_camel_case "$ARTIFACT_ID" "-")
  fi

	echo -e ""
	echo -e ""
	echo -e ""
	echo -e "###################################################################"
    if [ ! -d "${ARTIFACT_ID}" ]
	then

    mkdir -p "${ARTIFACT_ID}"
    mkdir -p "${ARTIFACT_ID}/docs/evidencias/imgs"
    touch "${ARTIFACT_ID}/docs/evidencias/imgs/.gitkeep"
    mkdir -p "${ARTIFACT_ID}/docs/evidencias/audios"
    touch "${ARTIFACT_ID}/docs/evidencias/audios/.gitkeep"
    touch "${ARTIFACT_ID}/docs/README.md"

	else
		echo -e "Já existe o Módulo: ${ARTIFACT_ID}"
	fi

    echo "ARTIFACT_ID = $ARTIFACT_ID"
    echo "cc_ARTIFACT_ID = $cc_ARTIFACT_ID"
	echo -e "###################################################################"
	echo -e ""
	echo -e ""
	echo -e ""


done

}

export -f ClaudeCertificationsScriptsUteis.ScriptCriarModulosCertifications

#########################################################


#########################################################
#
# Função para converter kebab-case -> camelCase
# $1 = String de entrada
# $2 = token seaparado
#
# Referencia:
#
#########################################################
to_camel_case() {
  local input="$1"
  local separa="$2"

  # separa pelo hífen
  IFS="$separa" read -ra PARTS <<< "$input"

  local result="${PARTS[0]}"

  # começa da segunda posição
  for ((i=1; i<${#PARTS[@]}; i++)); do
    word="${PARTS[$i]}"

    # primeira letra maiúscula
    result+="${word^}"
  done

  echo "$result"
}

export -f to_camel_case
#########################################################


#########################################################
#
# Describe: Script para inserir conteúdo em um arquivo
# $1 = Arquivo de Destino que receberá o conteúdo!
# $2 = O conteúdo a ser inserido!
# $3 = Token a ser usado como referencia de local a ser usado para inserir!
#
# Referencia:
#
#########################################################
function insertContent(){

	if [ $# -le 0 ]
	then
		echo "##############################################"
		echo "Parametros obrigatórios: "
		echo " >> \$1 = Arquivo de Destino que receberá o conteúdo!"
		echo " >> \$2 = O conteúdo a ser inserido!"
		echo " >> \$3 = Token a ser usado como referencia de local a ser usado para inserir!"
		echo ""
		echo "NOTA: Os argumentos de entrada para o processamento do algoritmo"
		echo "      devem ser passado pelo arquivo de variáveis de ambiente."
		echo "      Tome como base modelo o arquivo: "
		echo "        >> ${HOME}/projetos/scripts-shell-uteis/src/main/core/templates/env_works_modelo.sh"
		echo "##############################################"
		read -t 5 -p "Favor verificar!!    .... 5 seconds only ..."
		echo ""
		echo ""
		return;
	fi

	tempfileAux=$(mktemp -t tmp.XXXXXX)
	fileDestino="$1"
	contentReplace="$2"
	token="$3"


	finalContent=""


	while read line
	do

		if ( [ "$line" = "$token" ] )
		then

		   line=$(echo ${line} | sed s/$line//)
		   line_e=$(echo -e "$line")
		   finalContent+=" \n ${line_e} \n $contentReplace \n $token"
		else
			line_e=$(echo -e "$line")
			finalContent+="${line_e} \n"
		fi
	done < "$fileDestino"

	echo -e "$finalContent" > "${fileDestino}"

	echo ""
	return 0;
}

export -f insertContent
#########################################################

cd ${HOME}
