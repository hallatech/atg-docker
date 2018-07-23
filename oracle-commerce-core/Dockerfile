# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# (1) OCPlatform11_3.bin
#     Download OC 11.3 installer from Oracle Edelivery, and unzip in this directory to obtain the bin file
#
# NOTES
# -----
# As there are no application server installations in the base image a generic serverless installation is done.
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put the downloaded files in the same directory as this Dockerfile
# Run:
#      $ docker build -t hallatech/oc-core:11.3 .
#

# Pull base image
# ---------------
FROM hallatech/jdk8

# Maintainer
# ----------
MAINTAINER hallatech <admin@hallatech.net>

# Environment variables required for this build
# ---------------------------------------------
ENV ATG_BIN=OCPlatform11.3.bin \
    ATG_JDK_HOME=/usr/java/default \
    TEMP_DIR=/var/tmp \
    ATG_INSTALL_DIR=/opt \
    ATG_HOME=/opt/ATG/ATG11.3 \
    ATGJRE=/usr/java/default/bin/java \
    DYNAMO_HOME=/opt/ATG/ATG11.3/home \
    SILENT_FILE_NAME=install.serverless.properties \
    PATH=$PATH:/usr/java/default/bin:/opt/ATG/ATG11.3/home/bin

# Copy packages and files
# -----------------------
COPY $ATG_BIN $SILENT_FILE_NAME /var/tmp/

# Setup required packages, filesystem, and oracle user.
# Install and configure Oracle Core Commerce
# Adjust file permissions, go to temp dir as user 'atg' to proceed with OC installation
# ------------------------------------------------------------
RUN useradd -m -s /bin/bash atg && \
    echo atg:atg | chpasswd && \
    chmod 755 $TEMP_DIR/$ATG_BIN && \
    cd $TEMP_DIR && \
    ./$ATG_BIN -f $TEMP_DIR/$SILENT_FILE_NAME -i silent && \
    chown -R atg:atg /opt/ATG && \
    rm $TEMP_DIR/$ATG_BIN $TEMP_DIR/$SILENT_FILE_NAME

WORKDIR /home/atg
USER atg

# Define default command to start bash.
CMD ["bash"]