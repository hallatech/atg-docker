# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# (1) OCServiceCenter11.3.bin
#     Download OC CSC 11.3 installer from Oracle Edelivery, and unzip to obtain the bin file
#
# NOTES
# -----
# As there are no application server installations in the base image a generic serverless installation is done.
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put the downloaded files in the same directory as this Dockerfile or in the SDE cache
# Run:
#      $ docker build -t hallatech/oc-csc:11.3 .
#

# Pull base image
# ---------------
FROM hallatech/oc-core:11.3

# Maintainer
# ----------
MAINTAINER hallatech <admin@hallatech.net>

# Environment variables required for this build
# ---------------------------------------------
ENV CSC_BIN=OCServiceCenter11.3.bin \
    ATG_JDK_HOME=/usr/java/default \
    TEMP_DIR=/var/tmp \
    ATG_INSTALL_DIR=/opt \
    ATG_HOME=/opt/ATG/ATG11.3 \
    SILENT_FILE_NAME=install.properties 

# Copy packages and files
# -----------------------
COPY $CSC_BIN $SILENT_FILE_NAME $TEMP_DIR/

# Setup required packages, filesystem, and oracle user.
# Install and configure Oracle Core Commerce
# Adjust file permissions, go to temp dir as user 'atg' to proceed with OC installation
# ------------------------------------------------------------
USER root

#RUN whoami
#RUN ls -la $TEMP_DIR

RUN cd $TEMP_DIR && \
    chmod u+x $TEMP_DIR/$CSC_BIN && \
    ./$CSC_BIN -f $TEMP_DIR/$SILENT_FILE_NAME -i silent && \
    chown -R atg:atg /opt/ATG && \
    rm $TEMP_DIR/$CSC_BIN $TEMP_DIR/$SILENT_FILE_NAME

#RUN ls -la $ATG_HOME | grep CSC
#RUN ls -la $TEMP_DIR

WORKDIR /home/atg
USER atg

# Define default command to start bash.
CMD ["bash"]
