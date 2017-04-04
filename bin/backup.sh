# !/bin/sh

# Load the configuration file if exist
KMANGA_CONF=$(dirname $0)/kmanga.conf
if [ ! -f "$KMANGA_CONF" ]; then
    echo "Please, create a $KMANGA_CONF configuration file."
    exit 1
fi
source $KMANGA_CONF

# Database backup
BACKUP=$BACKUP_PATH/kmanga-$(date "+%Y-%m-%d-%T").sql.gz
pg_dump kmanga | gzip > $BACKUP
