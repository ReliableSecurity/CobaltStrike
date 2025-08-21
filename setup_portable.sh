#!/bin/bash

# AKUMA's Advanced CrossC2 Portable Setup
# Делаем проект полностью портабельным, как USB с хакерскими тулзами! 🚀

echo "🚀 AKUMA's Advanced CrossC2 Portable Setup v2.0 🚀"
echo "Превращаем твой проект в портабельного зверя!"
echo ""

# Получаем абсолютный путь к директории скрипта
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "📂 Директория проекта: $SCRIPT_DIR"

# Функция для обновления путей
update_paths() {
    local target_dir="$1"
    echo "🔄 Обновляем пути для директории: $target_dir"
    
    # Основной файл CrossC2
    local main_file="$target_dir/CrossC2-GithubBot-2023-11-20.cna"
    if [[ -f "$main_file" ]]; then
        echo "🔧 Обновляем $main_file"
        
        # Создаем backup с timestamp
        cp "$main_file" "$main_file.backup.$(date +%Y%m%d_%H%M%S)"
        
        # Используем более точные регулярки для замены
        sed -i "s|\\$CC2_PATH = \"[^\"]*genCrossC2\.Linux\"|\$CC2_PATH = \"$target_dir/genCrossC2.Linux\"|g" "$main_file"
        sed -i "s|\\$CC2_BIN = \"[^\"]*genCrossC2\.MacOS\"|\$CC2_BIN = \"$target_dir/genCrossC2.MacOS\"|g" "$main_file"
        
        echo "   ✅ CC2_PATH -> $target_dir/genCrossC2.Linux"
        echo "   ✅ CC2_BIN  -> $target_dir/genCrossC2.MacOS"
    else
        echo "   ⚠️  Не найден файл: $main_file"
    fi
    
    # Обновляем CrossC2Kit файлы
    local kit_dir="$target_dir/CrossC2Kit-GithubBot-2023-11-20/CrossC2Kit"
    if [[ -d "$kit_dir" ]]; then
        echo "🔧 Обновляем CrossC2Kit файлы..."
        
        for file in "$kit_dir/CrossC2Kit.cna" "$kit_dir/CrossC2Kit_Loader.cna"; do
            if [[ -f "$file" ]]; then
                cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
                # Заменяем любые старые пути на новые
                sed -i "s|/home/[^/]*/[^/]*/CobaltStrike|$target_dir|g" "$file"
                sed -i "s|/home/akuma/Desktop/CobaltStrike|$target_dir|g" "$file"
                sed -i "s|/home/akuma/Documents/CobaltStrike|$target_dir|g" "$file"
                echo "   ✅ Обновлен: $(basename "$file")"
            fi
        done
    fi
}

# Проверяем наличие необходимых файлов
check_files() {
    local missing_files=()
    
    if [[ ! -f "$SCRIPT_DIR/CrossC2-GithubBot-2023-11-20.cna" ]]; then
        missing_files+=("CrossC2-GithubBot-2023-11-20.cna")
    fi
    
    if [[ ! -f "$SCRIPT_DIR/genCrossC2.Linux" ]]; then
        missing_files+=("genCrossC2.Linux")
    fi
    
    if [[ ! -f "$SCRIPT_DIR/genCrossC2.MacOS" ]]; then
        missing_files+=("genCrossC2.MacOS")
    fi
    
    if [[ ${#missing_files[@]} -gt 0 ]]; then
        echo "❌ Отсутствуют критические файлы:"
        for file in "${missing_files[@]}"; do
            echo "   - $file"
        done
        echo ""
        echo "Убедись, что запускаешь скрипт из корня проекта CobaltStrike!"
        return 1
    fi
    
    return 0
}

# Создаем файл с текущим путем для отслеживания
create_path_marker() {
    echo "$SCRIPT_DIR" > "$SCRIPT_DIR/.current_path"
    echo "📍 Создан маркер пути: $SCRIPT_DIR/.current_path"
}

# Основная логика
main() {
    echo "🔍 Проверяем структуру проекта..."
    
    if ! check_files; then
        exit 1
    fi
    
    echo "✅ Все файлы на месте!"
    echo ""
    
    # Проверяем, менялся ли путь
    local path_marker="$SCRIPT_DIR/.current_path"
    local need_update=false
    
    if [[ -f "$path_marker" ]]; then
        local old_path=$(cat "$path_marker")
        if [[ "$old_path" != "$SCRIPT_DIR" ]]; then
            echo "🚨 Обнаружено изменение пути!"
            echo "   Старый: $old_path"
            echo "   Новый:  $SCRIPT_DIR"
            need_update=true
        else
            echo "ℹ️  Путь не изменился, но обновим на всякий случай..."
            need_update=true
        fi
    else
        echo "🆕 Первый запуск, настраиваем проект..."
        need_update=true
    fi
    
    if [[ "$need_update" == true ]]; then
        update_paths "$SCRIPT_DIR"
        create_path_marker
        echo ""
        echo "🎉 Проект успешно настроен для работы из: $SCRIPT_DIR"
        echo ""
        echo "📋 Обновленные переменные:"
        echo "   \$CC2_PATH = \"$SCRIPT_DIR/genCrossC2.Linux\""
        echo "   \$CC2_BIN = \"$SCRIPT_DIR/genCrossC2.MacOS\""
    else
        echo "✨ Проект уже настроен правильно!"
    fi
    
    echo ""
    echo "💡 Pro tip: Запускай этот скрипт каждый раз после переноса проекта"
    echo "🤘 Как говорил мой тимлид: 'Portable код — это как хороший backdoor: работает везде и незаметно!'"
}

# Запускаем основную функцию
main "$@"
