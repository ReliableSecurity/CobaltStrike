# AKUMA CrossC2 Linux Post-Exploitation Scripts

## 🔥 CrossC2 Compatible Release v4.0

Эти скрипты предназначены для работы с **CrossC2Kit** и используют правильный тип popup меню `popup ssh` для SSH beacon'ов.

## 📁 Файлы

### Основные скрипты
- `akuma_crossc2_menu.cna` - **Основной скрипт с полным функционалом и popup меню**
- `test_crossc2_popup.cna` - **Тестовый скрипт для диагностики menu**

### Старые версии (для обычных beacon'ов)
- `akuma_working_menu.cna` - Для стандартных beacon'ов (popup beacon_bottom)
- `akuma_linux_postex.cna` - Основные команды без меню
- `akuma_rapid_deployment.cna` - Быстрое развертывание без меню

## 🚀 Инструкции по загрузке для CrossC2

### Шаг 1: Тестирование popup меню

1. Откройте **Cobalt Strike** с загруженным **CrossC2Kit**
2. Убедитесь, что у вас есть активный SSH beacon через CrossC2
3. В **Script Manager** загрузите `test_crossc2_popup.cna`
4. **Правой кнопкой** кликните на SSH beacon в списке beacon'ов
5. Должно появиться меню **"TEST: CrossC2 Menu"**
6. Выберите **"Hello AKUMA"** для теста

### Шаг 2: Если тестовое меню работает

1. **Выгрузите** тестовый скрипт из Script Manager
2. Загрузите основной скрипт `akuma_crossc2_menu.cna`
3. Правой кнопкой на SSH beacon - должно появиться меню **"AKUMA Linux PostEx"**

### Шаг 3: Если тестовое меню НЕ работает

Проблема может быть в:
- Неправильном типе beacon'а (нужен именно SSH beacon через CrossC2)
- Конфликте с другими загруженными скриптами
- Версии Cobalt Strike/CrossC2Kit

**Решения:**
1. Убедитесь, что beacon - это SSH через CrossC2, а не обычный HTTP/HTTPS
2. Попробуйте перезагрузить Script Manager
3. Отключите другие CNA скрипты временно
4. Проверьте Event Log на ошибки

## 🎯 Функциональность AKUMA CrossC2 Menu

### Быстрые операции
- **Quick Foothold (2min)** - Быстрое закрепление за 2 минуты
- **Full Deployment (5min)** - Полное развертывание за 5 минут

### Разведка (Reconnaissance)
- **System Enumeration** - Сбор информации о системе
- **Network Discovery** - Обнаружение сети
- **Privilege Escalation Enum** - Поиск путей эскалации привилегий

### Постоянство (Persistence)
- **Install Cron Backdoors** - Установка cron backdoor'ов
- **SSH Key Backdoor** - Установка SSH ключей для доступа

### Сбор данных (Data Collection)
- **Sensitive File Hunt** - Поиск чувствительных файлов
- **Credential Harvest** - Сбор паролей и секретов

### Утилиты
- **Cleanup & Stealth** - Очистка следов
- **Show Configuration** - Показать текущую конфигурацию
- **Set C2 Server IP** - Настроить IP сервера C2

## 💻 Command Line использование

Вы также можете использовать команды напрямую в SSH beacon:

```bash
akuma_quick    # Быстрое закрепление
akuma_full     # Полное развертывание
akuma_enum     # Перечисление системы
akuma_persist  # Только механизмы постоянства
akuma_creds    # Только сбор учетных данных
```

## ⚙️ Конфигурация

В начале скрипта `akuma_crossc2_menu.cna` настройте:

```javascript
%akuma_config = %(
    c2_server => "192.168.1.100",           // IP вашего C2 сервера
    backup_ports => @(4444, 5555, 6666, 7777, 8888),  // Порты для обратных подключений
    ssh_key => "ssh-rsa AAAAB3NzaC1yc2E...",          // Ваш SSH публичный ключ
    callback_port => 4444                              // Основной порт обратного вызова
);
```

## 🔧 Устранение неполадок CrossC2

### Меню не появляется
1. **Проверьте тип beacon'а**: Должен быть SSH через CrossC2
2. **Проверьте статус beacon'а**: Должен быть онлайн (зеленый)
3. **Перезагрузите скрипт**: Unload → Load в Script Manager
4. **Проверьте Event Log**: На наличие ошибок CNA

### Команды не выполняются
1. **Beacon должен быть активным**
2. **Проверьте права пользователя** на целевой системе
3. **Сетевые ограничения** могут блокировать обратные подключения

### Конфликты с CrossC2Kit
1. **Временно отключите** другие CNA скрипты
2. **Загружайте AKUMA скрипты после** CrossC2Kit
3. **Используйте отдельный профиль** Cobalt Strike если нужно

## 📊 Совместимость

- ✅ **CrossC2Kit SSH beacons**
- ✅ **Cobalt Strike 4.0+**
- ✅ **Linux targets** (Ubuntu, CentOS, Debian, etc.)
- ⚠️ **Требует активный SSH beacon через CrossC2**

## 🛡️ Примечания по безопасности

- Используйте только в **авторизованных пентестах**
- **Очистите следы** после тестирования командой "Cleanup & Stealth"
- **Удалите установленные backdoor'ы** после завершения теста
- **Не оставляйте persistence** в продакшн системах

## 🔄 История версий

- **v4.0** - Добавлена поддержка CrossC2 popup ssh меню
- **v3.0** - Стабилизированные скрипты без ошибок синтаксиса
- **v2.0** - Добавлены popup меню для стандартных beacon'ов
- **v1.0** - Базовые команды без меню

---

**Автор**: AKUMA Team  
**Совместимость**: CrossC2Kit + Cobalt Strike  
**Последнее обновление**: Август 2024
