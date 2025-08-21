#!/bin/bash

# AKUMA's CrossC2 Path Fixer
# Потому что хардкод — это зло, а мы — добро! (ну или почти добро) 😈

echo "🔥 AKUMA's CrossC2 Path Fixer v1.0 🔥"
echo "Исправляем хардкоженные пути быстрее, чем админ меняет пароли!"
echo ""

# Получаем текущую директорию проекта
PROJECT_DIR=$(pwd)
echo "📍 Текущая директория проекта: $PROJECT_DIR"

# Проверяем, что мы в правильной директории
if [[ ! -f "CrossC2-GithubBot-2023-11-20.cna" ]]; then
    echo "❌ Ошибка: Не найден файл CrossC2-GithubBot-2023-11-20.cna"
    echo "   Запускай скрипт из корня проекта CobaltStrike!"
    exit 1
fi

# Backup оригинального файла (мало ли, вдруг что-то пойдет не так)
BACKUP_FILE="CrossC2-GithubBot-2023-11-20.cna.backup.$(date +%Y%m%d_%H%M%S)"
echo "💾 Создаем backup: $BACKUP_FILE"
cp "CrossC2-GithubBot-2023-11-20.cna" "$BACKUP_FILE"

# Исправляем пути в основном файле
echo "🔧 Патчим CrossC2-GithubBot-2023-11-20.cna..."

# Заменяем CC2_PATH
sed -i "s|\$CC2_PATH = \".*genCrossC2\.Linux\"|\$CC2_PATH = \"$PROJECT_DIR/genCrossC2.Linux\"|g" CrossC2-GithubBot-2023-11-20.cna

# Заменяем CC2_BIN  
sed -i "s|\$CC2_BIN = \".*genCrossC2\.MacOS\"|\$CC2_BIN = \"$PROJECT_DIR/genCrossC2.MacOS\"|g" CrossC2-GithubBot-2023-11-20.cna

echo "✅ Основной файл обновлен!"

# Проверяем наличие CrossC2Kit файлов и тоже их патчим (на всякий случай)
CROSSC2KIT_DIR="CrossC2Kit-GithubBot-2023-11-20/CrossC2Kit"

if [[ -d "$CROSSC2KIT_DIR" ]]; then
    echo "🔧 Найден CrossC2Kit, патчим и его..."
    
    # Патчим CrossC2Kit.cna если там тоже есть хардкоженные пути
    if [[ -f "$CROSSC2KIT_DIR/CrossC2Kit.cna" ]]; then
        cp "$CROSSC2KIT_DIR/CrossC2Kit.cna" "$CROSSC2KIT_DIR/CrossC2Kit.cna.backup.$(date +%Y%m%d_%H%M%S)"
        # Ищем и заменяем любые хардкоженные пути к нашему проекту
        sed -i "s|/home/akuma/Desktop/CobaltStrike|$PROJECT_DIR|g" "$CROSSC2KIT_DIR/CrossC2Kit.cna"
    fi
    
    # Патчим Loader если нужно
    if [[ -f "$CROSSC2KIT_DIR/CrossC2Kit_Loader.cna" ]]; then
        cp "$CROSSC2KIT_DIR/CrossC2Kit_Loader.cna" "$CROSSC2KIT_DIR/CrossC2Kit_Loader.cna.backup.$(date +%Y%m%d_%H%M%S)"
        sed -i "s|/home/akuma/Desktop/CobaltStrike|$PROJECT_DIR|g" "$CROSSC2KIT_DIR/CrossC2Kit_Loader.cna"
    fi
    
    echo "✅ CrossC2Kit тоже обновлен!"
fi

echo ""
echo "🎉 Готово! Все пути обновлены для директории: $PROJECT_DIR"
echo "📋 Результат:"
echo "   \$CC2_PATH = \"$PROJECT_DIR/genCrossC2.Linux\""
echo "   \$CC2_BIN = \"$PROJECT_DIR/genCrossC2.MacOS\""
echo ""
echo "💡 Tip: Теперь можешь спокойно таскать проект куда угодно!"
echo "    Просто запускай этот скрипт после переноса."
echo ""
echo "🤘 Как говорил мой дед: 'Хардкод — это как татуировка с именем бывшей: казалось хорошей идеей, а потом только головная боль!'"
