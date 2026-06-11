# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.
#
#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
# En lugar de partir de cero, partimos de la imagen oficial de Kali Linux
# en su versión "rolling" (actualización continua, siempre al día).
# Todo lo que instalemos más abajo se apila ENCIMA de esta base.
#                   DOCUMENTATION
# ============================================================================
# Docker builds images by executing instructions from top to bottom.
#
# Each instruction creates a separate image layer. Docker can reuse
# unchanged layers from its cache, making future builds faster.
#
# Because Docker uses layer caching, the order of instructions matters.
# If an early instruction changes, Docker must rebuild every layer that
# comes after it.
#
# These concepts are introduced in Black Hat Bash Chapter 3 when working
# with Kali Linux containers and laboratory environments.
# ============================================================================


# ----------------------------------------------------------------------------
# Base image used for the course environment
# ----------------------------------------------------------------------------
# A Docker image acts as a template that already contains an operating
# system and software. Additional layers are added on top of this image.
#
# Kali Linux is selected because it includes many networking and security
# tools that will be used throughout the course (BHB Ch.3).
FROM kalilinux/kali-rolling:latest


# ----------------------------------------------------------------------------
# ENV: variables de entorno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
#                   DOCUMENTATION
# ----------------------------------------------------------------------------
# Environment variables used throughout the container
# ----------------------------------------------------------------------------
# Environment variables provide configuration values that programs can
# read while running (BHB Ch.1 - environment variables).
#
# DEBIAN_FRONTEND=noninteractive:
# prevents package installers from waiting for interactive user input.
#
# LANG and LC_ALL:
# define the language and character encoding used by applications.
# UTF-8 ensures that accented characters and symbols display correctly.
#
# TERM=xterm-256color:
# informs terminal applications that the terminal supports 256 colors.
#
# The backslash character (\) continues the instruction onto the next
# line to improve readability.
#--------------------------------------------------------------------------
# Las variables de entorno son "ajustes globales" que cualquier programa
# del sistema puede leer. Se escriben en MAYÚSCULAS por convención.
#
#   DEBIAN_FRONTEND=noninteractive
#     Le dice al instalador de paquetes (apt) "no me hagas preguntas
#     interactivas, asume respuestas por defecto". Sin esto, algunos
#     paquetes pausarían el build esperando que pulsemos una tecla y se
#     quedaría colgado para siempre (porque no hay nadie mirando).
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configuran idioma y codificación de caracteres. UTF-8 es lo que
#     permite que acentos, ñ, €, emojis, etc. se muestren bien.
#
#   TERM=xterm-256color
#     Le indica a los programas que la terminal admite 256 colores, para
#     que vim, nvim, htop, etc. se vean con todos sus colores.
#
# La barra invertida "\" al final de cada línea significa "esto continúa
# en la línea siguiente". Solo es para legibilidad.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# ----------------------------------------------------------------------------
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
# Wireshark/tshark PREGUNTA durante su instalación si los usuarios
# normales (no-root) deben poder capturar paquetes. Como en el contenedor
# siempre somos root, respondemos "false" POR ADELANTADO usando
# debconf-set-selections para que no detenga el build esperando input.
#-----------------------------------------------------------------------------
#                   DOCUMENTATION
# ----------------------------------------------------------------------------
# Preconfigure Wireshark installation
# ----------------------------------------------------------------------------
# During installation, Wireshark normally asks whether non-root users
# should be allowed to capture network packets.
#
# Automated container builds cannot respond to interactive prompts, so
# the answer is stored in advance using debconf-set-selections.
#
# The pipe operator (|) sends the output of echo directly into another
# command, a concept discussed in Black Hat Bash Chapter 1.
#
# This prevents the build process from stopping while waiting for input.
#----------------------------------------------------------------------------
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# ----------------------------------------------------------------------------
# RUN: ejecutar comandos durante la construcción de la imagen
# ----------------------------------------------------------------------------
# Aquí instalamos TODO el software del curso en un solo RUN.
#
#   apt-get update          -> actualiza la lista de paquetes disponibles
#   apt-get install         -> descarga e instala los paquetes listados
#     -y                    -> responde "sí" automáticamente
#     --no-install-recommends -> instala SOLO lo esencial (no los extras
#                                sugeridos). Ahorra cientos de MB.
#
# ¿Por qué un solo RUN gigante y no 10 RUN pequeños?
# Porque CADA RUN crea una capa nueva en la imagen. Menos capas = imagen
# más pequeña, más rápida de construir y de descargar.
#
# El "&&" encadena comandos: ejecuta el siguiente SOLO SI el anterior
# terminó bien. Si algo falla, el build se detiene con error (que es lo
# que queremos: mejor un error claro que una imagen rota).
#                   DOCUMENTATION
# ----------------------------------------------------------------------------

# Install all course software packages

# ----------------------------------------------------------------------------

# apt-get update downloads the latest package information from the

# configured repositories.

#

# apt-get install downloads and installs the selected packages.

#

# -y automatically accepts installation prompts.

#

# --no-install-recommends installs only required packages and skips

# optional recommended packages to keep the image smaller.

#

# All software is installed in a single RUN instruction because every

# RUN creates a new Docker layer. Fewer layers improve caching efficiency

# and reduce image size (BHB Ch.3).

#

# The && operator executes the next command only if the previous command

# completed successfully, helping prevent incomplete builds (BHB Ch.1).

#

# The backslash character () is used to split long commands across

# multiple lines for readability.
#------------------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    #                   DOCUMENTATION
    # Text-processing tools heavily used in shell scripting (BHB Ch.2).
    # gawk processes structured text and patterns.
    # sed edits text streams automatically.
    # grep searches text using patterns and regular expressions.
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq processes JSON data directly from the command line.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # Provides manual pages used to learn commands and options.
    # Examples include "man bash" and "man grep".
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Bash script analysis tool ===
    # ShellCheck detects common scripting mistakes and bad practices.
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap discovers hosts, services and open ports on networks.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump captures network packets from the command line.
    # tshark provides packet analysis features similar to Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor routes traffic through the Tor anonymity network.
    # torsocks allows commands to use Tor transparently.
    # proxychains4 routes applications through configured proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \
 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.
 #                  DOCUMENTACION
  # --- Enable Spanish locale ---
 # sed modifies text directly inside files without opening an editor.
 # Here it removes the leading "#" from the Spanish locale entry,
 # enabling the locale configuration.
 #
 # locale-gen generates the locale files required by applications.
 # This is an example of automated text processing using sed
 # (BHB Ch.2).
 #-----------------------------------------------------------------------------
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.
 #                  DOCUMENTACION
  # --- Clean package cache ---
 # apt stores temporary files and package indexes during installation.
 #
 # Removing them inside the same RUN instruction keeps the final image
 # smaller because unnecessary files never become part of a previous
 # Docker layer.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
#                   DOCUMENTATION
# ----------------------------------------------------------------------------
# Select Bash as the default shell for future RUN instructions
# ----------------------------------------------------------------------------
# Docker normally executes RUN commands using /bin/sh.
#
# Bash provides additional scripting features such as arrays, improved
# conditionals and more advanced shell functionality (BHB Ch.1).
#
# Future RUN instructions will therefore use Bash instead of sh.
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
#                   DOCUMENTATION
# ----------------------------------------------------------------------------
# Define the default working directory
# ----------------------------------------------------------------------------
# WORKDIR sets the current directory for future RUN instructions and
# interactive terminal sessions.
#
# Codespaces mounts repositories inside /workspaces, so using this
# location places users close to the course files when the container
# starts
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
#                   DOCUMENTATION
# ----------------------------------------------------------------------------
# Configure Git system-wide
# ----------------------------------------------------------------------------
# safe.directory '*':
# allows Git to trust repositories mounted by Codespaces, even when file
# ownership differs from the root user inside the container.
#
# init.defaultBranch main:
# makes "main" the default branch name for newly initialized repositories.
#
# pull.rebase false:
# configures git pull to use merge behavior by default.
#
# git lfs install --system:
# enables Git Large File Storage support for all users in the container.
#--------------------------------------------------------------------------------
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.
# Prompt del curso para bash
RUN cat >> /root/.bashrc <<'EOF'

# ===== Prompt del curso =====
__set_prompt() {
    local ec=$?
    local mark
    if [ $ec -eq 0 ]; then
        mark='\[\e[32m\]✓\[\e[0m\]'
    else
        mark="\[\e[31m\]✗ $ec\[\e[0m\]"
    fi
    PS1="\[\e[36m\][David-Vaca]\[\e[0m\] \[\e[33m\]\W\[\e[0m\] $mark \$ "
}
PROMPT_COMMAND=__set_prompt
EOF
# -------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# -------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su 
# propia terminal integrada de VS Code, pero es buena práctica dejarla 
# definida para que la imagen sea usable también con Docker puro.

# Cambiar shell de login de root a zsh dentro de la imagen,
# para que chsh ya no haga falta y todo sea consistente.
#                   DOCUMENTATION
# ----------------------------------------------------------------------------
# Change the default login shell
# ----------------------------------------------------------------------------
# chsh changes the login shell associated with a user account.
#
# Here the root user is configured to use zsh instead of bash when a
# new interactive session starts.
#
# This keeps the environment consistent because zsh is the shell that
# will be launched by default when the container starts.
RUN chsh -s /usr/bin/zsh root

# Prompt institucional para los y las estudiantes del curso
#                   DOCUMENTATION
# ----------------------------------------------------------------------------
# Configure the Zsh prompt using a here-document
# ----------------------------------------------------------------------------
# A here-document (<<EOF) allows multiple lines of text to be passed
# directly to another command without creating a temporary file.
#
# The cat command appends the enclosed configuration to /root/.zshrc.
#
# The .zshrc file is loaded automatically whenever an interactive zsh
# session starts.
RUN cat >> /root/.zshrc <<'EOF'

# ===== Valida si un comando fue ejecutado correctamente =====
#                   DOCUMENTATION
# ===== Custom course prompt =====
# The PROMPT variable defines how the command prompt appears.
#
# It displays:
# - the student's name in cyan
# - the current directory in yellow
# - a green check mark when the previous command succeeded
# - a red error code when the previous command failed
#
# This provides immediate visual feedback about command execution
PROMPT='%F{cyan}[David-Vaca]%f %F{yellow}%1~%f %(?.%F{green}✔.%F{red}✘ %?)%f %# '
EOF

CMD ["/usr/bin/zsh"]