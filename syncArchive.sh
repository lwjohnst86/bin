## Created 2015-05-12
## Luke W. Johnston

## This syncs my archive files with my external hard drive.

ARCHIVE_LOCAL=/home/luke/archive/archive/
BACKUPS_LOCAL=/home/luke/archive/backups/
ARCHIVE_EXTERNAL="/media/luke/FreeAgent GoFlex Drive/archive/"
BACKUPS_EXTERNAL="/media/luke/FreeAgent GoFlex Drive/backup/home/"

rsync -avu $ARCHIVE_LOCAL "$ARCHIVE_EXTERNAL"
rsync -avu $BACKUPS_LOCAL "$BACKUPS_EXTERNAL"

