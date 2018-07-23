# Oracle Commerce (ATG) Docker images

Provides docker image configurations to build an ATG installation image.

Requires you to download the necessary Oracle Commerce files from Oracle Edelivery, accept the license agreements and unzip into the relevant directory.

- Creates the 'atg' user
- Installs ATG into /opt

- jdk8: Builds the initial JDK8 latest version image (+- 499MB)
- oracle-commerce-core: From JDK8 build the ATG core image (+- 2.28GB)
- oracle-commerce-csc: From core build the ATG CSC image (+- 3.27GB)
- oracle-commerce-crs: From csc build the ATG CRS image (+- 4.52GB)
