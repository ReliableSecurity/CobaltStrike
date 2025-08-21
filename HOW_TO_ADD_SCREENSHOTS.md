# 📸 Как добавить скриншоты в репозиторий

## 🚀 Быстрый способ

### 1. Создай скриншоты
Сделай скриншоты следующих экранов в CobaltStrike:

- ✅ **Успешное подключение** (главное окно с активным beacon'ом)
- ✅ **Event Log с загруженными скриптами** (сообщения о CrossC2)  
- ✅ **Окно создания CrossC2 listener'а** (как у тебя на скрине)
- ✅ **Меню CrossC2** (показать доступное меню)

### 2. Скопируй скриншоты в проект
```bash
# Перейди в папку проекта
cd /home/akuma/Documents/CobaltStrike

# Скопируй твои скриншоты с нужными именами
cp /path/to/your/connection_screenshot.png screenshots/01_successful_connection.png
cp /path/to/your/scripts_loaded.png screenshots/02_crossc2_loaded.png  
cp /path/to/your/listener_creation.png screenshots/03_crossc2_listener.png
cp /path/to/your/crossc2_menu.png screenshots/04_crossc2_menu.png
```

### 3. Запуши в репозиторий
```bash
git add screenshots/
git commit -m "📸 Added deployment screenshots - visual proof of successful setup"
git push
```

## 🎯 Пример команды для твоих скриншотов

Если твои скриншоты лежат на рабочем столе:
```bash
cd /home/akuma/Documents/CobaltStrike

# Замени имена файлов на свои
cp ~/Desktop/cobalt_connection.png screenshots/01_successful_connection.png
cp ~/Desktop/scripts_loaded.png screenshots/02_crossc2_loaded.png
cp ~/Desktop/listener_window.png screenshots/03_crossc2_listener.png  
cp ~/Desktop/crossc2_menu.png screenshots/04_crossc2_menu.png

# Проверь что файлы скопировались
ls -la screenshots/

# Добавь в git
git add screenshots/
git commit -m "📸 Added deployment screenshots showing working CobaltStrike + CrossC2 setup"
git push
```

## 📋 Что должно быть на скриншотах

### 01_successful_connection.png
- Главное окно CobaltStrike
- Подключенный клиент (твой username)
- Активный beacon (как akuma@7849j)
- IP адрес сервера виден

### 02_crossc2_loaded.png
- Event Log с сообщениями
- Строки типа: "*** akuma has joined."
- Сообщения о genCrossC2 beacon
- Подтверждение загрузки скриптов

### 03_crossc2_listener.png
- Окно создания CrossC2 listener'а
- Настройки host, port, arch
- Профиль и SSL опции
- Как на твоем скриншоте! 

### 04_crossc2_menu.png
- Главное меню с пунктом "CrossC2"
- Подменю "generator"
- Доказательство что меню доступно

## 🔥 После добавления

После того как запушишь скриншоты:
1. Проверь что они появились в репозитории
2. Ссылки в README.md будут работать
3. Документация станет наглядной и профессиональной

---

**AKUMA says:** *"Картинка стоит тысячи строк кода - добавь скрины и покажи что твой setup реально работает!"* 📸🔥
