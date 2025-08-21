#!/bin/bash

# AKUMA's Screenshot Manager
# Удобное добавление скриншотов в репозиторий 📸

echo "📸 AKUMA's Screenshot Manager v1.0 📸"
echo "Добавляем скриншоты в репозиторий для документации!"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCREENSHOTS_DIR="$SCRIPT_DIR/screenshots"

# Создаем папку screenshots если её нет
if [[ ! -d "$SCREENSHOTS_DIR" ]]; then
    echo "📁 Создаем папку screenshots..."
    mkdir -p "$SCREENSHOTS_DIR"
fi

echo "📂 Папка скриншотов: $SCREENSHOTS_DIR"
echo ""

# Функция для копирования скриншота
copy_screenshot() {
    local source_file="$1"
    local target_name="$2"
    local description="$3"
    
    if [[ -f "$source_file" ]]; then
        echo "✅ Копируем: $source_file -> $target_name"
        cp "$source_file" "$SCREENSHOTS_DIR/$target_name"
        echo "   📝 $description"
    else
        echo "❌ Файл не найден: $source_file"
        echo "   💡 Создай скриншот и укажи правильный путь"
    fi
    echo ""
}

echo "🎯 Рекомендуемые скриншоты для добавления:"
echo ""

echo "📋 Инструкция по использованию:"
echo "1. Сделай нужные скриншоты интерфейса CobaltStrike"
echo "2. Сохрани их в удобном месте (например, ~/Desktop/)"
echo "3. Запусти этот скрипт и укажи пути к файлам"
echo ""

# Интерактивное добавление скриншотов
echo "🔍 Хочешь добавить скриншоты интерактивно? (y/n)"
read -r add_interactive

if [[ "$add_interactive" == "y" || "$add_interactive" == "Y" ]]; then
    echo ""
    echo "📸 Добавляем скриншоты интерактивно..."
    echo ""
    
    # Скриншот 1: Успешное подключение
    echo "1️⃣  Скриншот успешного подключения:"
    echo "   📝 Показывает: подключение к TeamServer, активный beacon"
    echo "   🎯 Целевое имя: 01_successful_connection.png"
    echo "   💡 Введи путь к файлу (или 'skip' для пропуска):"
    read -r screenshot1_path
    
    if [[ "$screenshot1_path" != "skip" && -n "$screenshot1_path" ]]; then
        copy_screenshot "$screenshot1_path" "01_successful_connection.png" "Successful TeamServer connection with active beacon"
    fi
    
    # Скриншот 2: Загруженные скрипты
    echo "2️⃣  Скриншот загруженных CrossC2 скриптов:"
    echo "   📝 Показывает: логи загрузки в Event Log"
    echo "   🎯 Целевое имя: 02_crossc2_loaded.png"
    echo "   💡 Введи путь к файлу (или 'skip' для пропуска):"
    read -r screenshot2_path
    
    if [[ "$screenshot2_path" != "skip" && -n "$screenshot2_path" ]]; then
        copy_screenshot "$screenshot2_path" "02_crossc2_loaded.png" "CrossC2 scripts successfully loaded and initialized"
    fi
    
    # Скриншот 3: Создание listener'а
    echo "3️⃣  Скриншот создания CrossC2 listener'а:"
    echo "   📝 Показывает: интерфейс создания listener'а"
    echo "   🎯 Целевое имя: 03_crossc2_listener.png"
    echo "   💡 Введи путь к файлу (или 'skip' для пропуска):"
    read -r screenshot3_path
    
    if [[ "$screenshot3_path" != "skip" && -n "$screenshot3_path" ]]; then
        copy_screenshot "$screenshot3_path" "03_crossc2_listener.png" "Creating CrossC2 listener for Linux/macOS beacons"
    fi
    
    # Скриншот 4: Меню CrossC2
    echo "4️⃣  Скриншот меню CrossC2:"
    echo "   📝 Показывает: доступное меню CrossC2 в интерфейсе"
    echo "   🎯 Целевое имя: 04_crossc2_menu.png"
    echo "   💡 Введи путь к файлу (или 'skip' для пропуска):"
    read -r screenshot4_path
    
    if [[ "$screenshot4_path" != "skip" && -n "$screenshot4_path" ]]; then
        copy_screenshot "$screenshot4_path" "04_crossc2_menu.png" "CrossC2 menu available in interface - confirming successful setup"
    fi
fi

echo ""
echo "📋 Проверяем что у нас есть:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

screenshots_count=0
if [[ -f "$SCREENSHOTS_DIR/01_successful_connection.png" ]]; then
    echo "✅ 01_successful_connection.png"
    ((screenshots_count++))
else
    echo "❌ 01_successful_connection.png - missing"
fi

if [[ -f "$SCREENSHOTS_DIR/02_crossc2_loaded.png" ]]; then
    echo "✅ 02_crossc2_loaded.png"
    ((screenshots_count++))
else
    echo "❌ 02_crossc2_loaded.png - missing"
fi

if [[ -f "$SCREENSHOTS_DIR/03_crossc2_listener.png" ]]; then
    echo "✅ 03_crossc2_listener.png"
    ((screenshots_count++))
else
    echo "❌ 03_crossc2_listener.png - missing"
fi

if [[ -f "$SCREENSHOTS_DIR/04_crossc2_menu.png" ]]; then
    echo "✅ 04_crossc2_menu.png"
    ((screenshots_count++))
else
    echo "❌ 04_crossc2_menu.png - missing"
fi

echo ""
echo "📊 Статистика: $screenshots_count/4 скриншотов добавлено"

if [[ $screenshots_count -gt 0 ]]; then
    echo ""
    echo "🚀 Хочешь закоммитить и запушить скриншоты в репозиторий? (y/n)"
    read -r push_to_repo
    
    if [[ "$push_to_repo" == "y" || "$push_to_repo" == "Y" ]]; then
        echo ""
        echo "📤 Добавляем в git и пушим..."
        
        git add screenshots/
        git commit -m "📸 Added deployment screenshots

- Added $screenshots_count screenshot(s) showing successful setup
- Visual confirmation of CrossC2 functionality  
- Documentation enhancement with proof of concept

Ready for deployment! 🔥"
        
        git push
        
        echo ""
        echo "🎉 Скриншоты успешно добавлены в репозиторий!"
        echo "🔗 Проверь: https://github.com/sweetpotatohack/AKUMA_CobaltStrike"
    fi
fi

echo ""
echo "💡 Tips:"
echo "   - Делай скриншоты в хорошем качестве"
echo "   - Убедись что в них нет чувствительной информации"
echo "   - Скриншоты помогают другим понять что проект работает"
echo ""
echo "🤘 Как говорил мой дед: 'Картинка стоит тысячи строк документации!'"
