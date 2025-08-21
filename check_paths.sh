#!/bin/bash

# AKUMA's Quick Path Checker
# Быстро проверяем, какие пути сейчас прописаны в конфигах

echo "🔍 AKUMA's Path Checker - Смотрим что там у нас с путями 🔍"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "📂 Текущая директория проекта: $SCRIPT_DIR"
echo ""

# Проверяем основной файл
MAIN_FILE="$SCRIPT_DIR/CrossC2-GithubBot-2023-11-20.cna"
if [[ -f "$MAIN_FILE" ]]; then
    echo "📄 Анализируем: CrossC2-GithubBot-2023-11-20.cna"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Извлекаем текущие пути
    CC2_PATH_LINE=$(grep '^$CC2_PATH' "$MAIN_FILE" 2>/dev/null)
    CC2_BIN_LINE=$(grep '^$CC2_BIN' "$MAIN_FILE" 2>/dev/null)
    
    if [[ -n "$CC2_PATH_LINE" ]]; then
        echo "🐧 Linux PATH:  $CC2_PATH_LINE"
    else
        echo "❌ CC2_PATH не найден!"
    fi
    
    if [[ -n "$CC2_BIN_LINE" ]]; then
        echo "🍎 MacOS PATH:  $CC2_BIN_LINE"
    else
        echo "❌ CC2_BIN не найден!"
    fi
    
    echo ""
    
    # Проверяем, существуют ли файлы по указанным путям
    if [[ -n "$CC2_PATH_LINE" ]]; then
        PATH_VALUE=$(echo "$CC2_PATH_LINE" | sed 's/.*"\(.*\)".*/\1/')
        if [[ -f "$PATH_VALUE" ]]; then
            echo "✅ genCrossC2.Linux найден: $PATH_VALUE"
        else
            echo "❌ genCrossC2.Linux НЕ найден: $PATH_VALUE"
        fi
    fi
    
    if [[ -n "$CC2_BIN_LINE" ]]; then
        BIN_VALUE=$(echo "$CC2_BIN_LINE" | sed 's/.*"\(.*\)".*/\1/')
        if [[ -f "$BIN_VALUE" ]]; then
            echo "✅ genCrossC2.MacOS найден: $BIN_VALUE"
        else
            echo "❌ genCrossC2.MacOS НЕ найден: $BIN_VALUE"
        fi
    fi
    
else
    echo "❌ Файл CrossC2-GithubBot-2023-11-20.cna не найден!"
fi

echo ""

# Проверяем маркер пути
PATH_MARKER="$SCRIPT_DIR/.current_path"
if [[ -f "$PATH_MARKER" ]]; then
    SAVED_PATH=$(cat "$PATH_MARKER")
    echo "📍 Сохраненный путь: $SAVED_PATH"
    if [[ "$SAVED_PATH" == "$SCRIPT_DIR" ]]; then
        echo "✅ Пути синхронизированы!"
    else
        echo "⚠️  Пути НЕ синхронизированы! Запусти setup_portable.sh"
    fi
else
    echo "📍 Маркер пути не найден (первый запуск?)"
fi

# Проверяем CNA скрипты и C2 IP
if [[ -d "$SCRIPT_DIR/cna-scripts" ]]; then
    echo "🌐 Проверяем C2 IP в CNA скриптах:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    for cna_file in "$SCRIPT_DIR/cna-scripts/"*.cna; do
        if [[ -f "$cna_file" ]]; then
            filename=$(basename "$cna_file")
            
            # Ищем строчку с c2_server
            c2_server_line=$(grep -E '%[a-z_]*config\["c2_server"\]' "$cna_file" | head -1)
            
            if [[ -n "$c2_server_line" ]]; then
                # Извлекаем IP адрес
                current_ip=$(echo "$c2_server_line" | sed 's/.*"\([^"]*\)".*/\1/')
                echo "📝 $filename: C2 IP = $current_ip"
            else
                echo "⚠️  $filename: C2 IP не найден"
            fi
        fi
    done
else
    echo "📝 CNA скрипты не найдены"
fi

echo ""
echo "🎯 Рекомендации:"
if [[ ! -f "$PATH_MARKER" ]] || [[ "$(cat "$PATH_MARKER" 2>/dev/null)" != "$SCRIPT_DIR" ]]; then
    echo "   🔧 Запусти: ./setup_portable.sh"
fi
echo "   📱 Для обновления: ./fix_paths.sh"
if [[ -d "$SCRIPT_DIR/cna-scripts" ]]; then
    echo "   🌐 C2 IP автоматически обновляется при запуске setup_portable.sh"
fi
echo ""
echo "🤘 Как говорил мой дед: 'Лучше проверить дважды, чем дебажить всю ночь!'"
