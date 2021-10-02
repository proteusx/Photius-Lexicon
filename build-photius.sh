#!/bin/bash

TLG_CDROM=/usr/local/proteus/CDROMS/tlg/
TLG2U_PROG=/usr/local/bin/tlg2u

PHO_TLG_ID="-a 4040"

PARAMS="-d $TLG_CDROM -c tlg -B 0 -T 89 -M 0 $PHO_TLG_ID"

# Photius comes in two volumes and each volume has a different format
# and each formati must be processed differently.

# Volume I
  $TLG2U_PROG $PARAMS -P -b 029 > ph-29.utf
 sed -i 's/\ *$//' ph-29.utf               # Remove trailling spaces
 patch ph-29.utf ph-29.patch &> /dev/null  # Patch manual edits
 ./phot-29.pl ph-29.utf > vol_I.utf        # Make dictionary volume I

# Volume II
  $TLG2U_PROG $PARAMS -b 030 > ph-30.utf
  sed -i 's/\ *$//' ph-30.utf               # Remove trailling spaces
  patch ph-30.utf ph-30.patch &> /dev/null  # Patch manual edits
  ./phot-30.pl ph-30.utf > vol_II.utf       # Make dictionary volume I

# Combine the volumes
cat  vol_I.utf vol_II.utf > dict.utf

# The header includes the UTF-8 BOM
# Without the BOM GoldenDict will not see the dictionary
cat ./phot-header ./dict.utf > ./dictionary/photius.dsl

rm  ./*.utf            # Clean-up
