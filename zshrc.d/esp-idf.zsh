# https://docs.espressif.com/projects/esp-idf/en/latest/get-started/index.html
# https://docs.espressif.com/projects/esp-idf/en/latest/get-started/macos-setup.html
if [[ -d "$HOME/.esp/esp-idf/versions" ]]; then
  export IDF_PATH="$HOME/.esp/esp-idf/versions/3.3.4"
fi

if [[ -d "$HOME/.espressif" ]]; then
  path=("$HOME/.espressif/tools/xtensa-esp32-elf" $path)
fi
