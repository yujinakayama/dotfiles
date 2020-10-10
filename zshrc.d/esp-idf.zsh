if [[ -d "$HOME/.esp-idf/versions/3.2" ]]; then
  function esp_idf_3.2() {
    path=("$HOME/.esp-idf/versions/3.2/xtensa-esp32-elf/bin" $path)
    export IDF_PATH="$HOME/.esp-idf/versions/3.2/esp-idf"
  }
fi
