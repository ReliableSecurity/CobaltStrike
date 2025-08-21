#!/bin/bash

# AKUMA's CrossC2 Path Fixer
# Потому что хардкод — это зло, а мы — добро! (ну или почти добро) 😈

# Функция для определения текущего IP
get_current_ip() {
    local ip=""
    
    # Пробуем разные способы получения IP
    # 1. Внешний IP (если есть интернет)
    ip=$(curl -s --connect-timeout 5 ifconfig.me 2>/dev/null)
    if [[ -n "$ip" && "$ip" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo "$ip"
        return
    fi
    
    # 2. Основной сетевой интерфейс
    ip=$(ip route get 8.8.8.8 2>/dev/null | awk 'NR==1 {print $7}')
    if [[ -n "$ip" && "$ip" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo "$ip"
        return
    fi
    
    # 3. Первый IP из ip addr
    ip=$(ip addr show 2>/dev/null | grep 'inet ' | grep -v '127.0.0.1' | head -1 | awk '{print $2}' | cut -d'/' -f1)
    if [[ -n "$ip" && "$ip" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo "$ip"
        return
    fi
    
    # 4. hostname -I (последний вариант)
    ip=$(hostname -I 2>/dev/null | awk '{print $1}')
    if [[ -n "$ip" && "$ip" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo "$ip"
        return
    fi
    
    # Если ничего не получилось
    echo ""
}

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

# Обновляем CNA скрипты с C2 IP
if [[ -d "$PROJECT_DIR/cna-scripts" ]]; then
    echo "🌐 Обновляем C2 IP в CNA скриптах..."
    
    # Определяем текущий IP
    CURRENT_IP=$(get_current_ip)
    if [[ -z "$CURRENT_IP" ]]; then
        echo "⚠️  Не удалось определить IP, используем 192.168.1.17"
        CURRENT_IP="192.168.1.17"
    fi
    
    echo "🎯 Используем C2 IP: $CURRENT_IP"
    
    for cna_file in "$PROJECT_DIR/cna-scripts/"*.cna; do
        if [[ -f "$cna_file" ]]; then
            echo "🔧 Обновляем $(basename "$cna_file")"
            
            # Backup
            cp "$cna_file" "$cna_file.backup.$(date +%Y%m%d_%H%M%S)"
            
            # Обновляем IP
            sed -i "s|%akuma_config\[\"c2_server\"\] = \"[^\"]*\"|%akuma_config[\"c2_server\"] = \"$CURRENT_IP\"|g" "$cna_file"
            sed -i "s|%rapid_config\[\"c2_server\"\] = \"[^\"]*\"|%rapid_config[\"c2_server\"] = \"$CURRENT_IP\"|g" "$cna_file"
            
            echo "   ✅ C2 IP обновлен на: $CURRENT_IP"
        fi
    done
fi

echo ""
echo "🎉 Готово! Все пути и IP адреса обновлены для директории: $PROJECT_DIR"
echo "📋 Результат:"
echo "   \$CC2_PATH = \"$PROJECT_DIR/genCrossC2.Linux\""
echo "   \$CC2_BIN = \"$PROJECT_DIR/genCrossC2.MacOS\""
if [[ -d "$PROJECT_DIR/cna-scripts" ]]; then
    echo "   C2 Server IP = \"$CURRENT_IP\" (во всех CNA скриптах)"
fi
echo ""
echo "💡 Tip: Теперь можешь спокойно таскать проект куда угодно!"
echo "    Просто запускай этот скрипт после переноса."
echo ""
echo "🤘 Как говорил мой дед: 'Хардкод — это как татуировка с именем бывшей: казалось хорошей идеей, а потом только головная боль!'"
