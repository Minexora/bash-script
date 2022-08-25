#!/usr/bin/env bash

echo "Hello, World!" | (read var1 var2 var3; echo -e "Var1: $var1 \nVar2: $var2 \nVar3: $var3")
