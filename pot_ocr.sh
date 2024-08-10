#!/bin/bash

rm -f ~/.cache/com.pot-app.desktop/pot_screenshot_cut.png && spectacle -nrbo  ~/.cache/com.pot-app.desktop/pot_screenshot_cut.png && curl "127.0.0.1:60828/ocr_recognize?screenshot=false"
