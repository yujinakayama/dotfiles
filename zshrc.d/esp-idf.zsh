if [[ -d "$HOME/.esp-idf/versions/3.2" ]]; then
  function esp_idf_3.2() {
    path=("$HOME/.esp-idf/versions/3.2/xtensa-esp32-elf/bin" $path)
    export IDF_PATH="$HOME/.esp-idf/versions/3.2/esp-idf"
  }
fi

if [[ -d "$HOME/.esp-idf/versions/master" ]]; then
  function esp_idf_master() {
    export IDF_TOOLS_PATH="$HOME/.esp-idf/versions/master/tools"
    . "$HOME/.esp-idf/versions/master/esp-idf/export.sh"
  }
fi
