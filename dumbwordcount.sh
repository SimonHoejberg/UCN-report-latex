#!/bin/bash
PRG=$(echo "scale=2; $(pdftotext -q -f 6 main.pdf - | wc -m) / 2400" | bc -lq);
echo "Prog normalsider:  $PRG"

