#!/bin/bash
#’
#‘
sed -i 's/’/`/g' $(ag ’ -l | grep -v fix-quotes.sh)
sed -i "s/‘/'/g" $(ag ‘ -l | grep -v fix-quotes.sh)

# ”
# “
sed -i "s/”/''/g" $(ag ” -l | grep -v fix-quotes.sh)
sed -i 's/“/``/g' $(ag “ -l | grep -v fix-quotes.sh)
