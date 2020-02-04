#!/usr/bin/env bash
echo VS Code Backup Tool
echo Backing up list of extensions
code --list-extensions >> ./vs_code/vs_code_extensions_list;
echo Backing up settings.json
cp ~/Library/ApplicationSupport/Code/User/settings.json ./vs_code/settings.json;