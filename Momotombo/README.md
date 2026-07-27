## Instalación desde una terminal Linux

### 1. Instalar dependencias básicas

```bash
sudo apt-get update && sudo apt-get install -y wget curl p7zip-full 7zip git
```

### 2. Instalar Miniconda

```bash
curl -LO "http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh" && \
bash Miniconda3-latest-Linux-x86_64.sh -p /opt/miniconda -b && \
rm Miniconda3-latest-Linux-x86_64.sh
```

### 3. Crear el entorno Conda

```bash
conda update -c conda-forge -y conda && \
conda create -n insarenv -c conda-forge python=3.12 pip mamba
```

### 4. Activar el entorno

```bash
mamba init && \
mamba activate insarenv
```

### 5. Instalar JupyterLab

```bash
mamba install -c conda-forge jupyterlab -y
```

### 6. Instalar LiCSBAS

```bash
cd /opt && \
git clone https://github.com/comet-licsar/LiCSBAS && \
mamba install -c conda-forge -y --file LiCSBAS/LiCSBAS_requirements.txt && \
echo "export PATH=\$PATH:/opt/LiCSBAS/bin" >> ~/.bashrc && \
echo "export PYTHONPATH=\$PYTHONPATH:/opt/LiCSBAS/LiCSBAS_lib" >> ~/.bashrc
```

### 7. Instalar `licsar_extra` (reunwrapper)

```bash
pip install git+https://github.com/comet-licsar/licsar_extra.git
```

### 8. Instalar SNAPHU

```bash
sudo apt-get update && \
sudo apt-get install -y build-essential && \
wget https://web.stanford.edu/group/radar/softwareandlinks/sw/snaphu/snaphu-v2.0.5.tar.gz && \
tar -xzf snaphu-v2.0.5.tar.gz && \
rm snaphu-v2.0.5.tar.gz && \
cd snaphu-v2.0.5/src && \
make -f Makefile && \
mkdir -p /usr/local/man/man1 && \
sudo make install && \
cd
```

### 9. Configurar el entorno

```bash
source ~/.bashrc
```

### 10. Descargar los archivos auxiliares de LiCSBAS

```bash
./LiCSBAS/postBuild
```

Este paso descargará y extraerá los recursos adicionales requeridos por LiCSBAS.

### 11. Descargar los materiales del taller

Clonar el repositorio del taller DEEPVOLC y descargar el cuaderno original de LiCSBAS para referencia:

```bash
git clone https://github.com/alejobeap/DEEPVOLC_Workshop.git

wget https://raw.githubusercontent.com/comet-licsar/LiCSBAS/main/licsbas_tutorial.ipynb
```

### 12. Abrir el cuaderno del taller en JupyterLab

Entrar en el directorio del repositorio y abrir el cuaderno principal:

```bash
cd DEEPVOLC_Workshop

jupyter lab --browser=default LiCSBAS_training.ipynb >/dev/null 2>/dev/null &
```

> **Nota:** `LiCSBAS_training.ipynb` es el cuaderno utilizado en este taller y se descarga automáticamente al clonar el repositorio **DEEPVOLC_Workshop**. El archivo `licsbas_tutorial.ipynb` corresponde al tutorial oficial de LiCSBAS y se incluye únicamente como material de referencia adicional.

---

### Referencias

Este taller está basado en el tutorial oficial de LiCSBAS:

- [Repositorio de LiCSBAS](https://github.com/comet-licsar/LiCSBAS)
- [Tutorial oficial de LiCSBAS](https://github.com/comet-licsar/LiCSBAS/blob/main/licsbas_tutorial.ipynb)
- [Repositorio DEEPVOLC Workshop](https://github.com/alejobeap/DEEPVOLC_Workshop)

