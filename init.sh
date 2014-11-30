#!/bin/bash

echo "=====>> NeoBundle Setup"
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

echo "=====>> Molokai Setup"
MOLOKAI_URL=http://github.com/tomasr/molokai.git
$(cd .vim/colors; git clone $MOLOKAI_URL)
