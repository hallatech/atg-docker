# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# (1) OCReferenceStore11.3_222RCN.bin
#     Download OC CRS 11.3 installer from Oracle Edelivery, and unzip to obtain the bin file
#
# NOTES
# -----
# As there are no application server installations in the base image a generic serverless installation is done.
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put the downloaded files in the same directory as this Dockerfile or in the SDE cache
# Run:
#      $ docker build -t hallatech/oc-crs:11.3 .
#

# Pull base image
# ---------------
FROM hallatech/oc-csc:11.3

# Maintainer
# ----------
MAINTAINER hallatech <admin@hallatech.net>

# Environment variables required for this build
# ---------------------------------------------
ENV CRS_BIN=OCReferenceStore11.3.bin \
    ATG_JDK_HOME=/usr/java/default \
    TEMP_DIR=/var/tmp \
    ATG_INSTALL_DIR=/opt \
    ATG_HOME=/opt/ATG/ATG11.3 \
    SILENT_FILE_NAME=install.properties 

# Copy packages and files
# -----------------------
COPY $CRS_BIN $SILENT_FILE_NAME $TEMP_DIR/

# Install and configure Oracle Commerce Reference Store as root from tmp dir
# Adjust file permissions and clean up
# ------------------------------------------------------------
USER root

RUN cd $TEMP_DIR && \
    chmod u+x $TEMP_DIR/$CRS_BIN && \
    ./$CRS_BIN -f $TEMP_DIR/$SILENT_FILE_NAME -i silent && \
    chown -R atg:atg /opt/ATG && \
    rm $TEMP_DIR/$CRS_BIN $TEMP_DIR/$SILENT_FILE_NAME

WORKDIR /home/atg
USER atg

# Define default command to start bash.
CMD ["bash"]
